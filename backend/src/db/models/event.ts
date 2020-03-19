import * as mongoose from "mongoose";

export interface Event extends mongoose.Document {
  name: string;
  photoUrl: string;
  bar: string;
  attendes: object;
  interestingCount: number
  description: string;
  openingHour: number;
  closingHour: number;
}

const eventSchema = new mongoose.Schema({
  name: { type: [String], required: true, index: true },
  bar: { type: [String], required: true, index: true },
  photoUrl: String,
  openingHour: Number,
  closingHour: Number,
  description: String,
  attendees: Object,
  interestingCount: Number,
});

export default mongoose.model<Event>("Event", eventSchema);
