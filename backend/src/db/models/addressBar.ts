import * as mongoose from "mongoose";

export interface AddressBar extends mongoose.Document {
  streetAddress: string;
  city: string;
  postalCode: number;
  country:string;
}

const addressBarSchema = new mongoose.Schema({
    streetAddress: String,
    city: String,
    postalCode: Number,
    country:String
});

export default mongoose.model<AddressBar>("AddressBar", addressBarSchema);
