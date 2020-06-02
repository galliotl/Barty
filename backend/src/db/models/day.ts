import * as mongoose from 'mongoose';
import { Time, timeSchema } from './time';

export interface Day extends mongoose.Document {
  openningHour: Time;
  closingHour: Time;
  ferme: boolean;
}

export const daySchema = new mongoose.Schema({
  openingHour: { type: timeSchema },
  closingHour: { type: timeSchema },
  ferme: {type: Boolean, default: false},
});
