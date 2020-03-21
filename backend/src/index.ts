// external libraries
import * as express from "express";
import * as bcrypt from "bcryptjs";
import * as mongoose from "mongoose";

// internal libraries
import auth from "./controllers/auth";
import bars from "./controllers/bars";
import tim from "./controllers/tim";
import { verifyToken, verifyAuth } from "./middleware";

const uri = "mongodb://db:27017/barty";
mongoose.connect(uri, {
  useNewUrlParser: true,
  useUnifiedTopology: true
});

const app: express.Application = express();

app.use(express.json());

/**
 * Auth routes
 */
app.get("/user/self", verifyToken, verifyAuth, auth.selfDataController);
app.post("/users/login", auth.loginController);
app.post("/users/signup", verifyToken, auth.userSignupController);
app.post("/users/signup/phone", auth.signupPhoneController);

/**
 * Bar routes
 */
app.delete("/bars", verifyToken, verifyAuth, bars.deleteBarController);
app.get("/bars", verifyToken, verifyAuth, bars.getBarController);
app.post("/bars", verifyToken, verifyAuth, bars.createBarController);
app.put("/bars", verifyToken, verifyAuth, bars.updateBarController);

/**
 * Tim routes
 */
app.get("/tim", verifyToken, tim.getTimController);

app.listen(3000, () => console.log("running..."));
