const express = require('express')
const FirebaseREST = require('firebase-rest').default;

const app = express()

var jsonClient =
    new FirebaseREST.JSONClient('https://assembly-52-default-rtdb.firebaseio.com/');



app.get('/', (req, res) => {
    jsonClient.get('/')
        .then(response => res.send(response.body))


})

// export 'app'
module.exports = app