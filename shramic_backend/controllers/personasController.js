const Persona = require("../models/Persona");

exports.getPersonas = async (req, res) => {
  try {
    const personas = await Persona.find();
    res.json(personas);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
