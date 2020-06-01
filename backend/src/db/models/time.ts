import * as mongoose from "mongoose";

export interface Time extends mongoose.Document {
  hour: number;
  minute: number;
}

export const timeSchema = new mongoose.Schema({
    hour: Number,
    minute: Number
});
