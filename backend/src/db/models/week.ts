import * as mongoose from 'mongoose';
import { Day, daySchema } from './day';

export interface Week extends mongoose.Document {
  lundi: Day;
  mardi: Day;
  mercredi: Day;
  jeudi: Day;
  vendredi: Day;
  samedi: Day;
  dimanche: Day;
}

export const weekSchema = new mongoose.Schema({
  lundi: { type: daySchema },
  mardi: { type: daySchema },
  mercredi: { type: daySchema },
  jeudi: { type: daySchema },
  vendredi: { type: daySchema },
  samedi: { type: daySchema },
  dimanche: { type: daySchema },
});
