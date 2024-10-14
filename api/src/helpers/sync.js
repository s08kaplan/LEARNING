"use strict";

module.exports = async function () {
  
  const { mongoose } = require("../configs/dbConnection");
  await mongoose.connection.dropDatabase();
  console.log("!!!Database and all data in it DELETED!!!!");
  
  const User = require("../models/user");

  await User.create([
    {
      _id: "65343222b67e9681f937f511",
      username: "admin",
      password: "Admin123*",
      email: "admin@gmail.com",
      isAdmin: true,
    },

    {
      _id: "65343222b67e9681f937f514",
      username: "Ali",
      password: "Ali1234*",
      email: "ali@gmail.com",
      isAdmin: false,
    },
    {
      _id: "65343222b67e9681f937f515",
      username: "Veli",
      password: "Veli123*",
      email: "veli@gmail.com",
      isAdmin: false,
    },
    {
      _id: "65343222b67e9681f937f516",
      username: "Danny",
      password: "Danny123*",
      email: "danny@gmail.com",
      isAdmin: false,
    },
    {
      _id: "65343222b67e9681f937f517",
      username: "Jenny",
      password: "Jenny123*",
      email: "jenny@gmail.com",
      isAdmin: false,
    },
    {
      _id: "65343222b67e9681f937f518",
      username: "Daniel",
      password: "Daniel123*",
      email: "daniel@gmail.com",
      isAdmin: false,
    },
  ]);

  console.log("****Users added****");
  
console.log("sync process finished successfully");
};