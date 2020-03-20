import * as jwt from "jsonwebtoken";

const jwtSecretKey = process.env.SECRET_KEY;

/**
 * This function takes in data and returns a jwt token (string)
 * associated to it
 * @param payload - data to tokenized
 * @param secretKey - optional secret key (for testing purposes)
 */
export const createToken = async (payload: any, secretKey=jwtSecretKey): Promise<string> => {
  return new Promise(async (resolve, reject) => {
    jwt.sign(payload, secretKey, (err, token: string) => {
      if (err) reject(err);
      resolve(token);
    });
  });
};

/**
 * This function takes in a jwt token and returns associated data
 * @param token - the string token to get data from
 * @param secretKey - optional secret key (for testing purposes)
 */
export const getTokenData = async (token: string, secretKey=jwtSecretKey): Promise<any> => {
  return jwt.verify(token, secretKey, (err, data) => {
    if (err) throw err;
    else return data;
  });
};
