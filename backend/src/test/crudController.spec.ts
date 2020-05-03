// external libraries
import 'mocha';
import { mockRequest, mockResponse } from 'mock-req-res';
import * as sinon from 'sinon';
import UserModel from '../db/models/user';

// internal libraries
import CRUDController from '../controllers/crud';

// Declare constants
const crud = new CRUDController(UserModel, 'fakeModel');
const sandbox = sinon.createSandbox();

describe('Test get controller', () => {
  afterEach(() => {
    sandbox.restore();
  });

  it('Should call get single when id is in params', async () => {
    // Mock request and response
    const req = mockRequest({
      headers: {},
      body: {},
      params: { id: 'fakeId' },
      query: {},
    });
    const res = mockResponse();

    // Stub function that should be called
    const stubbed = sandbox
      .stub(crud, 'getSingle')
      .returns(new Promise((r) => r(res)));

    // Call the tested method
    await crud.getController(req, res);

    // Assertions
    sandbox.assert.calledOnce(stubbed);
  });
  it('Should call get single when id is in query', async () => {
    // Mock request and response
    const req = mockRequest({
      headers: {},
      body: {},
      params: {},
      query: { id: 'fakeId' },
    });
    const res = mockResponse();

    // Stub function that should be called
    const stubbed = sandbox
      .stub(crud, 'getSingle')
      .returns(new Promise((r) => r(res)));

    // Call the tested method
    await crud.getController(req, res);

    // Assertions
    sandbox.assert.calledOnce(stubbed);
  });
  it('Should call get by ids when ids is in query', async () => {
    // Mock request and response
    const req = mockRequest({
      headers: {},
      body: {},
      params: {},
      query: { ids: ['fakeId'] },
    });
    const res = mockResponse();

    // Stub function that should be called
    const stubbed = sandbox
      .stub(crud, 'getByIds')
      .returns(new Promise((r) => r(res)));

    // Call the tested method
    await crud.getController(req, res);

    // Assertions
    sandbox.assert.calledOnce(stubbed);
  });
  it('Should call get paginated when offset is in query', async () => {
    // Mock request and response
    const req = mockRequest({
      headers: {},
      body: {},
      params: {},
      query: { offset: 20 },
    });
    const res = mockResponse();

    // Stub function that should be called
    const stubbed = sandbox
      .stub(crud, 'getAllPaginated')
      .returns(new Promise((r) => r(res)));

    // Call the tested method
    await crud.getController(req, res);

    // Assertions
    sandbox.assert.calledOnce(stubbed);
  });
  it('Should call get all for anything else', async () => {
    // Mock request and response
    const req = mockRequest({
      headers: {},
      body: { id: 'misplaced id', ids: ['misplaced id'] },
      params: { ido: 'typo' },
      query: { ido: ['typo'] },
    });
    const res = mockResponse();

    // Stub function that should be called
    const stubbed = sandbox
      .stub(crud, 'getAll')
      .returns(new Promise((r) => r(res)));

    // Call the tested method
    await crud.getController(req, res);

    // Assertions
    sandbox.assert.calledOnce(stubbed);
  });
});

describe('Test post controller', () => {
  afterEach(() => {
    sandbox.restore();
  });

  it('Should call post single when data is an object', async () => {
    // Mock request and response
    const req = mockRequest({
      headers: {},
      body: { data: { fake: 'object' } },
      params: {},
      query: {},
    });
    const res = mockResponse();

    // Stub function that should be called
    const stubbed = sandbox
      .stub(crud, 'createSingle')
      .returns(new Promise((r) => r(res)));

    // Call the tested method
    await crud.postController(req, res);

    // Assertions
    sandbox.assert.calledOnce(stubbed);
  });
  it('Should call post multiple when data is an array', async () => {
    // Mock request and response
    const req = mockRequest({
      headers: {},
      body: { data: [{ fake: 'object' }] },
      params: {},
      query: {},
    });
    const res = mockResponse();

    // Stub function that should be called
    const stubbed = sandbox
      .stub(crud, 'createMultiple')
      .returns(new Promise((r) => r(res)));

    // Call the tested method
    await crud.postController(req, res);

    // Assertions
    sandbox.assert.calledOnce(stubbed);
  });
  it('Should reject with 400 when no data is sent', async () => {
    // Mock request and response
    const req = mockRequest({
      headers: {},
      body: {},
      params: {},
      query: {},
    });
    const res = mockResponse();

    // Call the tested method
    await crud.postController(req, res);

    // Assertions
    sandbox.assert.calledWith(res.status, 400);
  });

  it('Should reject with 422 when type is unprocessable', async () => {
    // Mock request and response
    const req = mockRequest({
      headers: {},
      body: { data: 'string' },
      params: {},
      query: {},
    });
    const res = mockResponse();

    // Call the tested method
    await crud.postController(req, res);

    // Assertions
    sandbox.assert.calledWith(res.status, 422);
  });
});

describe('Test delete controller', () => {
  afterEach(() => {
    sandbox.restore();
  });

  it('Should call delete single when id is present in params', async () => {
    // Mock request and response
    const req = mockRequest({
      headers: {},
      body: {},
      params: { id: 'fakeId' },
      query: {},
    });
    const res = mockResponse();

    // Stub function that should be called
    const stubbed = sandbox
      .stub(crud, 'deleteSingle')
      .returns(new Promise((r) => r(res)));

    // Call the tested method
    await crud.deleteController(req, res);

    // Assertions
    sandbox.assert.calledOnce(stubbed);
  });
  it('Should call delete single when id is present in query', async () => {
    // Mock request and response
    const req = mockRequest({
      headers: {},
      body: {},
      params: {},
      query: { id: 'fakeId' },
    });
    const res = mockResponse();

    // Stub function that should be called
    const stubbed = sandbox
      .stub(crud, 'deleteSingle')
      .returns(new Promise((r) => r(res)));

    // Call the tested method
    await crud.deleteController(req, res);

    // Assertions
    sandbox.assert.calledOnce(stubbed);
  });
  it('Should call delete multiple when ids is in query', async () => {
    // Mock request and response
    const req = mockRequest({
      headers: {},
      body: {},
      params: {},
      query: { ids: ['fakeId'] },
    });
    const res = mockResponse();

    // Stub function that should be called
    const stubbed = sandbox
      .stub(crud, 'deleteMultiple')
      .returns(new Promise((r) => r(res)));

    // Call the tested method
    await crud.deleteController(req, res);

    // Assertions
    sandbox.assert.calledOnce(stubbed);
  });
  it('Should call delete multiple when ids is in body', async () => {
    // Mock request and response
    const req = mockRequest({
      headers: {},
      body: { ids: ['fakeId'] },
      params: {},
      query: {},
    });
    const res = mockResponse();

    // Stub function that should be called
    const stubbed = sandbox
      .stub(crud, 'deleteMultiple')
      .returns(new Promise((r) => r(res)));

    // Call the tested method
    await crud.deleteController(req, res);

    // Assertions
    sandbox.assert.calledOnce(stubbed);
  });
  it('Should reject with 400 when no id is sent', async () => {
    // Mock request and response
    const req = mockRequest({
      headers: {},
      body: {},
      params: {},
      query: {},
    });
    const res = mockResponse();

    // Call the tested method
    await crud.deleteController(req, res);

    // Assertions
    sandbox.assert.calledWith(res.status, 400);
  });
});

describe('Test put controller', () => {
  afterEach(() => {
    sandbox.restore();
  });

  it('Should call update single when id is present in params', async () => {
    // Mock request and response
    const req = mockRequest({
      headers: {},
      body: { data: {} },
      params: { id: 'fakeId' },
      query: {},
    });
    const res = mockResponse();

    // Stub function that should be called
    const stubbed = sandbox
      .stub(crud, 'updateSingle')
      .returns(new Promise((r) => r(res)));

    // Call the tested method
    await crud.putController(req, res);

    // Assertions
    sandbox.assert.calledOnce(stubbed);
  });
  it('Should call update single when id is present in body', async () => {
    // Mock request and response
    const req = mockRequest({
      headers: {},
      body: { data: {}, id: 'fakeId' },
      params: {},
      query: {},
    });
    const res = mockResponse();

    // Stub function that should be called
    const stubbed = sandbox
      .stub(crud, 'updateSingle')
      .returns(new Promise((r) => r(res)));

    // Call the tested method
    await crud.putController(req, res);

    // Assertions
    sandbox.assert.calledOnce(stubbed);
  });
  it('Should call update multiple when ids is in body', async () => {
    // Mock request and response
    const req = mockRequest({
      headers: {},
      body: { data: {}, ids: ['fakeId'] },
      params: {},
      query: {},
    });
    const res = mockResponse();

    // Stub function that should be called
    const stubbed = sandbox
      .stub(crud, 'updateMultiple')
      .returns(new Promise((r) => r(res)));

    // Call the tested method
    await crud.putController(req, res);

    // Assertions
    sandbox.assert.calledOnce(stubbed);
  });
  it('Should reject with 400 when no id is sent', async () => {
    // Mock request and response
    const req = mockRequest({
      headers: {},
      body: { data: {} },
      params: {},
      query: {},
    });
    const res = mockResponse();

    // Call the tested method
    await crud.putController(req, res);

    // Assertions
    sandbox.assert.calledWith(res.status, 400);
  });
  it('Should reject with 400 when no data is sent', async () => {
    // Mock request and response
    const req = mockRequest({
      headers: {},
      body: { ids: [] },
      params: {},
      query: {},
    });
    const res = mockResponse();

    // Call the tested method
    await crud.putController(req, res);

    // Assertions
    sandbox.assert.calledWith(res.status, 400);
  });
});
