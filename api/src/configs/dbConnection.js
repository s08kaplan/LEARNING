"use strict"

const mongoose = require("mongoose")

const dbConnection = () => {
  mongoose.connect(process.env.MONGODB)
  .then(() => console.log("DB CONNECTED SUCCESSFULLY"))
  .catch((error) => console.log("Connection ERROR!!!!!!", error))
}

module.exports = {
    mongoose,
    dbConnection
}