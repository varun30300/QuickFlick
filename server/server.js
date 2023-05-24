const express = require('express');

const port = 5000;

const app = express();
const temp = process.env.NEWS_API_KEY;

app.get('/', (req, res) => {
    res.send('Quick Flick is alive')
})

app.get('/headlines', (req, res) => {
    // send todays and yesterdays news 
    res.send('Headlines')
})

app.listen(port, () => {
    console.log(`Server started @port ${port}`)
});
