// external libraries
import * as express from "express";
import * as bcrypt from "bcryptjs";
import * as mongoose from "mongoose";

// internal libraries
import { verifyToken, verifyAuth } from "./middleware";
import { sendConfirmationCode } from "./coreFunctions";
import { createToken } from "./tokenHelpers";
import User from "./db/models/user";

const uri = "mongodb://db:27017/barty";
mongoose.connect(uri, {
  useNewUrlParser: true,
  useUnifiedTopology: true
});

const app: express.Application = express();

app.use(express.json());

/**
 * This route returns a user related to the given phone in query params
 */
app.get(
  "/users",
  verifyToken,
  verifyAuth,
  async (
    req: express.Request,
    res: express.Response,
    next: express.NextFunction
  ) => {
    if (req.query.phone == null) {
      return res.status(422).send({ error: "User's phone not filled" });
    }

    try {
      const user = {
        phone: req.query.phone
      };
      const result = await User.findOne(user);
      return res.send({ result: result });
    } catch {
      return res.status(500).send("cannot fetch");
    }
  }
);

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

app.post("/users/signup", verifyToken, async (req, res) => {
  let { phone, password, name } = req.body;
  if (!phone || !password)
    return res.status(422).send("password or phone is undefined");
  password = await bcrypt.hash(password, 10);
  const user = new User({ phone, password, name });

  try {
    await user.save();
  } catch {
    return res.status(422).send("user already exists");
  }
  try {
    const token = await createToken(phone);
    return res.json({ token });
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

app.listen(3000, () => console.log("running..."));
