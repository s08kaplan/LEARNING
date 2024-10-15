"use strict"

const User = require("../models/user")
const Token = require("../models/token")
const { passwordEncrypt, encryptFunc } = require("../helpers/validationFuncs")


module.exports = {
    login: async (req, res) => {
      const { username, email, password } = req.body

      if(!(username && email && password)){
        res.errorStatusCode = 400
        throw new Error("Username, email and password required")
      }

      const user = await User.findOne({$and: [{username}, {email}], password})

      if(!user){
        res.errorStatusCode = 401
        throw new Error("Provided credentials are wrong check again please")
      }

      if(user && user.password == passwordEncrypt(password)){
        let tokenData = await Token.findOne({userId: user._id})

        if(!tokenData){
            const tokenKey = encryptFunc(Date.now() + user._id)
            tokenData = await Token.create({userId: user._id, token: tokenKey})
        }
      }

      res.status(200).send({
        error: false,
        token: tokenData.token,
        user
      })
    },

    logout: async (req, res) => {
      const auth = req.headers?.authorization || null
      const tokenKey = auth ? auth.split(" ") : null

    const token = tokenKey ? tokenKey[1] : null

    const { deletedCount } = await Token.deleteOne({ token })

    res.status( deletedCount ? 204 : 404 ).send({
        error: !!!deletedCount,
        message: deletedCount ? "Logged out successfully" : "Something went wrong!!!"
    })

    }
}