"use strict"

const router = require("express").Router()

//! auth 
router.use("/auth", require("./auth"))

//! user 
router.use("/users", require("./user"))

//! token
router.use("/tokens", require("./token"))

module.exports = router