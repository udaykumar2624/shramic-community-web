const express = require("express");
const cors = require("cors");
const dotenv = require("dotenv");
const mongoose = require("mongoose");

dotenv.config();

const app = express();
const PORT = process.env.PORT || 5000;

app.use(cors({ origin: process.env.CORS_ORIGIN }));
app.use(express.json());

app.use("/api/metrics", require("./routes/metrics"));
app.use("/api/stories", require("./routes/stories"));
app.use("/api/personas", require("./routes/personas"));
app.use("/api/calculator", require("./routes/calculator"));
app.use("/api/contact", require("./routes/contact"));

app.get("/", (req, res) => {
  res.json({ status: "Shramic API running" });
});

mongoose
  .connect(process.env.MONGO_URI)
  .then(() => {
    console.log("MongoDB connected");
    app.listen(PORT, () => {
      console.log(`Server running on http://localhost:${PORT}`);
    });
  })
  .catch((err) => console.error("MongoDB error:", err));
