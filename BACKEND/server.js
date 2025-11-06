const express = require('express');
const mysql = require('mysql');
const app = express();
const port = 3000;
const cors = require('cors');
app.use(cors());
// Connexion à la base MySQL
const connection = mysql.createConnection({
    host: '127.0.0.1', //ou 'localhost'
    user: 'root', //ou créez votre un utilisateur dédié
    password: 'dhdnbp6c',
    database: 'gestion_utilisateurs'
});
connection.connect(err => {
    if (err) throw err;
    console.log('Connecté à la base MySQL');
});
app.use(express.json());
    // Endpoint pour récupérer les données
app.get('/api/utilisateurs', (req, res) => {
    connection.query('SELECT * FROM users', (err, results) => {
        if (err) throw err;
    res.json(results);
    });
});
// Endpoint pour ajouter un utilisateur
app.post('/api/utilisateurs', (req, res) => 
    {
    const { nom, email, telephone } = req.body;
    connection.query(
        'INSERT INTO users (nom, email, telephone) VALUES (?, ?, ?)',
        [nom, email, telephone],
        (err, result) =>
        {
            if (err) throw err;
            res.status(201).json({ id: result.insertId, nom, email, telephone });
        }
        );
    });
    app.listen(port, () => {
    console.log(`Serveur backend opérationnel :
    http://localhost:${port}`);
});