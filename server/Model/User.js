const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
  firstName: {
    type: String,
    required: true,
  },
  lastName: {
    type: String,
    required: true,
  },
  email: {
    unique: true,
    type: String,
    required: true,
  },
  password: {
    type: String,
    required: true,
  },
  //   dOB: {
  //     type: Date,
  //     required: true,
  //   },
});

module.exports = mongoose.model("users", userSchema); //node's way of exporting a file  (name of table, the actual table made)
