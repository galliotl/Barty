export class Regex{
  letterAndNumber= /^([a-z0-9]{1,})$/;
  phoneNumber= /^([+-]{0,1}[0-9]{10,13})$/;
}

export const verifyRegexPhone = (
    phone: string
  ): Boolean => {
      if (/^([+-]{0,1}[0-9]{10,13})$/.test(phone)) {
        return true;
      }
    return false;
  };
  //Regex.arguments.phoneNumber