const mongoose = require("mongoose");

const storySchema = new mongoose.Schema({
  name: String,
  role: String,
  location: String,
  quote: String,
  impact: String,
  avatarLetter: String,
  avatarColor: String,
});

module.exports = mongoose.model("Story", storySchema);
