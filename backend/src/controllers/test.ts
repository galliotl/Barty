// external libraries
import * as express from "express";

// local libraries
import { verifyMandatoryParams } from "../middleware";

const testToken = async (
    req: express.Request,
    res: express.Response
  ) => {
    return res.status(200).send({ Message: "This Token passed the Token verification" });
  };

  export default{
      testToken
  };