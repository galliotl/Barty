// external libraries
import * as express from "express";
import * as bcrypt from "bcryptjs";
import * as mongoose from "mongoose";

// internal libraries
import { verifyToken, verifyAuth } from "./middleware";
import { sendConfirmationCode } from "./coreFunctions";
import { createToken, getTokenData } from "./tokenHelpers";
import User from "./db/models/user";

const uri = "mongodb://db:27017/barty";
mongoose.connect(uri, {
  useNewUrlParser: true,
  useUnifiedTopology: true
});

const app: express.Application = express();

app.use(express.json());

/**
 * This route is used for the app to send the phone number.
 * We have to:
 * - verify that this user isn't already signed up
 * - send a 4 digit code via SMS (v2)
 * - send this same code back to the app so the app can confirm the phone number or not
 * - also send a signup token so the app can send all the information at the end of the signup
 */
app.post(
  "/users/signup/phone",
  async (req: express.Request, res: express.Response) => {
    const phone = req.body.phone;
    if (!phone) return res.status(422).send("phone isn't filled");

    // Ask the db about the user
    const user = await User.findOne({
      phone
    }).exec();

    // The user already exists
    if (user) return res.status(422).send("user already exists");

    const confirmationCode = sendConfirmationCode(phone);

    // create the signup token
    try {
      const token = await createToken(phone);
      return res.json({
        token,
        confirmationCode
      });
    } catch (err) {
      return res.status(500).send(err);
    }
  }
);

/**
 * This route is used to signup a user. We require a password,
 * name, an age verification check
 * and token from the token we deduce the phone.
 *
 * The token is used because it proves that the phone
 * was already verified before
 */
app.post("/users/signup", verifyToken, async (req, res) => {
  let { password, name, isMajor, isPhoneConfirmed } = req.body;

  if (!password || !name || !isMajor || !isPhoneConfirmed) {
    return res.status(422).send("wrong params sent to input");
  }

  const phone = req.body.tokenData;
  password = await bcrypt.hash(password, 10);
  const user = new User({ phone, password, name, isMajor, isPhoneConfirmed });

  try {
    await user.save();
  } catch {
    return res.status(500).send("Cannot save the user");
  }
  try {
    // we return the same token as a login token to the app
    return res.json({ token: req.body.token });
  } catch {
    return res.status(500).send("cannot create token");
  }
});

/**
 * This route gets user data and sends back a jwt token.
 * This token will have to be used in every requests.
 */
app.post(
  "/users/login",
  async (req: express.Request, res: express.Response) => {
    const { phone, password } = req.body;
    // verify user is correctly filled
    if (!phone || !password)
      return res.status(422).send("user isn't filled properly");

    const dbUser = await User.findOne({ phone: phone });

    if (!dbUser) return res.status(422).send("No user have this phone");

    if (await bcrypt.compare(password, dbUser.password)) {
      try {
        const token = await createToken(phone);
        return res.json({ token });
      } catch (err) {
        return res.status(500).send(err);
      }
    } else return res.status(422).send("wrong password");
  }
);

/**
 * This route is used to fetch the user's own data. All the work is done
 * by the middlewares, we just have to send the data back
 */
app.get(
  "/user/self",
  verifyToken,
  verifyAuth,
  async (req: express.Request, res: express.Response) => {
    return req.body.user
  }
)

app.listen(3000, () => console.log("running..."));
