import * as jwt from "jsonwebtoken";

const jwtSecretKey = process.env.SECRET_KEY;

export const createToken = async (payload: any): Promise<String> => {
  return new Promise(async (resolve, reject) => {
    jwt.sign(payload, jwtSecretKey, (err, token: String) => {
      if (err) reject(err);
      resolve(token);
    });
  });
};

export const getTokenData = async (token: string): Promise<any> => {
  return new Promise((resolve, reject) => {
    jwt.verify(token, jwtSecretKey, (err, authData) => {
      if (err) reject(err);
      else resolve(authData);
    });
  });
};
