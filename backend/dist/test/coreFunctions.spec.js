"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
// external libraries
var chai_1 = require("chai");
require("mocha");
// internal libraries
var coreFunctions_1 = require("../utils/coreFunctions");
describe("Send phone code", function () {
    it("should return a 4 digit long string", function () {
        var result = coreFunctions_1.sendConfirmationCode("0654236789");
        chai_1.expect(result).to.be.a("string");
        chai_1.expect(result.length).to.be.equal(4);
    });
});
