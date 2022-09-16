import "package:myplanner_nodeapp/server/Model/subTask1.js";
import "package:myplanner_nodeapp/server/Model/subTask2.js";
const mongoose = require("mongoose");
const Schema = mongoose.Schema;
const subTaskSchema = new mongoose.Schema({
  subTask1ID: {
    type: Schema.Types.ObjectId,
    ref: "subTask1",
  },
  subTask2ID: {
    type: Schema.Types.ObjectId,
    ref: "subTask2",
  },
  startTime: {
    type: Date,
    required: true,
  },
  endTime: {
    type: Date,
    required: true,
  },
});
module.exports = mongoose.model("subTask", taskSchema);
