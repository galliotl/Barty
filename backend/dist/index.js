"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
// external libraries
var express = require("express");
var mongoose = require("mongoose");
// internal libraries
var auth_1 = require("./controllers/auth");
var bars_1 = require("./controllers/bars");
var middleware_1 = require("./middleware");
var uri = "mongodb://db:27017/barty";
mongoose.connect(uri, {
    useNewUrlParser: true,
    useUnifiedTopology: true
});
var app = express();
app.use(express.json());
/**
 * Auth routes
 */
app.get("/user/self", middleware_1.verifyToken, middleware_1.verifyAuth, auth_1.default.selfDataController);
app.post("/users/login", auth_1.default.loginController);
app.post("/users/signup", middleware_1.verifyToken, auth_1.default.userSignupController);
app.post("/users/signup/phone", auth_1.default.signupPhoneController);
/**
 * Bar routes
 */
app.delete("/bars", middleware_1.verifyToken, middleware_1.verifyAuth, bars_1.default.deleteBarController);
app.get("/bars", middleware_1.verifyToken, middleware_1.verifyAuth, bars_1.default.getBarController);
app.post("/bars", middleware_1.verifyToken, middleware_1.verifyAuth, bars_1.default.createBarController);
app.put("/bars", middleware_1.verifyToken, middleware_1.verifyAuth, bars_1.default.updateBarController);
app.listen(3000, function () { return console.log("running..."); });
