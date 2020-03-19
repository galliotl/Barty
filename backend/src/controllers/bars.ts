// external libraries
import * as express from "express";

// local libraries
import Bar from "../db/models/bar";
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
  if (
    !verifyMandatoryParams(
      [
        "name",
        "photoUrl",
        "address",
        "events",
        "beverages",
        "description",
        "phone",
        "mail",
        "openingHour",
        "closingHour"
      ],
      req.body
    )
  ) {
    return res.status(400).send("wrong params entered");
  }

  try {
    const bar = new Bar(req.body);
    await bar.save();
    return res.status(200).send({ id: bar.id });
  } catch {
    return res.status(500).send("cannot create bar");
  }
};

/**
 * Takes the given id and removes the associated bar
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
