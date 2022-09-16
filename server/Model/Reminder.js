const mongoose = require("mongoose");
const Schema = mongoose.Schema;
const reminderSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  isChecked: {
    type: Boolean,
    required: true,
  },
});

module.exports = mongoose.model("reminder", reminderSchema);
