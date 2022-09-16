const mongoose = require("mongoose");
const subTask1Schema = new mongoose.Schema({
  reward: {
    type: Number,
    required: true,
  },
  image: {
    type: Buffer,
    required: true,
  },
});

module.exports = mongoose.model("subTask1", subTask1Schema);
