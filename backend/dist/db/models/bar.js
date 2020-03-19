"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var mongoose = require("mongoose");
var barSchema = new mongoose.Schema({
    name: { type: [String], required: true, index: true },
    phone: { type: [String], unique: true },
    mail: { type: [String], unique: true },
    address: { type: [String], unique: true },
    photoUrl: String,
    openingHour: Number,
    closingHour: Number,
    description: String,
    events: Object,
    beverages: Object
});
exports.default = mongoose.model("Bar", barSchema);
