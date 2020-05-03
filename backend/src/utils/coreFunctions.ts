var nodemailer = require('nodemailer');
import * as express from "express";

/**
 * This function takes in a phone number and sends an sms
 * to the phone number with the confirmation code.
 * Finally it sends back the confirmtion code
 * @param phone - phone number
 */
export const sendConfirmationCode = (phone: String): String => {
    return "0000";
}
/**
 * This function sends an email to an adress mail with the confirmation code.
 * Sends back the confirmation code.
 * @param mail - mail adress
 */
export const sendConfirmationMail = (mail: String): String => {
    const aleatoire = Math.floor(Math.random() * (9999 - 1000 + 1)) + 1000;
    const code = aleatoire.toString();
    var transporter = nodemailer.createTransport({ service: 'gmail', auth: { user: 'bartyy.test@gmail.com', pass: 'Barty10000' } });
    const mailOptions = { from: 'bartyy.test@gmail.com', to: mail, subject: 'Mail verification', text: 'Your code :  ' +  code};
    transporter.sendMail(mailOptions);
    return code;
}