const mongoose = require("mongoose");
const Schema = mongoose.Schema;
const rewardSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  starsReward: {
    type: Number,
    required: true,
  },
  image: {
    type: Buffer,
    required: true,
  },
  giveReward: {
    type: Boolean,
    required: false,
  },
});

module.exports = mongoose.model("reward", rewardSchema);
