// external libraries
import "mocha";
import { mockRequest, mockResponse } from "mock-req-res";
import * as sinon from "sinon";

// internal libraries
import userControllers, * as users from "../controllers/users";
import User from "../db/models/user";

/**
 * Test cases for the get User controller
 * This controller assigns the handling of the request to sub-handlers
 * given the params present in the request. We verify this works as
 * intended
 */
describe("Test get user controller", () => {
  it("Should call get single user if userId is given in params", async () => {
    const req = mockRequest({
      body: {},
      params: { userId: "fakeId" },
      query: {}
    });
    const res = mockResponse();

    // This mocks every handlers but none of the controllers
    const mockUserHanlers = sinon.mock(users);

    // specifies all the mock expectations
    mockUserHanlers.expects("getSingleUser").calledOnce;

    // calls the function
    await userControllers.getUserController(req, res);

    // verify assertions and restore
    mockUserHanlers.verify();
    mockUserHanlers.restore();
  });

  it("Should call get single user if userId is given in query", async () => {
    const req = mockRequest({
      body: {},
      params: {},
      query: { id: "FakeId" }
    });
    const res = mockResponse();

    // This mocks every handlers but none of the controllers
    const mockUserHanlers = sinon.mock(users);

    // specifies all the mock expectations
    mockUserHanlers.expects("getSingleUser").calledOnce;

    // calls the function
    await userControllers.getUserController(req, res);

    // verify assertions and restore
    mockUserHanlers.verify();
    mockUserHanlers.restore();
  });

  it("Should call get users by ids if user ids list is given in body", async () => {
    const req = mockRequest({
      body: { ids: ["fakeID1", "fakeID2"] },
      params: {},
      query: {}
    });
    const res = mockResponse();

    // This mocks every handlers but none of the controllers
    const mockUserHanlers = sinon.mock(users);

    // specifies all the mock expectations
    mockUserHanlers.expects("getUsersFromIds").calledOnce;

    // calls the function
    await userControllers.getUserController(req, res);

    // verify assertions and restore
    mockUserHanlers.verify();
    mockUserHanlers.restore();
  });

  it("Should call get users by ids if user ids list is given in query", async () => {
    const req = mockRequest({
      body: {},
      params: {},
      query: { ids: ["fakeID1", "fakeID2"] }
    });
    const res = mockResponse();

    // This mocks every handlers but none of the controllers
    const mockUserHanlers = sinon.mock(users);

    // specifies all the mock expectations
    mockUserHanlers.expects("getUsersFromIds").calledOnce;

    // calls the function
    await userControllers.getUserController(req, res);

    // verify assertions and restore
    mockUserHanlers.verify();
    mockUserHanlers.restore();
  });

  it("Should call get all users paginated if offset is specified in query", async () => {
    const req = mockRequest({
      body: {},
      params: {},
      query: { offset: 20 }
    });
    const res = mockResponse();

    // This mocks every handlers but none of the controllers
    const mockUserHanlers = sinon.mock(users);

    // specifies all the mock expectations
    mockUserHanlers.expects("getAllUsersPaginated").calledOnce;

    // calls the function
    await userControllers.getUserController(req, res);

    // verify assertions and restore
    mockUserHanlers.verify();
    mockUserHanlers.restore();
  });

  it("Should call get all users nothing is specified", async () => {
    const req = mockRequest({
      body: {},
      params: {},
      query: {}
    });
    const res = mockResponse();

    // This mocks every handlers but none of the controllers
    const mockUserHanlers = sinon.mock(users);

    // specifies all the mock expectations
    mockUserHanlers.expects("getAllUsers").calledOnce;

    // calls the function
    await userControllers.getUserController(req, res);

    // verify assertions and restore
    mockUserHanlers.verify();
    mockUserHanlers.restore();
  });
});

/**
 * Test cases for the delete User controller
 * This controller assigns the handling of the request to sub-handlers
 * given the params present in the request. We verify this works as
 * intended
 */
describe("Test delete user controller", () => {
  it("Should return 400 if no id are specified", async () => {
    const req = mockRequest();
    const res = mockResponse();

    // calls the function
    await userControllers.deleteUserController(req, res);

    // verify assertions and restore
    sinon.assert.calledWith(res.status, 400);
  });

  it("Should call delete single user if userId is given in params", async () => {
    const req = mockRequest({
      body: {},
      params: { userId: "fakeId" },
      query: {}
    });
    const res = mockResponse();

    // This mocks every handlers but none of the controllers
    const mockUserHanlers = sinon.mock(users);

    // specifies all the mock expectations
    mockUserHanlers.expects("deleteSingleUser").calledOnce;

    // calls the function
    await userControllers.deleteUserController(req, res);

    // verify assertions and restore
    mockUserHanlers.verify();
    mockUserHanlers.restore();
  });

  it("Should call delete single user if user id is given in body", async () => {
    const req = mockRequest({
      body: { id: "fake" },
      params: {},
      query: {}
    });
    const res = mockResponse();

    // This mocks every handlers but none of the controllers
    const mockUserHanlers = sinon.mock(users);

    // specifies all the mock expectations
    mockUserHanlers.expects("deleteSingleUser").calledOnce;

    // calls the function
    await userControllers.deleteUserController(req, res);

    // verify assertions and restore
    mockUserHanlers.verify();
    mockUserHanlers.restore();
  });

  it("Should call delete multiple users if user ids list is given in body", async () => {
    const req = mockRequest({
      body: { ids: ["fakeID1", "fakeID2"] },
      params: {},
      query: {}
    });
    const res = mockResponse();

    // This mocks every handlers but none of the controllers
    const mockUserHanlers = sinon.mock(users);

    // specifies all the mock expectations
    mockUserHanlers.expects("deleteMultipleUsers").calledOnce;

    // calls the function
    await userControllers.deleteUserController(req, res);

    // verify assertions and restore
    mockUserHanlers.verify();
    mockUserHanlers.restore();
  });

  it("Should call delete multiple users if user ids list is given in query", async () => {
    const req = mockRequest({
      body: {},
      params: {},
      query: { ids: ["fakeID1", "fakeID2"] }
    });
    const res = mockResponse();

    // This mocks every handlers but none of the controllers
    const mockUserHanlers = sinon.mock(users);

    // specifies all the mock expectations
    mockUserHanlers.expects("deleteMultipleUsers").calledOnce;

    // calls the function
    await userControllers.deleteUserController(req, res);

    // verify assertions and restore
    mockUserHanlers.verify();
    mockUserHanlers.restore();
  });
});

/**
 * Test cases for the update User controller
 * This controller assigns the handling of the request to sub-handlers
 * given the params present in the request. We verify this works as
 * intended
 */
describe("Test update user controller", () => {
  it("Should return 400 if no id are specified", async () => {
    const req = mockRequest();
    const res = mockResponse();

    // calls the function
    await userControllers.updateUserController(req, res);

    // verify assertions and restore
    sinon.assert.calledWith(res.status, 400);
  });

  it("Should call update single user if userId is given in params", async () => {
    const req = mockRequest({
      body: {
        data: { stuff: "value" }
      },
      params: { userId: "fakeId" },
      query: {}
    });
    const res = mockResponse();

    // This mocks every handlers but none of the controllers
    const mockUserHanlers = sinon.mock(users);

    // specifies all the mock expectations
    mockUserHanlers.expects("updateSingleUser").calledOnce;

    // calls the function
    await userControllers.updateUserController(req, res);

    // verify assertions and restore
    mockUserHanlers.verify();
    mockUserHanlers.restore();
  });

  it("Should call update single user if userId is given in body", async () => {
    const req = mockRequest({
      body: {
        id: "fakeId",
        data: { stuff: "value" }
      },
      params: {},
      query: {}
    });
    const res = mockResponse();

    // This mocks every handlers but none of the controllers
    const mockUserHanlers = sinon.mock(users);

    // specifies all the mock expectations
    mockUserHanlers.expects("updateSingleUser").calledOnce;

    // calls the function
    await userControllers.updateUserController(req, res);

    // verify assertions and restore
    mockUserHanlers.verify();
    mockUserHanlers.restore();
  });

  it("Should call update multiple users if user ids list is given in body", async () => {
    const req = mockRequest({
      body: {
        ids: ["fakeID1", "fakeID2"],
        data: { stuff: "value" }
      },
      params: {},
      query: {}
    });
    const res = mockResponse();

    // This mocks every handlers but none of the controllers
    const mockUserHanlers = sinon.mock(users);

    // specifies all the mock expectations
    mockUserHanlers.expects("updateMultipleUsers").calledOnce;

    // calls the function
    await userControllers.updateUserController(req, res);

    // verify assertions and restore
    mockUserHanlers.verify();
    mockUserHanlers.restore();
  });
});
