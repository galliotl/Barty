import * as mongoose from "mongoose";

export interface Beverage extends mongoose.Document {
  category: string;
  name:string;
  alcoholDegree:string;
}

const beverageSchema = new mongoose.Schema({
  category:{type:String, required:true},
  name: {type:String, required:true},
  alcoholDegree: {type:String, required:false},
});

export default mongoose.model<Beverage>("Beverage", beverageSchema);