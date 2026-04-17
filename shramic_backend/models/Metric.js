const mongoose = require("mongoose");

const metricSchema = new mongoose.Schema({
  icon: String,
  value: String,
  label: String,
  color: String,
});

module.exports = mongoose.model("Metric", metricSchema);
