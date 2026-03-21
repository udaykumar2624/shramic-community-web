const mongoose = require("mongoose");

const connectDB = async () => {
  try {
    await mongoose.connect(
      "mongodb+srv://shramic:shramic123@shramic.oydh9s5.mongodb.net/shramic?retryWrites=true&w=majority"
    );

    console.log("MongoDB Atlas Connected");
  } catch (error) {
    console.log("DB Error:", error.message);
    process.exit(1);
  }
};

module.exports = connectDB;