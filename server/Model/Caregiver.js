import "package:myplanner_nodeapp/server/Model/Learner.js";

const mongoose = require("mongoose");
const Schema = mongoose.Schema;
const caregiverSchema = new mongoose.Schema({
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
  learners: [{ type: Schema.Types.ObjectId, ref: "learner" }],
});
module.exports = mongoose.model("caregiver", caregiverSchema); //node's way of exporting a file  (name of table, the actual table made)
