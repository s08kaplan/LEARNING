"use strict" 

module.exports = {
    isLogin: (req, res, next) => {

        if(req.user) {
            next()
        }else {
            res.errorStatusCode = 403
            throw new Error("Login please")
        }
    },

    isAdmin: (req, res, next) => {
        if (req.user && req.user.isAdmin) {
            next()
        }else {
            res.errorStatusCode = 403
            throw new Error("You are not authorized person")
        }
    }
}