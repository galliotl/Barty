// external libraries
import * as express from "express";

// local libraries
import { verifyMandatoryParams } from "../middleware";

const testMessage = async (
    req: express.Request,
    res: express.Response
  ) => {
    return res.status(200).send({ Message: "This is a secret message" });
  };

  export default{
      testMessage
  };