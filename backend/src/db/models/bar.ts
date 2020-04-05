import * as mongoose from "mongoose";
import * as addressBar from "./addressBar";
import * as time from "./time";
import * as beverage from "./beverage";


export interface Bar extends mongoose.Document {
  name: string;
  password:string;
  photoUrl: string;
  address: addressBar.AddressBar;
  phone: string;
  mail: string;
  description: string;
  openingHour: time.Time;
  closingHour: time.Time;
  beverages: [beverage.Beverage];
  events: [object];
  created_at: Date;
  updated_at: Date;
}

const barSchema = new mongoose.Schema({
  name: { type: String, required: true},
  password:{type: String, required:true},
  photoUrl: String,
  address: { type: addressBar, unique: true, required:true },
  phone: { type: String, unique: true },
  mail: { type: String, unique: true },
  description: String,
  openingHour: {type: time, required:true},
  closingHour: {type: time, required:true},
  beverages: {type: Array, required:false, default:[]},
  events: [Object],
  created_at: {type: Date, required: true, default: Date.now},
  updated_at: {type: Date, required: true, default: Date.now}
});

export default mongoose.model<Bar>("Bar", barSchema);
