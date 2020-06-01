import * as mongoose from 'mongoose';
import { AddressBar, addressBarSchema } from './addressBar';
import { Time, timeSchema } from './time';
import { Week, weekSchema } from './week';
import { Beverage } from './beverage';

export interface Bar extends mongoose.Document {
  name: string;
  password: string;
  photoUrl: string;
  address: AddressBar;
  phone: string;
  mail: string;
  description: string;
  schedule: Week;
  beverages: [Beverage];
  events: [object];
  confirmationCode: string;
}

const barSchema = new mongoose.Schema(
  {
    name: { type: String},
    password: { type: String},
    photoUrl: String,
    address: { type: addressBarSchema, unique: true},
    phone: { type: String, unique: true },
    mail: { type: String, unique: true },
    description: String,
    schedule: { type: weekSchema},
    beverages: { type: Array, required: false, default: [] },
    events: [Object],
    confirmationCode: {type: String, default: "0"}
  },
  { timestamps: { createdAt: 'created_at', updatedAt: 'updated_at' } },
);

export default mongoose.model<Bar>('Bar', barSchema);
