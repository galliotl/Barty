// external libraries
import * as express from "express";
import * as mongoose from "mongoose";

// internal libraries
import { handleCreateBar, handleRetreiveBar, handleDeleteBar, handleUpdateBar } from "./bars";

const uri = "mongodb://db:27017/barty";
mongoose.connect(uri, {
  useNewUrlParser: true,
  useUnifiedTopology: true
});

const app: express.Application = express();

app.use(express.json());

/**
 * Creates a bar
 */
app.post("/bars/", async (req: express.Request, res: express.Response) => {
  const result = await handleCreateBar(req.body);
  return res.status(result.status).send(result.body);
});

/**
 * Retreives a bar given an id
 */
app.get("/bars/", async (req: express.Request, res: express.Response) => {
  const result = await handleRetreiveBar(req.query);
  return res.status(result.status).send(result.body);
});

/**
 * Deletes a bar given an id
 */
app.delete("/bars/", async (req: express.Request, res: express.Response) => {
  const result = await handleDeleteBar(req.body);
  return res.status(result.status).send(result.body);
});

/**
 * Updates the bar associated to the given id with fields in the body
 */
app.delete("/bars/", async (req: express.Request, res: express.Response) => {
  const result = await handleUpdateBar(req.body);
  return res.status(result.status).send(result.body);
});

app.listen(3000, () => console.log("running..."));
