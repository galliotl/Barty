import * as mongoose from 'mongoose';
import { Day, daySchema } from './day';

export interface Week extends mongoose.Document {
  monday: Day;
  tuesday: Day;
  wednesday: Day;
  thursday: Day;
  friday: Day;
  saturday: Day;
  sunday: Day;
}

export const weekSchema = new mongoose.Schema({
  monday: { type: daySchema },
  tuesday: { type: daySchema },
  wednesday: { type: daySchema },
  thursday: { type: daySchema },
  friday: { type: daySchema },
  saturday: { type: daySchema },
  sunday: { type: daySchema },
});
