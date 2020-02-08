// external libs
import { Request, Response, NextFunction } from "express";

// local libs
import User from "./db/models/user";
import { getTokenData } from "./tokenHelpers";

export const verifyToken = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const bearerHeader = req.headers["authorization"];

  if (typeof bearerHeader !== "undefined") {
    const bearer = bearerHeader.split(" ");
    const bearerToken = bearer[1];

    // Set the token in the request's body for conveinience
    req.body.token = bearerToken;
    next();
  } else {
    // Forbidden
    res.status(403).send("no token");
  }
};

export const verifyAuth = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  // Set here by previous middleware
  const token = req.body.token;
  try {
    const tokenData = await getTokenData(token);
    const user = await User.findOne(tokenData);
    if (typeof user === "undefined")
      return res.status(403).send("user doesn't exist");
    else return next();
  } catch (err) {
    return res.status(500).send(err);
  }
};
