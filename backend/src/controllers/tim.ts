import * as express from "express";
import { verifyMandatoryParams } from "../middleware";

const getTimController = async (
  req: express.Request,
  res: express.Response
) => {
  res.status(200).send("Salut BoT");
};

export default { getTimController };
