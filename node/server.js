'use strict';

const express = require('express');
var os = require("os");

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', (req, res) => {
  res.send('Hi, my name is: ' + os.hostname()+ '\n');
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);