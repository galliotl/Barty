import * as express from "express";
import Bar from "./db/models/Bar";

const verifyMandatoryParams = (
  mandatoryParams: Array<string>,
  body: any
): Boolean => {
  mandatoryParams.forEach(param => {
    if (!body[param]) {
      return false;
    }
  });
  return true;
};

/**
 * Creates a bar
 * Verifies that the mandatory params are present in the request.body
 * then passes it to the mangoose object to create one.
 */
export const handleCreateBar = async params => {
  if (
    !verifyMandatoryParams(
      [
        "name",
        "photoUrl",
        "address",
        "events",
        "beverages",
        "description",
        "phone",
        "mail",
        "openingHour",
        "closingHour"
      ],
      params
    )
  ) {
    return { status: 422, body: "wrong params entered" };
  }

  try {
    const bar = new Bar(params);
    await bar.save();
    return { status: 200, body: { id: bar.id } };
  } catch {
    return { status: 500, body: "cannot create bar" };
  }
};

/**
 * Takes the given id and removes the associated bar
 */
export const handleRetreiveBar = async params => {
  const { id } = params;
  if (!verifyMandatoryParams(["id"], params)) {
    return { status: 422, body: "missing mandatory params" };
  }
  try {
    const bar = Bar.findById(id);
    return { status: 200, body: { bar: bar } };
  } catch {
    return { status: 500, body: "couldn't retreive this bar" };
  }
};

/**
 * Removes a bar given its id
 */
export const handleDeleteBar = async params => {
  const { id } = params;
  if (!verifyMandatoryParams(["id"], params)) {
    return { status: 422, body: "missing mandatory params" };
  }
  try {
    await Bar.findByIdAndDelete(id);
    return { status: 200, body: "removed" };
  } catch {
    return { status: 500, body: "couldn't remove" };
  }
};

/**
 * Updates a bar
 */
export const handleUpdateBar = async params => {
  const { id } = params;
  delete params.id;
  try {
    const bar = await Bar.findById(id);
    bar.update(params);
    bar.save();
  } catch (err) {
    console.log(err);
    return { status: 500, body: "couldn't update" };
  }
};
