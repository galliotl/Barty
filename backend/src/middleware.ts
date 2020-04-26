// external libs
import { Request, Response, NextFunction } from 'express';

// local libs
import UserModel from './db/models/user';
import BarModel from './db/models/bar';
import { verifyRegexPhone, verifyRegexMail } from './utils/regex';
import { getTokenData } from './utils/tokenHelpers';

/**
 * This middleware function verifies the presence of a
 * bearer token then puts it in the request object alongside
 * its data
 * @param req -> http request
 * @param res -> http response
 * @param next -> next middleware to be executed
 */
export const verifyToken = async (
  req: Request,
  res: Response,
  next: NextFunction,
) => {
  const bearerHeader =
    req.headers.authorization != null
      ? req.headers.authorization
      : req.body.token;
  if (typeof bearerHeader === 'string') {
    const bearer = bearerHeader.split(' ');
    const bearerToken = bearer[1];

    // Set the token in the request's body for conveinience
    req.body.token = bearerToken;
    try {
      req.body.tokenData = await getTokenData(bearerToken);
    } catch (err) {
      return res.status(403).send(err);
    }
    return next();
  }
  // Forbidden
  return res.status(403).send('no token');
};

/**
 * This function takes the request, then verify that the
 * auth token is associated with an actual user in the db,
 * then puts the user in the request
 * @param req -> http request
 * @param res -> http response
 * @param next -> next middleware to be executed
 */
export const verifyAuth = async (
  req: Request,
  res: Response,
  next: NextFunction,
) => {
  // Set here by previous middleware
  const { tokenData } = req.body;
  try {
    const user = await UserModel.findById(tokenData);
    if (!user) return res.status(403).send("user doesn't exist");

    req.body.user = user;
    return next();
  } catch (err) {
    return res.status(500).send(err);
  }
};

/**
 * Exactly the same function but for the bars
 * Actually the difference is that the token comes from the email instead of phone
 */
export const verifyAuthBar = async (
  req: Request,
  res: Response,
  next: NextFunction,
) => {
  // Set here by previous middleware
  const { tokenData } = req.body;
  try {
    const bar = await BarModel.findOne({ mail: tokenData });
    if (!bar) return res.status(403).send("bar doesn't exist");

    req.body.bar = bar;
    return next();
  } catch (err) {
    return res.status(500).send(err);
  }
};

/**
 * This middleware verify if the different paramerters
 * required for a bar creation coorespond to their regex
 * @param req
 * @param res
 * @param next
 */
export const verifyBarParameters = async (
  req: Request,
  res: Response,
  next: NextFunction,
) => {
  try {
    const bar = req.body;
    if (!bar) return res.status(403).send("bar doesn't exist");
    const { phone } = bar;
    if (!verifyRegexPhone(phone)) {
      return res.status(403).send('this is not a phone number');
    }
    const { mail } = bar;
    if (!verifyRegexMail(mail)) {
      return res.status(403).send('this is not a mail address');
    }
    req.body.bar = bar;
    return next();
  } catch (err) {
    return res.status(500).send(err);
  }
};

/**
 * This function verifies the presence of some mandatory
 * parameters in the request and returns an error otherwise
 * @param mandatoryParams -> a list of the mandatory params
 * @param body -> the function body
 */
export const verifyMandatoryParams = (
  mandatoryParams: Array<string>,
  body: any,
): Boolean => {
  return !mandatoryParams.some((param) => !body[param]);
};
