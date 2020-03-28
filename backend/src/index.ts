// external libraries
import * as express from "express";
import * as mongoose from "mongoose";

// internal libraries
import auth from "./controllers/auth";
import bars from "./controllers/bars";
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
app
  .route("/bars")
  .delete(verifyToken, verifyAuth, bars.deleteBarController)
  .get(verifyToken, verifyAuth, bars.getBarController)
  .post(verifyToken, verifyAuth, bars.createBarController)
  .put(verifyToken, verifyAuth, bars.updateBarController);

app.listen(3000, () => console.log("running..."));
