const mongoose = require("mongoose");

const personaSchema = new mongoose.Schema({
  key: String,
  emoji: String,
  name: String,
  title: String,
  description: String,
  painPoint: String,
  needs: [String],
});

module.exports = mongoose.model("Persona", personaSchema);
