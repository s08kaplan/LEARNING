"use strict"

const { mongoose: { Schema, model} } = require("../configs/dbConnection")
const { emailValidate, passwordEncrypt } = require("../helpers/validationFuncs")

const UserSchema = new Schema({
    username: {
        type: String,
        trim: true,
        required: true,
        index: true
    },

    email: {
        type: String,
        trim: true,
        required: true,
        index: true,
        set:(email) => emailValidate(email)
    },

    password: {
        type: String,
        trim: true,
        required: true,
        index: true,
        set:(password) => passwordEncrypt(password)
    },

    image: String,

    isAdmin: {
        type:Boolean,
        default: false
    }
}, {
    timestamps: true,
    collection:"users"
})

module.exports = model("User", UserSchema)