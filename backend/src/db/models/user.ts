import * as mongoose from "mongoose";

export interface User extends mongoose.Document {
  name: string;
  password: string;
  phone: string;
  isMajor: boolean;
}

const userSchema = new mongoose.Schema({
  phone: { type: String, unique: true, required: true, index: true },
  name: String,
  password: String,
  isMajor: {
    type: Boolean,
    validate: {
      validator: isMajor => isMajor,
      message: () => "User has to be major to signup to the website"
    }
  },
  isPhoneConfirmed: {
    type: Boolean,
    validate: {
      validator: isPhoneConfirmed => isPhoneConfirmed,
      message: () => "User has to be major to signup to the website"
    }
  },
  created_at: {type: Date, required: true, default: Date.now},
  updated_at: {type: Date, required: true, default: Date.now}
});

export default mongoose.model<User>("User", userSchema);
