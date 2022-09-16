const mongoose = require("mongoose");
const Schema = mongoose.Schema;
const taskSchema = new mongoose.Schema({
  title: {
    type: String,
    required: true,
  },
  description: {
    type: String,
    required: true,
  },
  startTime: {
    type: Date,
    required: true,
  },
  endTime: {
    type: Date,
    required: true,
  },
  reminder: {
    type: Number,
    required: true,
  },
  video: {
    type: Buffer,
    required: true,
  },
  isChecked: {
    type: Boolean,
    required: true,
  },
  subTask: {
    type: Schema.Types.ObjectId,
    ref: "subTask",
  },
});

module.exports = mongoose.model("task", taskSchema);
