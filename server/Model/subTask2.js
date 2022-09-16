const mongoose = require("mongoose");
const subTask2Schema = new mongoose.Schema({
  reward: {
    type: Number,
    required: true,
  },
  image: {
    type: Buffer,
    required: true,
  },
});

module.exports = mongoose.model("subTask2", subTask2Schema);
