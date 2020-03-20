// external libraries
import { expect } from "chai";
import "mocha";

// internal libraries
import { sendConfirmationCode } from "../utils/coreFunctions";


describe("Send phone code", () => {
  it("should return a 4 digit long string", () => {
    const result = sendConfirmationCode("0654236789");
    expect(result).to.be.a("string");
    expect(result.length).to.be.equal(4);
  });
});
