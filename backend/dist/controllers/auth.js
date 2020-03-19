"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
Object.defineProperty(exports, "__esModule", { value: true });
var bcrypt = require("bcryptjs");
// local
var coreFunctions_1 = require("../utils/coreFunctions");
var tokenHelpers_1 = require("../utils/tokenHelpers");
var user_1 = require("../db/models/user");
/**
 * This route is used for the app to send the phone number.
 * We have to:
 * - verify that this user isn't already signed up
 * - send a 4 digit code via SMS (v2)
 * - send this same code back to the app so the app can confirm the phone number or not
 * - also send a signup token so the app can send all the information at the end of the signup
 */
var signupPhoneController = function (req, res) { return __awaiter(void 0, void 0, void 0, function () {
    var phone, user, confirmationCode, token, err_1;
    return __generator(this, function (_a) {
        switch (_a.label) {
            case 0:
                phone = req.body.phone;
                if (!phone)
                    return [2 /*return*/, res.status(422).send("phone isn't filled")];
                return [4 /*yield*/, user_1.default.findOne({
                        phone: phone
                    }).exec()];
            case 1:
                user = _a.sent();
                // The user already exists
                if (user)
                    return [2 /*return*/, res.status(422).send("user already exists")];
                confirmationCode = coreFunctions_1.sendConfirmationCode(phone);
                _a.label = 2;
            case 2:
                _a.trys.push([2, 4, , 5]);
                return [4 /*yield*/, tokenHelpers_1.createToken(phone)];
            case 3:
                token = _a.sent();
                return [2 /*return*/, res.json({
                        token: token,
                        confirmationCode: confirmationCode
                    })];
            case 4:
                err_1 = _a.sent();
                return [2 /*return*/, res.status(500).send(err_1)];
            case 5: return [2 /*return*/];
        }
    });
}); };
/**
 * This route is used to signup a user. We require a password,
 * name, an age verification check
 * and token from the token we deduce the phone.
 *
 * The token is used because it proves that the phone
 * was already verified before
 */
var userSignupController = function (req, res) { return __awaiter(void 0, void 0, void 0, function () {
    var _a, password, name, isMajor, isPhoneConfirmed, phone, user, _b;
    return __generator(this, function (_c) {
        switch (_c.label) {
            case 0:
                _a = req.body, password = _a.password, name = _a.name, isMajor = _a.isMajor, isPhoneConfirmed = _a.isPhoneConfirmed;
                if (!password || !name || !isMajor || !isPhoneConfirmed) {
                    return [2 /*return*/, res.status(422).send("wrong params sent to input")];
                }
                phone = req.body.tokenData;
                return [4 /*yield*/, bcrypt.hash(password, 10)];
            case 1:
                password = _c.sent();
                user = new user_1.default({ phone: phone, password: password, name: name, isMajor: isMajor, isPhoneConfirmed: isPhoneConfirmed });
                _c.label = 2;
            case 2:
                _c.trys.push([2, 4, , 5]);
                return [4 /*yield*/, user.save()];
            case 3:
                _c.sent();
                return [3 /*break*/, 5];
            case 4:
                _b = _c.sent();
                return [2 /*return*/, res.status(500).send("Cannot save the user")];
            case 5:
                try {
                    // we return the same token as a login token to the app
                    return [2 /*return*/, res.json({ token: req.body.token })];
                }
                catch (_d) {
                    return [2 /*return*/, res.status(500).send("cannot create token")];
                }
                return [2 /*return*/];
        }
    });
}); };
/**
 * This route gets user data and sends back a jwt token.
 * This token will have to be used in every requests.
 */
var loginController = function (req, res) { return __awaiter(void 0, void 0, void 0, function () {
    var _a, phone, password, dbUser, token, err_2;
    return __generator(this, function (_b) {
        switch (_b.label) {
            case 0:
                _a = req.body, phone = _a.phone, password = _a.password;
                // verify user is correctly filled
                if (!phone || !password)
                    return [2 /*return*/, res.status(422).send("user isn't filled properly")];
                return [4 /*yield*/, user_1.default.findOne({ phone: phone })];
            case 1:
                dbUser = _b.sent();
                if (!dbUser)
                    return [2 /*return*/, res.status(422).send("No user have this phone")];
                return [4 /*yield*/, bcrypt.compare(password, dbUser.password)];
            case 2:
                if (!_b.sent()) return [3 /*break*/, 7];
                _b.label = 3;
            case 3:
                _b.trys.push([3, 5, , 6]);
                return [4 /*yield*/, tokenHelpers_1.createToken(phone)];
            case 4:
                token = _b.sent();
                return [2 /*return*/, res.json({ token: token })];
            case 5:
                err_2 = _b.sent();
                return [2 /*return*/, res.status(500).send(err_2)];
            case 6: return [3 /*break*/, 8];
            case 7: return [2 /*return*/, res.status(422).send("wrong password")];
            case 8: return [2 /*return*/];
        }
    });
}); };
/**
 * This route is used to fetch the user's own data. All the work is done
 * by the middlewares, we just have to send the data back
 */
var selfDataController = function (req, res) { return __awaiter(void 0, void 0, void 0, function () {
    return __generator(this, function (_a) {
        return [2 /*return*/, req.body.user];
    });
}); };
exports.default = {
    loginController: loginController,
    selfDataController: selfDataController,
    signupPhoneController: signupPhoneController,
    userSignupController: userSignupController
};
