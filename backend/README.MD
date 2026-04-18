# Shramic Blog Backend

## 🚀 Tech Stack
- Node.js
- Express.js
- MongoDB Atlas
- Mongoose

## 📌 Features
- Get all blog posts
- Get blog by slug
- Create blog post

## ⚙️ Setup Instructions

### 1. Install dependencies
npm install

### 2. Create .env file
MONGO_URI=your_mongodb_connection_string
PORT=5000

### 3. Run backend
npx nodemon server.js

## 🌐 API Endpoints
- GET /api/blog/posts
- GET /api/blog/posts/:slug
- POST /api/blog/posts

## 🧠 Note
Make sure MongoDB Atlas IP access is enabled.