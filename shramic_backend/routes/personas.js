const express = require("express");
const router = express.Router();
const { getPersonas } = require("../controllers/personasController");

router.get("/", getPersonas);

module.exports = router;
