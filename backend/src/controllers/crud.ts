// 3rd party libraries
import * as mongoose from 'mongoose';
import { Request, Response } from 'express';

// Local imports
import config from '../config';

/**
 * This class creates handlers for CRUD actions given a model
 * 
 * Args:
 *  - model: (mongoose model) - model to affect
 *  - name: (string) - name of the model
 */
export default class CRUDController {
  model: mongoose.Model<any>;
  name: string;

  constructor(model: mongoose.Model<any>, name: string) {
    this.model = model;
    this.name = name;
  }

  /**
   * Dispatches the request to sub handlers given the
   * type of data -> object or array of objects.
   * @param req - express request
   * @param res - express response
   */
  postController = async (req: Request, res: Response) => {
    const data = req.body.data;
    if (!data) return res.status(400).send('missing data');
    if (data instanceof Array) return await this.createMultiple(req, res);
    else if (data instanceof Map) return await this.createSingle(req, res);
    else return res.status(500).send(`Unprocessable type ${typeof data}`);
  }

  /**
   * Dispatches the request to sub handlers given
   * the need to fetch one or multiple items.
   * @param req - express request
   * @param res - express response
   */
  getController = async (req: Request, res: Response) => {
    if (req.params.id) return await this.getSingle(req, res);
    else if (req.body.ids || req.query.ids)
      return await this.getByIds(req, res);
    else if (req.query.offset) return await this.getAllPaginated(req, res);
    else return await this.getAll(req, res);
  }

  /**
   * Dispatches the request to sub handlers given
   * the need to update one or multiple items.
   * @param req - express request
   * @param res - express response
   */
  putController = async (req: Request, res: Response) => {
    if (req.params.userId) return await this.updateSingle(req, res);
    else if (req.query.ids || req.body.ids)
      return await this.updateMultiple(req, res);
    else return res.status(400).send('missing ids');
  }

  /**
   * Dispatches the request to sub handlers given
   * the need to delete one or multiple items.
   * @param req - express request
   * @param res - express response
   */
  deleteController = async (req: Request, res: Response) => {
    if (req.params.userId) return await this.deleteSingle(req, res);
    else if (req.query.ids || req.body.ids)
      return await this.deleteMultiple(req, res);
    else return res.status(400).send('missing ids');
  }

  /**
   * Fetches a single element
   */
  getSingle = async (req: Request, res: Response) => {
    const id = req.params.id ? req.params.id : req.query.id;
    try {
      const item = await this.model.findById(id).exec();
      if (!item) return res.status(422).send(`${this.name} doesn't exist`);
      return res.status(200).send(item);
    } catch (err) {
      return res.status(500).send(err);
    }
  }

  /**
   * Fetches a list of items from their ids.
   */
  getByIds = async (req: Request, res: Response) => {
    const ids = req.query.ids ? req.query.ids.split(',') : req.body.ids;
    try {
      const items = await this.model.find().where('_id').in(ids).exec();
      return res.status(200).json({ data: items });
    } catch (err) {
      return res.status(500).send(err);
    }
  }

  /**
   * Fetches all the items using pagination
   */
  getAllPaginated = async (req: Request, res: Response) => {
    const offset = parseInt(req.query.offset);
    const limit = req.query.offset
      ? parseInt(req.query.offset)
      : config.paginationLimit;
    try {
      const items = await this.model.find({}).skip(offset).limit(limit).exec();
      return res.status(200).json({ data: items, offset, limit });
    } catch (err) {
      return res.status(500).send(err);
    }
  }

  /**
   * Fetches all the items.
   */
  getAll = async (req: Request, res: Response) => {
    try {
      const items = await this.model.find({}).exec();
      return res.status(200).json({ data: items });
    } catch (err) {
      return res.status(500).send(err);
    }
  }

  /**
   * Deletes a single item from its id
   */
  deleteSingle = async (req: Request, res: Response) => {
    const id = req.params.id ? req.params.id : req.query.id;
    try {
      await this.model.findByIdAndRemove(id);
      return res.send(204).send('deleted');
    } catch (err) {
      return res.status(500).send(err);
    }
  }

  /**
   * Deletes multiple items given an id list
   */
  deleteMultiple = async (req: Request, res: Response) => {
    const ids = req.query.ids ? req.query.ids.split(',') : req.body.ids;
    try {
      await this.model.remove({ _id: { $in: ids } }).exec();
      return res.send(204).send('deleted');
    } catch (err) {
      return res.status(500).send(err);
    }
  }

  /**
   * Updates a single item
   */
  updateSingle = async (req: Request, res: Response) => {
    const id = req.params.id ? req.params.id : req.query.id;
    try {
      const item = await this.model.findByIdAndUpdate(id, req.body.data);
      return res.status(200).json({ item });
    } catch (err) {
      return res.status(500).send(err);
    }
  }

  /**
   * Updates multiple elements given their ids
   */
  updateMultiple = async (req: Request, res: Response) => {
    const ids = req.query.ids ? req.query.ids.split(',') : req.body.ids;
    try {
      const response = await this.model.updateMany(
        { _id: { $in: ids } },
        req.body.data,
      );
      return res.status(200).send(response);
    } catch (err) {
      return res.status(500).send(err);
    }
  }

  /**
   * Creates a single item
   */
  createSingle = async (req: Request, res: Response) => {
    try {
      const item = new this.model(req.body.data);
      await item.save();
      return res.status(200).send(item);
    } catch (err) {
      return res.status(500).send(err);
    }
  }

  /**
   * Creates multiple items
   */
  createMultiple = async (req: Request, res: Response) => {
    try {
      const items = await this.model.insertMany(req.body.data);
      return res.status(200).json({ data: items });
    } catch (err) {
      return res.status(500).send(err);
    }
  }
}
