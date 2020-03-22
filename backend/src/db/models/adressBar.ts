import * as mongoose from "mongoose";

export interface AdressBar extends mongoose.Document {
  streetAdress: string;
  city: string;
  postalCode: number;
  country:string;
}

const adressBarSchema = new mongoose.Schema({
    streetAdress: String,
    city: String,
    postalCode: Number,
    country:String
});

export default mongoose.model<AdressBar>("AdressBar", adressBarSchema);
