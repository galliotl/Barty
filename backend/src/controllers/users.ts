/**
 * This file, to the difference of auth, contains
 * the Read, Update, Deletion (RUD) behaviour
 * of the user entity. Creation is made by
 * signing up
 *
 * This can be used for admin purposes.
 *
 * Each route should be protected with a middleware
 */

// external dependencies
import { Request, Response } from "express";

// local
import User from "../db/models/user";
import { paginationLimit } from "../config";

/**
 * Controlls the get behaviour of the users route.
 * It is either a multiple fetch if a userId is specified
 * or a total fetch if not
 */
const getUserController = async (req: Request, res: Response) => {
  if (req.params.userId) return getSingleUser(req, res);
  else if (req.body.ids || req.query.ids) return getUsersFromIds(req, res);
  else if (req.query.offset) return getAllUsersPaginated(req, res);
  else return getAllUsers(req, res);
};

/**
 * Retreives a single user, given its id in params:
 * /users/:userId ex: users/2393020392030
 */
export const getSingleUser = async (req: Request, res: Response) => {
  try {
    const user = await User.findById(req.params.userId).exec();
    if (!user) return res.status(422).send("user doesn't exist");
    return res.status(200).json({ user });
  } catch (err) {
    return res.status(500).send(err);
  }
};

/**
 * Retreives all users corresponding to a list of user ids given
 * in the queryparams: users/?ids=2133,321,2234,232...
 */
export const getUsersFromIds = async (req: Request, res: Response) => {
  const ids = req.query.ids ? req.query.ids.split(",") : req.body.ids;
  try {
    const users = await User.find()
      .where("_id")
      .in(ids)
      .exec();
    return res.status(200).json({ users });
  } catch (err) {
    return res.status(500).send(err);
  }
};

/**
 * Retreives all the users with a pagination offset/limit
 */
export const getAllUsersPaginated = async (req: Request, res: Response) => {
  const offset = parseInt(req.query.offset);
  const limit = req.query.offset ? parseInt(req.query.offset) : paginationLimit;
  // a list of comma separated ids in the query
  try {
    const users = await User.find({})
      .skip(offset)
      .limit(limit)
      .exec();
    return res.status(200).json({ users, offset, limit });
  } catch (err) {
    return res.status(500).send(err);
  }
};

/**
 * Retreives all the users without pagination
 * ! watchout this will be super heavy when all
 * ! users are added. Its use should be controlled
 */
export const getAllUsers = async (req: Request, res: Response) => {
  try {
    const users = await User.find({}).exec();
    return res.status(200).json({ users });
  } catch (err) {
    return res.status(500).send(err);
  }
};

/**
 * Controls the deletion process
 */
const deleteUserController = async (req: Request, res: Response) => {
  if (req.params.userId) return deleteSingleUser(req, res);
  else if (req.query.ids || req.body.ids) return deleteMultipleUsers(req, res);
  else return res.status(400).send("missing ids");
};

/**
 * Deletes a single user, given its id in params:
 * /users/:userId ex: users/2393020392030
 */
export const deleteSingleUser = async (req: Request, res: Response) => {
  try {
    await User.findByIdAndRemove(req.params.userId);
    return res.send(200).send("deleted");
  } catch (err) {
    return res.status(500).send(err);
  }
};

/**
 * Deletes a single user, given their ids in query:
 * {
 *  ids: [1,2,432,4321,...]
 * }
 */
export const deleteMultipleUsers = async (req: Request, res: Response) => {
  const ids = req.query.ids ? req.query.ids.split(",") : req.body.ids;
  try {
    await User.remove({ _id: { $in: ids } }).exec();
    return res.send(200).send("deleted");
  } catch (err) {
    return res.status(500).send(err);
  }
};

/**
 * Controls the update process
 */
const updateUserController = async (req: Request, res: Response) => {
  if (req.params.userId) return updateSingleUser(req, res);
  else if (req.query.ids || req.body.ids) return updateMultipleUser(req, res);
  else return res.status(400).send("missing ids");
};

/**
 * Updates a single user given its paramId
 * The whole req.body will be used
 * ! this relies on strict mode being enabled in mangoose
 * ! always test it is
 */
export const updateSingleUser = async (req: Request, res: Response) => {
  try {
    const user = await User.findByIdAndUpdate(req.params.userId, req.body.data);
    return res.status(200).json({ user });
  } catch (err) {
    return res.status(500).send(err);
  }
};

/**
 * Updates a bunch of users given their ids in the body
 * The whole req.body will be used
 * ! this relies on strict mode being enabled in mangoose
 * ! always test it is
 */
export const updateMultipleUser = async (req: Request, res: Response) => {
  const ids = req.query.ids ? req.query.ids.split(",") : req.body.ids;
  try {
    const response = await User.updateMany(
      { _id: { $in: ids } },
      req.body.data
    );
    return res.status(200).send(response);
  } catch (err) {
    return res.status(500).send(err);
  }
};

export default {
  deleteUserController,
  getUserController,
  updateUserController
};
