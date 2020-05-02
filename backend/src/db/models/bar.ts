import * as mongoose from 'mongoose';
import { AddressBar, addressBarSchema } from './addressBar';
import { Time, timeSchema } from './time';
import { Beverage } from './beverage';

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
}

const barSchema = new mongoose.Schema(
  {
    name: { type: String, required: true },
    password: { type: String, required: true },
    photoUrl: String,
    address: { type: addressBarSchema, unique: true, required: true },
    phone: { type: String, unique: true },
    mail: { type: String, unique: true },
    description: String,
    openingHour: { type: timeSchema, required: true },
    closingHour: { type: timeSchema, required: true },
    beverages: { type: Array, required: false, default: [] },
    events: [Object],
  },
  { timestamps: { createdAt: 'created_at', updatedAt: 'updated_at' } },
);

export default mongoose.model<Bar>('Bar', barSchema);
