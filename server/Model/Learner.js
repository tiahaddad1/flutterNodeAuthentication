import "package:myplanner_nodeapp/server/Model/Task.js";
import "package:myplanner_nodeapp/server/Model/Reward.js";
import "package:myplanner_nodeapp/server/Model/Reminder.js";
import "package:myplanner_nodeapp/server/Model/Skill.js";
const mongoose = require("mongoose");
const Schema = mongoose.Schema;
const learnerSchema = new mongoose.Schema({
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
  image: {
    type: Buffer,
    required: true,
  },
  dateOfBirth: {
    type: Date,
    required: true,
  },
  tasks: [{ type: Schema.Types.ObjectId, ref: "task" }],
  reminders: [{ type: Schema.Types.ObjectId, ref: "reminder" }],
  skills: [{ type: Schema.Types.ObjectId, ref: "skill" }],
  rewards: [{ type: Schema.Types.ObjectId, ref: "reward" }],
});
module.exports = mongoose.model("learner", learnerSchema); //node's way of exporting a file  (name of table, the actual table made)
