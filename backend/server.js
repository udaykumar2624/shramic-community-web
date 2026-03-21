const express = require("express");
const cors = require("cors");
const connectDB = require("./config/db");

const blogRoutes = require("./routes/blogRoutes");

const app = express();

connectDB();

app.use(cors());
app.use(express.json());

app.use("/api/blog", blogRoutes);

app.get("/", (req, res) => {
  res.send("Shramic Backend Running");
});

const PORT = 5000;

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});