"use strict"

const { pbkdf2Sync } = require("node:crypto")

const keyCode = process.env.SECRET_KEY
const loopCount = 10_000
const charCount = 32
const encType = "sha512"

const encryptFunc = (password) => {
    return pbkdf2Sync(password, keyCode, loopCount, charCount, encType).toString("hex")
}

const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,20}$/

const passwordEncrypt = (password) => {
  if (passwordRegex.test(password)) {
    return encryptFunc(password)
  }else {
    throw new Error("Please enter a valid password according to the requirements")
  }
}

const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/

const emailValidate = (email) => {
  if (emailRegex.test(email)) {
    return email
  }else {
    throw new Error("Please enter a valid email")
  }
}

module.exports = {
    emailValidate,
    passwordEncrypt,
    encryptFunc
}