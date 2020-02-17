// external libs
import { Request, Response, NextFunction } from "express";

// local libs
import User from "./db/models/user";
import { getTokenData } from "./tokenHelpers";
import { request } from "http";

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
      ? req.headers["authorization"] != null
      : req.body.token;

  if (typeof bearerHeader !== "undefined") {
    const bearer = bearerHeader.split(" ");
    const bearerToken = bearer[1];

    // Set the token in the request's body for conveinience
    req.body.token = bearerToken;
    try {
      req.body.tokenData = await getTokenData(bearerToken);
    } catch (err) {
      return res.status(403).send("malformed token");
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
