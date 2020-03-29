// external libraries
import "mocha";
import { mockRequest, mockResponse } from "mock-req-res";
import * as bcryptjs from "bcryptjs";
import * as sinon from "sinon";

// internal libraries
import * as core from "../utils/coreFunctions";
import * as tokenHelpers from "../utils/tokenHelpers";
import auth from "../controllers/auth";
import User from "../db/models/user";

// Constants
const fakeNumber = "88638203029";
const fakePassword = "password";
const wrongPassword = "pass";
const hashedPassword = bcryptjs.hashSync(fakePassword, 10);

describe("Test login controller", () => {
  before(() => {
    // This pretends we do a call to the db and only returns required fields
    sinon.replace(tokenHelpers, "createToken", sinon.fake.returns("token"));
    sinon.replace(
      User,
      "findOne",
      sinon.fake.returns({ password: hashedPassword })
    );
  });
  after(() => {
    // resets all stubs
    sinon.restore();
    sinon.reset();
  });

  it("Should return ok when password matches and db says ok", async () => {
    // builds a fake request
    const req = mockRequest({
      body: {
        phone: fakeNumber,
        password: fakePassword
      }
    });
    const res = mockResponse();
    await auth.loginController(req, res);
    sinon.assert.calledWith(res.status, 200);
  });

  it("Should return 422 error when passwords don't match", async () => {
    const req = mockRequest({
      body: {
        phone: fakeNumber,
        password: wrongPassword
      }
    });
    const res = mockResponse();
    await auth.loginController(req, res);
    sinon.assert.calledWith(res.status, 422);
  });

  it("Should return 400 when a param is missing", async () => {
    const req = mockRequest({
      body: {
        password: wrongPassword
      }
    });
    const res = mockResponse();
    await auth.loginController(req, res);
    sinon.assert.calledWith(res.status, 400);
  });
});

describe("Test Signup controller", async () => {
  before(() => {
    // This pretends we do a call to the db and only returns required fields
    sinon.replace(User.prototype, "save", sinon.fake());
    sinon.replace(tokenHelpers, "createToken", sinon.fake.returns("token"));
    sinon.replace(
      User,
      "findOne",
      sinon.fake.returns({
        confirmationCode: "0000",
        id: "id",
        updateOne: sinon.stub()
      })
    );
  });
  after(() => {
    // resets all stubs
    sinon.restore();
    sinon.reset();
  });

  it("Should return ok when all params are present", async () => {
    const req = mockRequest({
      body: {
        password: fakePassword,
        name: "testName",
        isMajor: true,
        tokenData: "0632905608",
        confirmationCode: "0000"
      }
    });
    const res = mockResponse();
    await auth.userSignupController(req, res);
    sinon.assert.calledWith(res.status, 200);
  });
  it("Should return 400 when a param is missing", async () => {
    const req = mockRequest({
      body: {
        name: "testName",
        isMajor: true
      }
    });
    const res = mockResponse();
    await auth.userSignupController(req, res);
    sinon.assert.calledWith(res.status, 400);
  });
});

describe("Test signup phone", () => {
  before(() => {
    // This pretends we do a call to the db and only returns required fields
    sinon.replace(User.prototype, "save", sinon.fake());
    sinon.replace(core, "sendConfirmationCode", sinon.fake.returns("0000"));
    sinon.replace(tokenHelpers, "createToken", sinon.fake.returns("token"));
  });
  after(() => {
    // resets all stubs
    sinon.restore();
    sinon.reset();
  });

  it("Should return ok when all params are present", async () => {
    const req = mockRequest({
      body: {
        phone: "0632905563"
      }
    });
    const res = mockResponse();
    await auth.signupPhoneController(req, res);
    sinon.assert.calledWith(res.status, 200);
  });
  it("Should return 400 when a param is missing", async () => {
    const req = mockRequest({
      body: {}
    });
    const res = mockResponse();
    await auth.signupPhoneController(req, res);
    sinon.assert.calledWith(res.status, 400);
  });
});
