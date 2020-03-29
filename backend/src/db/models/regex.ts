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
 
  export const verifyRegexMail = (
    mail: string
  ): Boolean => {
      if (/^[0-9a-z._-]+@{1}[0-9a-z.-]{2,}[.]{1}[a-z]{2,5}$/.test(mail)) {
        return true;
      }
    return false;
  };
