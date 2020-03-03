# Barty - Authentication server

This folder contains an [expressJs](http://expressjs.com/) app.

## Use

We use this server for everything that has to do with auth.

### Users

#### Signup

Signup is a 2 step process:

- You send a first request with only just the phone, then we verify that this phone is not already in use

    -> If it is not, then we send you back a signup token that holds your phone information (it is therefore not necessary to send the phone number a second time) alongside a phone confirmation code

    -> If it is, then an error is triggered

- You send all the required information to signup a user alongside with the signup token either in the Authentication header or the body, then we process your information and log you in

#### Login

Login is straightforward, you send credentials (phone, psw) and we verify it then send back a login token, ensuring you can communicate with our API later

## API

### Signup

> Sending the phone to verification:

#### Definition

name | value 
--- | ---
route | `/users/signup/phone`
method | `POST`
middlewares | `none`

#### Params

body:

```
{
    "phone": string
}
```

header:

```
{
    "Content-Type": "json"
}
```

#### Response

body:

```
{
    "token": string,
    "confirmationCode": string,    
}
```

> Signing up:

#### Definition

name | value 
--- | ---
route | `/users/signup`
method | `POST`
middlewares | `verifyToken`

#### Params

body:

```
{
    "password": string,
    "name": string,
    "isMajor": boolean,
    "isPhoneConfirmed": boolean 
}
```

header:

```
{
    "Authorisation": "Token <your signup token here>",
    "Content-Type": "json"
}
```

#### Response

body:

```
{
    "token": string,
}
```

### Login

name | value 
--- | ---
route | `/users/login`
method | `POST`
middlewares | `none`


#### Params 

body:

```
{
    "phone": string,
    "password": string
}
```

header:

```
{
    "Content-Type": "json"
}
```

#### Response

body:

```
{
    "token": string,
}