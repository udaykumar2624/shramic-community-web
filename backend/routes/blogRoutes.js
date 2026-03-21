const express = require("express");
const router = express.Router();

const {
  getAllPosts,
  getPostBySlug,
  createPost
} = require("../controllers/blogController");

router.get("/posts", getAllPosts);
router.get("/posts/:slug", getPostBySlug);
router.post("/posts", createPost);

module.exports = router;