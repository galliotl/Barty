import * as mongoose from "mongoose";

export interface Time extends mongoose.Document {
  hour: number;
  minute:number;
}

const timeSchema = new mongoose.Schema({
    hour: Number,
    minute:Number
});

export default mongoose.model<Time>("Time", timeSchema);
