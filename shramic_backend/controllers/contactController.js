const Contact = require("../models/Contact");

exports.submitContact = async (req, res) => {
  try {
    const { fullName, email, phoneNumber, subject, message } = req.body;

    if (!fullName || !email || !phoneNumber || !subject || !message) {
      return res.status(400).json({ error: "All fields are required" });
    }

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
      return res.status(400).json({ error: "Invalid email format" });
    }

    const contact = new Contact({
      fullName,
      email,
      phoneNumber,
      subject,
      message,
    });
    await contact.save();

    res
      .status(201)
      .json({ success: true, message: "Message sent successfully" });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.getContacts = async (req, res) => {
  try {
    const contacts = await Contact.find().sort({ createdAt: -1 });
    res.json(contacts);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
