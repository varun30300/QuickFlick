const express = require('express');
const fs = require('firebase-admin');

const port = 5000;

const app = express();
const temp = process.env.NEWS_API_KEY;
const serviceAccount = require('./quickflick-19fdd-11e52bcd6a8b.json');
fs.initializeApp({
    credential: fs.credential.cert(serviceAccount)
});
const db = fs.firestore(); 

app.get('/', (req, res) => { 
    res.send('Quick Flick is alive! Yay');
})

app.get('/headlines', async (req, res) => {
    
    const today = await db.collection('2023-05-26').get();
    var size = 0;
    var todayReturnObj = []
    today.docs.map(doc => {
        todayReturnObj.push(doc.data());
        size ++;
    })
    res.send({size ,todayReturnObj});
})

app.listen(port, () => {
    console.log(`Server started @port ${port}`);
});
