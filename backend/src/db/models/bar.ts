import * as mongoose from 'mongoose';
import AddressBarModel, { AddressBar } from './addressBar';
import TimeModel, { Time } from './time';
import BeverageModel, { Beverage } from './beverage';

export interface Bar extends mongoose.Document {
  name: string;
  password: string;
  photoUrl: string;
  address: AddressBar;
  phone: string;
  mail: string;
  description: string;
  openingHour: Time;
  closingHour: Time;
  beverages: [Beverage];
  events: [object];
  created_at: Date;
  updated_at: Date;
}

const barSchema = new mongoose.Schema({
  name: { type: String, required: true },
  password: { type: String, required: true },
  photoUrl: String,
  address: { type: AddressBarModel, unique: true, required: true },
  phone: { type: String, unique: true },
  mail: { type: String, unique: true },
  description: String,
  openingHour: { type: TimeModel, required: true },
  closingHour: { type: TimeModel, required: true },
  beverages: { type: Array, required: false, default: [] },
  events: [Object],
},
{ timestamps: { createdAt: 'created_at', updatedAt: 'updated_at' }});

export default mongoose.model<Bar>('Bar', barSchema);
