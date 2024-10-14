"use strict"

const User = require("../models/user")

module.exports = {
    list: async (req, res) => {
      const data = await User.find()

      res.status(200).send({
        error: false,
        data
      })
    },

    create: async (req, res) => {
        req.body.isAdmin = false

        const data = await User.create(req.body)

        res.status(201).send({
            error: false,
            data
        })
    },

    read: async (req, res) => {
      const data = await User.findOne({_id: req.params.userId})

      res.status(202).send({
        error: false,
        data
      })
    },

    update: async (req, res) => {
      const data = await User.updateOne({_id: req.params.userId})

      res.status(202).send({
        error: false,
         data
      })
    },

    delete: async (req, res) => {
      const { deletedCount } = await User.deleteOne({_id: req.params.userId})

      res.status(deletedCount ? 204 : 404).send({
        error: !!!deletedCount,
      })
    },
}