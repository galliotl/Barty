import * as mongoose from "mongoose";

export interface Beverage extends mongoose.Document {
  hour: number;
  minute:number;
}

const beverageSchema = new mongoose.Schema({
    hour: Number,
    minute: Number
});

export default mongoose.model<Beverage>("Beverage", beverageSchema);