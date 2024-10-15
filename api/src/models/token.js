"use strict"

"use strict"

const { mongoose: { Schema, model} } = require("../configs/dbConnection")

const TokenSchema = new Schema({
  userId: {
    type: Schema.Types.ObjectId,
    ref:"User",
    required: true,
    unique: true,
    index: true
  },

  token : {
    type: String,
    trim: true,
    required: true,
    unique: true,
    index: true
  }
}, {
    timestamps: true,
    collection:"tokens"
})

module.exports = model("Token", TokenSchema)