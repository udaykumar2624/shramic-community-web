const Story = require("../models/Story");

exports.getStories = async (req, res) => {
  try {
    const stories = await Story.find();
    res.json(stories);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
