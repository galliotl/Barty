// external libraries
import * as express from 'express';
import * as mongoose from 'mongoose';

// internal libraries
import auth from './controllers/auth';
import bars from './controllers/bars';
import users from './controllers/users';
import {
  verifyToken,
  verifyAuth,
  verifyAuthBar,
  verifyBarParameters,
} from './middleware';

const uri = 'mongodb://db:27017/barty';
mongoose.connect(uri, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

const app: express.Application = express();

app.use(express.json());

/**
 * Auth routes
 */
app.get('/user/self', verifyToken, verifyAuth, auth.selfDataController);
app.post('/users/login', auth.loginController);
app.post('/users/signup', verifyToken, auth.userSignupController);
app.post('/users/signup/phone', auth.signupPhoneController);

/**
 * Users routes
 */
app
  .route('/users/:userId?')
  .delete(verifyToken, verifyAuthBar, users.deleteUserController)
  .get(verifyToken, verifyAuthBar, users.getUserController)
  .put(verifyToken, verifyAuthBar, users.updateUserController);

/**
 * Bar routes
 */
app
  .route('/bars')
  .delete(verifyToken, verifyAuthBar, bars.deleteBarController)
  .get(verifyToken, verifyAuthBar, bars.getBarController) // Check if works
  .post(verifyBarParameters, bars.createBarController)
  .put(verifyToken, verifyAuthBar, bars.updateBarController); // Check if works
app.post('/confirmation', bars.confirmationMail); //verifier l'adresse mail

app.listen(3000, () => console.log('running...'));
