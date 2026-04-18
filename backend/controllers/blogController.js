const Blog = require("../models/Blog");

// GET ALL POSTS
exports.getAllPosts = async (req, res) => {
  try {
    const posts = await Blog.find();
    res.json(posts);
  } catch (error) {
    res.status(500).json({ message: "Server Error" });
  }
};

// GET SINGLE POST
exports.getPostBySlug = async (req, res) => {
  try {
    const post = await Blog.findOne({ slug: req.params.slug });

    if (!post) {
      return res.status(404).json({ message: "Post not found" });
    }

    res.json(post);
  } catch (error) {
    res.status(500).json({ message: "Server Error" });
  }
};

// CREATE POST (for testing)
exports.createPost = async (req, res) => {
  try {
    const newPost = new Blog(req.body);
    await newPost.save();

    res.json(newPost);
  } catch (error) {
    res.status(500).json({ message: "Error creating post" });
  }
};