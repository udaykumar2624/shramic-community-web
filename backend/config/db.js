const mongoose = require("mongoose");

const connectDB = async () => {
  try {
    await mongoose.connect(
      ""
    );

    console.log("MongoDB Atlas Connected");
  } catch (error) {
    console.log("DB Error:", error.message);
    process.exit(1);
  }
};

module.exports = connectDB;
