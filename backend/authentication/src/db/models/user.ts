import * as mongoose from "mongoose";

export interface User extends mongoose.Document {
  name: string;
  password: string;
  phone: string;
}

const userSchema = new mongoose.Schema({
  phone: { type: [String], unique: true, required: true, index: true },
  name: String,
  password: String
});

export default mongoose.model<User>("User", userSchema);
