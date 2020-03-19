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
// local libraries
var bar_1 = require("../db/models/bar");
var middleware_1 = require("../middleware");
/**
 * Creates a bar
 * Verifies that the mandatory params are present in the request.body
 * then passes it to the mangoose object to create one.
 */
var createBarController = function (req, res) { return __awaiter(void 0, void 0, void 0, function () {
    var bar, _a;
    return __generator(this, function (_b) {
        switch (_b.label) {
            case 0:
                if (!middleware_1.verifyMandatoryParams([
                    "name",
                    "photoUrl",
                    "address",
                    "events",
                    "beverages",
                    "description",
                    "phone",
                    "mail",
                    "openingHour",
                    "closingHour"
                ], req.body)) {
                    return [2 /*return*/, res.status(400).send("wrong params entered")];
                }
                _b.label = 1;
            case 1:
                _b.trys.push([1, 3, , 4]);
                bar = new bar_1.default(req.body);
                return [4 /*yield*/, bar.save()];
            case 2:
                _b.sent();
                return [2 /*return*/, res.status(200).send({ id: bar.id })];
            case 3:
                _a = _b.sent();
                return [2 /*return*/, res.status(500).send("cannot create bar")];
            case 4: return [2 /*return*/];
        }
    });
}); };
/**
 * Takes the given id and removes the associated bar
 */
var getBarController = function (req, res) { return __awaiter(void 0, void 0, void 0, function () {
    var id, bar;
    return __generator(this, function (_a) {
        id = req.query.id;
        if (!middleware_1.verifyMandatoryParams(["id"], req.query)) {
            return [2 /*return*/, res.status(422).send("missing mandatory params")];
        }
        try {
            bar = bar_1.default.findById(id);
            return [2 /*return*/, res.status(200).send({ bar: bar })];
        }
        catch (_b) {
            return [2 /*return*/, res.status(500).send("couldn't retreive this bar")];
        }
        return [2 /*return*/];
    });
}); };
/**
 * Removes a bar given its id
 */
var deleteBarController = function (req, res) { return __awaiter(void 0, void 0, void 0, function () {
    var id, _a;
    return __generator(this, function (_b) {
        switch (_b.label) {
            case 0:
                id = req.body.id;
                if (!middleware_1.verifyMandatoryParams(["id"], req.body)) {
                    return [2 /*return*/, res.status(422).send("missing mandatory params")];
                }
                _b.label = 1;
            case 1:
                _b.trys.push([1, 3, , 4]);
                return [4 /*yield*/, bar_1.default.findByIdAndDelete(id)];
            case 2:
                _b.sent();
                return [2 /*return*/, res.status(200).send("removed")];
            case 3:
                _a = _b.sent();
                return [2 /*return*/, res.status(500).send("couldn't remove")];
            case 4: return [2 /*return*/];
        }
    });
}); };
/**
 * Updates a bar
 */
var updateBarController = function (req, res) { return __awaiter(void 0, void 0, void 0, function () {
    var id, bar, err_1;
    return __generator(this, function (_a) {
        switch (_a.label) {
            case 0:
                id = req.body.id;
                delete req.body.id;
                _a.label = 1;
            case 1:
                _a.trys.push([1, 3, , 4]);
                return [4 /*yield*/, bar_1.default.findById(id)];
            case 2:
                bar = _a.sent();
                bar.update(req.body);
                bar.save();
                return [2 /*return*/, res.status(200).send({ newBar: bar.toJSON() })];
            case 3:
                err_1 = _a.sent();
                return [2 /*return*/, res.status(500).send("couldn't update")];
            case 4: return [2 /*return*/];
        }
    });
}); };
exports.default = {
    createBarController: createBarController,
    deleteBarController: deleteBarController,
    getBarController: getBarController,
    updateBarController: updateBarController
};
