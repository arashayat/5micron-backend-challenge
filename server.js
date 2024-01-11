
const express = require('express');
const { body, validationResult } = require('express-validator');
require('dotenv').config();

const app = express();
const pool = require('./db');

app.use(express.json());


app.post('/api/sensory', [
    body('serial').not().isEmpty().trim().escape(),
    body('swVersion').not().isEmpty().trim().escape(),
    body('temperature').isFloat(),
    body('date').isISO8601(),
    body('gps').not().isEmpty()
], async (req, res) => {

    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        return res.status(400).json({ errors: errors.array() });
    }

    const client = await pool.connect();

    try {
        // Decode request Body
        data = req.body;

        // Sql Insert Query
        const query = 'INSERT INTO sensory_data (serial, "swVersion", temperature, date, gps) VALUES ($1, $2, $3, $4::TIMESTAMP, $5::POINT)';
        const values = [data.serial, data.swVersion, data.temperature, data.date, data.gps];

        const result = await client.query(query, values)
        client.release();

        res.status(201).send("Successfuly inserted data");

    } catch (err) {
        client?.release();
        // If there is an error, send the error message
        res.status(500).send(err.message || 'Could not store data');
    }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log('Server is running on http://localhost:3000');
});
