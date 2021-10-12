'use strict';

const express = require('express');

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', (req, res) => {
    const name = process.env.NAME || 'Spot';
    console.log(`Hello World. I am ${name}`);
    res.setHeader('Content-Type', 'application/json');
    res.send(JSON.stringify({ "message": `Hello World. I am ${name}`}));
});

app.get('/health', (req, res) => {
    console.log(`Just checking if I am healthy`);
    res.setHeader('Content-Type', 'application/json');
    res.send(JSON.stringify({ "status": "UP" }));
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
