import * as mongoose from "mongoose";
import * as adressBar from "./adressBar";


export interface Bar extends mongoose.Document {
  name: string;
  password:string;
  photoUrl: string;
  address: adressBar.AdressBar;
  events: object;
  beverages: object;
  description: string;
  phone: string;
  mail: string;
  openingHour: number;
  closingHour: number;
}

const barSchema = new mongoose.Schema({
  name: { type: String, required: true},
  password:{type: String, required:true},
  phone: { type: String, unique: true },
  mail: { type: String, unique: true },
  address: { type: adressBar, unique: true },
  photoUrl: String,
  openingHour: Number,
  closingHour: Number,
  description: String,
  events: Object,
  beverages: Object
});

export default mongoose.model<Bar>("Bar", barSchema);
