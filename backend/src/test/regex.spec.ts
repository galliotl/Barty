// external libraries
import { expect } from "chai";
import "mocha";

// internal libraries
import { verifyRegexMail, verifyRegexPhone } from "../utils/regex";

describe("Regex phone", () => {
  it("should return true for a 10 digit phone", () => {
    const result = verifyRegexPhone("0632905608");
    expect(result).to.be.true;
  });
  it("should return true for a 13 digit phone", () => {
    const result = verifyRegexPhone("0033632905608");
    expect(result).to.be.true;
  });
  it("should return true for a +countrycode+phone", () => {
    const result = verifyRegexPhone("+33632905608");
    expect(result).to.be.true;
  });
  it("should return false for a regular string", () => {
    const result = verifyRegexPhone("this is falsy");
    expect(result).to.be.false;
  });
});

describe("Regex mail", () => {
  it("should return true for an email", () => {
    const result = verifyRegexMail("test@test.fr");
    expect(result).to.be.true;
  });
  it("should return false for a regular string", () => {
    const result = verifyRegexMail("this is falsy");
    expect(result).to.be.false;
  });
});
