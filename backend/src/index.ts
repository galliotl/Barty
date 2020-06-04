// external libraries
import * as express from 'express';
import * as mongoose from 'mongoose';

// internal libraries
import auth from './controllers/auth';
import bars from './controllers/bars';
import CRUDController from './controllers/crud';
import {
  verifyToken,
  verifyAuth,
  verifyAuthBar,
  verifyBarParameters,
} from './middleware';
import UserModel from './db/models/user';
import EventModel from './db/models/event';

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
const userController = new CRUDController(UserModel, 'user');
app
  .route('/users/:id?')
  .delete(verifyToken, verifyAuth, userController.deleteController)
  .get(verifyToken, verifyAuth, userController.getController)
  .put(verifyToken, verifyAuth, userController.putController);

/**
 * Events routes
 */
const eventController = new CRUDController(EventModel, 'event');
app
  .route('/events/:id?')
  .post(verifyToken, verifyAuth, eventController.postController)
  .delete(verifyToken, verifyAuth, eventController.deleteController)
  .get(verifyToken, verifyAuth, eventController.getController)
  .put(verifyToken, verifyAuth, eventController.putController);

/**
 * Bar routes
 */
app
  .route('/bars')
  .delete(verifyToken, verifyAuthBar, bars.deleteBarController)
  .get(verifyToken, verifyAuthBar, bars.getBarController) // Check if works
  .post(
    verifyToken,
    verifyAuthBar,
    verifyBarParameters,
    bars.createBarController,
  )
  .put(verifyToken, verifyAuthBar, bars.updateBarController); // Check if works
app.post('/confirmation', bars.confirmationMail); // verify mail adress
app.post('/bars/login', bars.loginBarController);

app.listen(3000, () => console.log('running...'));
