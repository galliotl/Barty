// external dependencies
import { Request, Response } from "express";
import * as bcrypt from "bcryptjs";

// local
import { createToken } from "../utils/tokenHelpers";
import { sendConfirmationCode } from "../utils/coreFunctions";
import { verifyMandatoryParams } from "../middleware";
import User from "../db/models/user";
import { verifyRegexPhone } from "../utils/regex";

/**
 * This file, to the difference of auth, contains
 * the Creation, Read, Update, Deletion (CRUD) behaviour
 * of the user making the request.
 * 
 * It is widely different from the users file. This file
 * won't be used for admin purposes.
 * 
 * Its route, much like login don't need to be protected
 */

/**
 * This route is used for the app to send the phone number.
 * We have to:
 * - verify that this user isn't already signed up
 * - add the phone to the db
 * - send a 4 digit code via SMS (v2)
 * - send this same code back to the app so the app can confirm the phone number or not
 * - also send a signup token so the app can send all the information at the end of the signup
 */
const signupPhoneController = async (req: Request, res: Response) => {
  const phone = req.body.phone;
  if (!phone) return res.status(400).send("phone isn't filled");
  //Check if the phone does correspond to the pohone regex
  if (!verifyRegexPhone(phone))
    return res.status(400).send("this is not a phone number");

  try {
    const confirmationCode = sendConfirmationCode(phone);
    const token = await createToken(phone);
    const user = new User({ phone, confirmationCode });
    await user.save();
    return res.status(200).json({
      token,
      confirmationCode
    });
  } catch (err) {
    return res.status(500).send(err);
  }
};

/**
 * This route is used to signup a user. We require a password,
 * name, an age verification check
 * and token from the token we deduce the phone.
 *
 * The token is used because it proves that the phone
 * was already verified before. The new token is based on the
 * user's id
 */
const userSignupController = async (req: Request, res: Response) => {
  if (
    !verifyMandatoryParams(
      ["password", "name", "isMajor", "confirmationCode"],
      req.body
    )
  ) {
    return res.status(400).send("wrong params sent to input");
  }
  let { password, name, isMajor, confirmationCode } = req.body;

  // In the token for signup is the phone
  const phone = req.body.tokenData;
  password = await bcrypt.hash(password, 10);

  const user = await User.findOne({ phone });
  if (!user) return res.status(422).send("No user found");
  if (!user.confirmationCode) return res.status(422).send("Already signed up");
  if (confirmationCode !== user.confirmationCode)
    return res.status(422).send("Confirmation code doesn't match");
  try {
    await user.updateOne({
      confirmationCode: null,
      isMajor,
      isPhoneConfirmed: true,
      name,
      password
    });
    const token = await createToken(user.id);
    return res.status(200).json({ token });
  } catch (err) {
    return res.status(500).send(err);
  }
};

/**
 * This route gets user data and sends back a jwt token.
 * This token will have to be used in every requests.
 */
const loginController = async (req: Request, res: Response) => {
  const { phone, password } = req.body;
  // verify user is correctly filled
  if (!verifyMandatoryParams(["phone", "password"], req.body)) {
    return res.status(400).send("missing mandatory parameter");
  }

  const user = await User.findOne({ phone });

  if (!user) return res.status(422).send("No user have this phone");

  if (await bcrypt.compare(password, user.password)) {
    try {
      const token = await createToken(user.id);
      return res.status(200).json({ token });
    } catch (err) {
      return res.status(500).send(err);
    }
  } else return res.status(422).send("wrong password");
};

/**
 * This route is used to fetch the user's own data. All the work is done
 * by the middlewares, we just have to send the data back
 */
const selfDataController = async (req: Request, res: Response) => {
  return res.status(200).send({ user: req.body.user });
};

export default {
  loginController,
  selfDataController,
  signupPhoneController,
  userSignupController
};
