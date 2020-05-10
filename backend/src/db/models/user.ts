import * as mongoose from 'mongoose';

export interface User extends mongoose.Document {
  confirmationCode: string;
  isMajor: boolean;
  isPhoneConfirmed: boolean;
  name: string;
  password: string;
  phone: string;
}

const userSchema = new mongoose.Schema(
  {
    phone: { type: String, unique: true, required: true, index: true },
    name: String,
    password: String,
    confirmationCode: String,
    isMajor: {
      type: Boolean,
      validate: {
        validator: (isMajor) => isMajor,
        message: () => 'User has to be major to signup to the website',
      },
    },
    isPhoneConfirmed: {
      type: Boolean,
      validate: {
        validator: (isPhoneConfirmed) => isPhoneConfirmed,
        message: () => 'User has to be major to signup to the website',
      },
    },
  },
  { timestamps: { createdAt: 'created_at', updatedAt: 'updated_at' } },
);

export default mongoose.model<User>('User', userSchema);
