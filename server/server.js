const express = require('express');

const port = 5000;

const app = express();

app.get('/', (req, res) => {
    res.send('Quick Flick is alive')
})

app.get('/headlines', (req, res) => {
    res.send('Headlines')
})

app.get('/allnews/', (req, res) => {
    res.send('All news')
})

app.listen(port, () => {
    console.log(`Server started @port ${port}`)
});
