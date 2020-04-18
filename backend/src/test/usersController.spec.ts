// external libraries
import "mocha";
import { mockRequest, mockResponse } from "mock-req-res";
import * as bcryptjs from "bcryptjs";
import * as sinon from "sinon";

// internal libraries
import * as users from "../controllers/users";
import User from "../db/models/user";

describe("Test get user controller", () => {
  before(() => {
    sinon.replace(users, "getSingleUser", sinon.fake());
  });
  after(() => {
    sinon.reset();
    sinon.restore();
  });
  it("Should call get single user if userId is given in params", () => {
  });
});
