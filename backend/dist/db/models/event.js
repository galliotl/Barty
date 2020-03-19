"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var mongoose = require("mongoose");
var eventSchema = new mongoose.Schema({
    name: { type: [String], required: true, index: true },
    bar: { type: [String], required: true, index: true },
    photoUrl: String,
    openingHour: Number,
    closingHour: Number,
    description: String,
    attendees: Object,
    interestingCount: Number,
});
exports.default = mongoose.model("Event", eventSchema);
