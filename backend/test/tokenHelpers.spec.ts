// external libraries
import { expect } from "chai";
import "mocha";

// internal libraries
import { createToken, getTokenData } from "../src/utils/tokenHelpers";

describe("Create token function", () => {
  it("should return a string", async () => {
    const result = await createToken("test", "testKey");
    expect(result).to.be.a("string");
  });
});

describe("Get Token data function", () => {
  it("should return the same value it was fed", async () => {
    const secretKey = "secretKey";
    const testValue = "test";
    const token = await createToken(testValue, secretKey);
    const data = await getTokenData(token, secretKey);
    expect(data).to.equal(testValue);
  });
});
