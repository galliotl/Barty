// external libraries
import * as express from "express";
import * as bcrypt from "bcryptjs";

// local libraries
import Bar from "../db/models/bar";
import { verifyMandatoryParams } from "../middleware";
import {verifyBeverageCategory} from '../utils/barFunctions';
import * as beverage from "../db/models/beverage";
import { createToken } from "../utils/tokenHelpers";


/**
 * Creates a bar
 * Verifies that the mandatory params are present in the request.body
 * then passes it to the mangoose object to create one.
 */
const createBarController = async (
  req: express.Request,
  res: express.Response
) => {
  let { name, password, photoUrl, address, phone, mail, description, openingHour, closingHour, beverages } = req.body;

  if (
    !verifyMandatoryParams(
      [
        "name",
        "password",
        "photoUrl",
        "address",
        "phone",
        "mail",
        "description",
        "openingHour",
        "closingHour",
        "beverages"      
      ],
      req.body
    )
  ) {
    return res.status(400).send("wrong params entered");
  }
  //check if the beverages categories does exist
  let shouldContinue = true;
  if(req.body.beverages != undefined){
    let arrayOfBeverages : [beverage.Beverage] = req.body.beverages;
    arrayOfBeverages.forEach(e => {
      if(!verifyBeverageCategory(e.category)) {
        shouldContinue=false;
        return res.status(400).send("this beverage category doesn't exist");
      }
    });
  }
  if(shouldContinue){
    //hash the password
    password = await bcrypt.hash(password, 10);
    //create and save the object
    try {
      const bar = new Bar({
        name,
        password,
        photoUrl,
        address,
        phone,
        mail, 
        description,
        openingHour,
        closingHour,
        beverages
      });
      await bar.save();
      //TODO Check if the bar already exists
      //TODO implement a way to verify email
      //Create the token from the mail
      const token = await createToken(bar.mail);
      const id = bar.id;
      //Return the id and the token
      return res.status(200).json({ id , token});
    } catch (err) {
      return res.status(500).send(err);
    }
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
    const bar = await Bar.findById(id);
    if (bar) return res.status(200).send({ bar });
    else return res.status(422).send("This bar doesn't exist");
  } catch (err) {
    return res.status(500).send(err);
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
