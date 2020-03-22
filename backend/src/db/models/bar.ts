import * as mongoose from "mongoose";

export interface Bar extends mongoose.Document {
  name: string;
  photoUrl: string;
  address: string;
  events: object;
  beverages: object;
  description: string;
  phone: string;
  mail: string;
  openingHour: number;
  closingHour: number;
}

const barSchema = new mongoose.Schema({
  name: { type: String, required: true, index: true },
  phone: { type: String, unique: true },
  mail: { type: String, unique: true },
  address: { type: String, unique: true },
  photoUrl: String,
  openingHour: Number,
  closingHour: Number,
  description: String,
  events: Object,
  beverages: Object
});

export default mongoose.model<Bar>("Bar", barSchema);
