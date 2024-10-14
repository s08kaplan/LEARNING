"use strict"

const express = require("express")
const app = express()

require("dotenv").config()

const PORT = process.env.PORT || 4002
const HOST = process.env.HOST || "127.0.0.1"

require("express-async-errors")

const { dbConnection } = require("./src/configs/dbConnection")
dbConnection()

app.use(require("cors")())
app.use(express.json())
app.use(express.urlencoded({extended: true}))

app.use("/", require("./src/routes/"))

app.get("/", (req, res) => {
  res.status(200).send({
    error: false,
    message:"Welcome whoever you are just come with happiness"
  })
})

app.get("/*", (req, res) => {
  res.status(404).send({
    error: true,
    message:"No valid route, you are lost turn back"
  })
})


app.use(require("./src/middlewares/errorHandler"))

app.listen(PORT, console.log(`Server is running on: http://${HOST}:${PORT}`))

// require('./src/helpers/databaseWarning')()