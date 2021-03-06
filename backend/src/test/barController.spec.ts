// external libraries
import "mocha";
import { mockRequest, mockResponse } from "mock-req-res";
import * as bcryptjs from "bcryptjs";
import * as sinon from "sinon";

// internal libraries
import * as core from "../utils/coreFunctions";
import * as tokenHelpers from "../utils/tokenHelpers";
import bar from "../controllers/bars";
import Bar from "../db/models/bar";
import {AddressBar} from "../db/models/addressBar";
import { doesNotMatch } from "assert";

// Constants
const fakeId = "5e80f429d5b721001194a779";
const fakeName = "Nom du Bar";
const fakePassword = "password";
const wrongPassword = "pass";
const hashedPassword = bcryptjs.hashSync(fakePassword, 10);
const fakePhotoUrl = "https://lorenzomevellec.fr/image/fond.jpg";
const fakeNumber = "0666666666";
const fakeFields = ["photoUrl:" + fakePhotoUrl];

//Test bar creation
/**
 * Il faut refaire ces tests puisque je les avais fais avant que Tim n'implémente la vérification par mail
 */
/*
describe("Test bar creation", () => {
  before(() => {
    // This pretends we do a call to the db and only returns required fields
    sinon.replace(Bar.prototype, "save", sinon.fake());
    sinon.replace(tokenHelpers, "createToken", sinon.fake.returns("token"));
  });
  after(() => {
    // resets all stubs
    sinon.restore();
    sinon.reset();
  });

  it("Should return 200 when everything is ok", async () => {
    // builds a fake request
    const req = mockRequest({
      body: {
        name: "nameBar",
        password: "password",
        photoUrl: "http://lorenzomevellec.fr/image/fond.jpg",
        address: {
          streetAdress: "22 rue Carnot",
          city: "Palaiseau",
          postalCode: "91120",
          country: "France",
        },
        phone: "0666666716",
        mail: "cjndcmipfjt@gmail.com",
        description: "This is the most beautiful bar you ever seen",
        openingHour: {
          hour: "16",
          minute: "00",
        },
        closingHour: {
          hour: "01",
          minute: "00",
        },
        beverages: [{ category: "beer", name: "Chouffe" }],
      },
    });
    const res = mockResponse();
    await bar.createBarController(req, res);
    sinon.assert.calledWith(res.status, 200);
  });

  it("Should return 400 when a param is missing", async () => {
    const req = mockRequest({
      body: {
        name: "nameBar",
        //password: "password",
        photoUrl: "http://lorenzomevellec.fr/image/fond.jpg",
        address: {
          streetAdress: "22 rue Carnot",
          city: "Palaiseau",
          postalCode: "91120",
          country: "France",
        },
        phone: "0666666716",
        mail: "cjndcmipfjt@gmail.com",
        description: "This is the most beautiful bar you ever seen",
        openingHour: {
          hour: "16",
          minute: "00",
        },
        closingHour: {
          hour: "01",
          minute: "00",
        },
        beverages: [{ category: "beer", name: "Chouffe" }],
      },
    });
    const res = mockResponse();
    await bar.createBarController(req, res);
    sinon.assert.calledWith(res.status, 400);
  });

  it("Should return 403 if a beverage doesn't exist", async () => {
    const req = mockRequest({
      body: {
        name: "nameBar",
        password: "password",
        photoUrl: "http://lorenzomevellec.fr/image/fond.jpg",
        address: {
          streetAdress: "22 rue Carnot",
          city: "Palaiseau",
          postalCode: "91120",
          country: "France",
        },
        phone: "0666666716",
        mail: "cjndcmipfjt@gmail.com",
        description: "This is the most beautiful bar you ever seen",
        openingHour: {
          hour: "16",
          minute: "00",
        },
        closingHour: {
          hour: "01",
          minute: "00",
        },
        beverages: [{ category: "ber", name: "Chouffe" }], //"ber" doesn't exist
      },
    });
    const res = mockResponse();
    await bar.createBarController(req, res);
    sinon.assert.calledWith(res.status, 403);
  });
});
*/

//Test getting bar
describe("Get bar", () => {
  before(() => {
    // This pretends we do a call to the db and only returns required fields
    sinon.replace(Bar, "findById", sinon.fake.returns(fakeId));
    sinon.replace(tokenHelpers, "createToken", sinon.fake.returns("token"));
  });
  after(() => {
    // resets all stubs
    sinon.restore();
    sinon.reset();
  });

  it("Should return 200 when everything is ok", async () => {
    // builds a fake request
    const req = mockRequest({
      query: {
        id: fakeId,
      },
    });
    const res = mockResponse();
    await bar.getBarController(req, res);
    sinon.assert.calledWith(res.status, 200);
  });

  it("Should return 403 when the id is missing", async () => {
    // builds a fake request
    const req = mockRequest({
      query: {
        //id:fakeId //here obviously id is missing
      },
    });
    const res = mockResponse();
    await bar.getBarController(req, res);
    sinon.assert.calledWith(res.status, 403);
  });
});

//Test updating bar
describe("Update bar", () => {
  before(() => {
    // This pretends we do a call to the db and only returns required fields
    sinon.replace(Bar, "findOne", sinon.fake.returns(fakeId));
    sinon.replace(Bar.prototype, "save", sinon.fake());
  });
  after(() => {
    // resets all stubs
    sinon.restore();
    sinon.reset();
  });

  /*it("Should return 200 when everything is ok", async () => {
    // builds a fake request
    const req = mockRequest({
      body: {
        id: fakeId,
        fields: ["photoUrl"],
        photoUrl: fakePhotoUrl,
      },
    });
    const res = mockResponse();
    await bar.updateBarController(req, res);
    sinon.assert.calledWith(res.status, 200);
  });*/

  it("Should return 403 when id or fields is missing", async () => {
    const req = mockRequest({
      body: {
        //id: fakeId,
        fields: ["photoUrl"],
        photoUrl: fakePhotoUrl,
      },
    });
    const res = mockResponse();
    await bar.updateBarController(req, res);
    sinon.assert.calledWith(res.status, 403);
  });
});

//Test deleting bar
describe("Delete bar", () => {
  before(() => {
    sinon.replace(Bar, "findByIdAndDelete", sinon.fake.returns(true));
    sinon.replace(Bar.prototype, "save", sinon.fake());
  });
  after(() => {
    sinon.restore();
    sinon.reset();
  });

  it("Should return 200 when everything is ok", async () => {
    const req = mockRequest({
      body: {
        id: fakeId,
      },
    });
    const res = mockResponse();
    await bar.deleteBarController(req, res);
    sinon.assert.calledWith(res.status, 200);
  });

  it("Should return 403 when the id is missing", async () => {
    const req = mockRequest({
      body: {
        //id:fakeId //here obviously id is missing
      },
    });
    const res = mockResponse();
    await bar.deleteBarController(req, res);
    sinon.assert.calledWith(res.status, 403);
  });
});
