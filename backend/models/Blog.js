const mongoose = require("mongoose");

const blogSchema = new mongoose.Schema({
  slug: String,
  title: String,
  content: String
});

module.exports = mongoose.model("Blog", blogSchema);