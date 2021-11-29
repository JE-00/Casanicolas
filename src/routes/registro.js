const express = require('express')
const router = express.Router();

const pool = require('../database');

router.get('/registrar', (req, res) => {
    res.render('registro/registrar');
});

router.post('/registrar', (req, res) => {
    res.send('recieved');
});

module.exports = router;
