// external libs
import { Request, Response, NextFunction } from "express";

// local libs
import User from "./db/models/user";
import { getTokenData } from "./utils/tokenHelpers";

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
  next: NextFunction
) => {
  const bearerHeader =
    req.headers["authorization"] != null
      ? req.headers["authorization"]
      : req.body.token;

  if (typeof bearerHeader === "string") {
    const bearer = bearerHeader.split(" ");
    const bearerToken = bearer[1];

    // Set the token in the request's body for conveinience
    req.body.token = bearerToken;
    try {
      req.body.tokenData = await getTokenData(bearerToken);
    } catch (err) {
      return res.status(403).send(err);
    }
    return next();
  } else {
    // Forbidden
    return res.status(403).send("no token");
  }
};

/**
 * This function takes the request, then verify that the
 * auth token is associated with an actual User in the db,
 * then puts the user in the request
 * @param req -> http request
 * @param res -> http response
 * @param next -> next middleware to be executed
 */
export const verifyAuth = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  // Set here by previous middleware
  const tokenData = req.body.tokenData;
  try {
    const user = await User.findOne(tokenData);
    if (typeof user === "undefined")
      return res.status(403).send("user doesn't exist");
    else {
      req.body.user = user;
      return next();
    }
  } catch (err) {
    return res.status(500).send(err);
  }
};

/**
 * This function verifies the presence of some mandatory
 * parameters in the request and returns an error otherwise
 * @param mandatoryParams  -> a list of the mandatory params
 * @param body -> the function body
 */
export const verifyMandatoryParams = (
  mandatoryParams: Array<string>,
  body: any
): Boolean => {
  mandatoryParams.forEach(param => {
    if (!body[param]) {
      return false;
    }
  });
  return true;
};