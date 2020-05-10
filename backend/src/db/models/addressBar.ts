import * as mongoose from 'mongoose';

export interface AddressBar extends mongoose.Document {
  streetAddress: string;
  city: string;
  postalCode: number;
  country: string;
}

export const addressBarSchema = new mongoose.Schema({
  streetAddress: String,
  city: String,
  postalCode: Number,
  country: String,
});
