// external libraries
import * as express from "express";
import * as bcrypt from "bcryptjs";

// local libraries
import Bar from "../db/models/bar";
import * as AdressBar from "../db/models/adressBar";
import { verifyMandatoryParams } from "../middleware";


/**
 * Creates a bar
 * Verifies that the mandatory params are present in the request.body
 * then passes it to the mangoose object to create one.
 */
const createBarController = async (
  req: express.Request,
  res: express.Response
) => {
  
  let { name, password, photoUrl, adress, description, mail } = req.body;

  if (
    !verifyMandatoryParams(
      [
        "name",
        "password",
        "photoUrl",
        "adress",
        //"events",
        //"beverages",//TODO uncomment beverages, openingHour and ClosingHour after creating beverages and times model
        "description",
        //"phone",
        "mail"//,
        //"openingHour",
        //"closingHour"
      ],
      req.body
    )
  ) {
    return res.status(400).send("wrong params entered");
  }

  const phone = req.body.tokenData;
  password = await bcrypt.hash(password, 10);
  try {
    const bar = new Bar({ name, password, photoUrl, adress, phone, description, mail });
    await bar.save();
    return res.status(200).json({ token: req.body.token, id: bar.id });
  } catch {
    return res.status(500).send("cannot create bar");
  }
};

/**
 * Takes the given id and return the associated bar
 */
const getBarController = async (
  req: express.Request,
  res: express.Response
) => {
  const { id } = req.query;
  if (!verifyMandatoryParams(["id"], req.query)) {
    return res.status(422).send("missing mandatory params");
  }
  try {
    const bar = Bar.findById(id);
    return res.status(200).send({ bar: bar });
  } catch {
    return res.status(500).send("couldn't retreive this bar");
  }
};

/**
 * Removes a bar given its id
 */
const deleteBarController = async (
  req: express.Request,
  res: express.Response
) => {
  const { id } = req.body;
  if (!verifyMandatoryParams(["id"], req.body)) {
    return res.status(422).send("missing mandatory params");
  }
  try {
    await Bar.findByIdAndDelete(id);
    return res.status(200).send("removed");
  } catch {
    return res.status(500).send("couldn't remove");
  }
};

/**
 * Updates a bar
 */
const updateBarController = async (
  req: express.Request,
  res: express.Response
) => {
  const { id } = req.body;
  delete req.body.id;
  try {
    const bar = await Bar.findById(id);
    bar.update(req.body);
    bar.save();
    return res.status(200).send({ newBar: bar.toJSON() });
  } catch (err) {
    return res.status(500).send("couldn't update");
  }
};

export default {
  createBarController,
  deleteBarController,
  getBarController,
  updateBarController
};
