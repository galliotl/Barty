// external libraries
import "mocha";
import { expect } from "chai";
import { mockRequest, mockResponse } from "mock-req-res";
import * as sinon from "sinon";

// internal libraries
import { verifyMandatoryParams, verifyAuth, verifyToken } from "../middleware";
import * as tokenHelpers from "../utils/tokenHelpers";
import User from "../db/models/user";

describe("Verify mandatory params function", () => {
  it("should return true", () => {
    const result = verifyMandatoryParams(["a", "b", "c"], {
      a: 1,
      b: 2,
      c: 3
    });
    expect(result).to.be.true;
  });

  it("should return false", () => {
    const result = verifyMandatoryParams(["a", "b", "c"], {
      a: 1,
      c: 3
    });
    expect(result).to.be.false;
  });
});

describe("Verify token is present in the request", () => {
  before(() => {
    // This pretends we do a call to the db and only returns required fields
    sinon.replace(
      tokenHelpers,
      "getTokenData",
      sinon.fake.returns("testToken")
    );
  });
  after(() => {
    // resets all stubs
    sinon.restore();
    sinon.reset();
  });

  it("Should call next when token is present", async () => {
    // creates request
    const req = mockRequest({
      headers: {
        authorization: "Token thisIsATestToken"
      }
    });
    const res = mockResponse();
    const next = sinon.stub();
    await verifyToken(req, res, next);
    sinon.assert.calledOnce(next);
  });
  it("Should reject with 403 when token is not present", async () => {
    // creates request
    const req = mockRequest({});
    const res = mockResponse();
    const next = sinon.stub();
    await verifyToken(req, res, next);
    sinon.assert.calledWith(res.status, 403);
  });
});

describe("Verify auth", () => {
  afterEach(() => {
    // resets all stubs
    sinon.restore();
    sinon.reset();
  });

  it("Should call next when token is present and user exists", async () => {
    sinon.replace(User, "findOne", sinon.fake.returns({ phone: "0654526839" }));
    // creates request
    const req = mockRequest({
      body: {
        tokenData: "thisIsATestToken"
      }
    });
    const res = mockResponse();
    const next = sinon.stub();
    await verifyAuth(req, res, next);
    sinon.assert.calledOnce(next);
  });
  it("Should reject with 403 when no user was found", async () => {
    sinon.replace(User, "findOne", sinon.fake.returns(null));
    // creates request
    const req = mockRequest({});
    const res = mockResponse();
    const next = sinon.stub();
    await verifyAuth(req, res, next);
    sinon.assert.calledWith(res.status, 403);
  });
});
