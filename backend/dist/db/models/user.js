"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var mongoose = require("mongoose");
var userSchema = new mongoose.Schema({
    phone: { type: [String], unique: true, required: true, index: true },
    name: String,
    password: String,
    isMajor: {
        type: [Boolean],
        validate: {
            validator: function (isMajor) { return isMajor; },
            message: function () { return "User has to be major to signup to the website"; }
        }
    },
    isPhoneConfirmed: {
        type: [Boolean],
        validate: {
            validator: function (isPhoneConfirmed) { return isPhoneConfirmed; },
            message: function () { return "User has to be major to signup to the website"; }
        }
    }
});
exports.default = mongoose.model("User", userSchema);
