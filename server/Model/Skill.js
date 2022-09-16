const mongoose = require("mongoose");
const Schema = mongoose.Schema;
const skillSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  isChecked: {
    type: Boolean,
    required: true,
  },
  image: {
    type: Buffer,
    required: true,
  },
  inProgress: {
    type: Boolean,
    required: true,
  },
  certificate: {
    type: Buffer,
    required: false,
  },
});

module.exports = mongoose.model("skill", skillSchema);
