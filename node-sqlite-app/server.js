const express = require('express');
const sqlite3 = require('sqlite3').verbose();
const path = require('path');
const app = express();
const port = 3000;

const db = new sqlite3.Database('./data.db', (err) => {
    if (err) {
        console.error('Erreur lors de l\'ouverture de la base de données:', err.message);
    } else {
        console.log('Connecté à la base de données SQLite');
    }
});


app.use(express.static(path.join(__dirname, 'public')));


app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.get('/employees.html', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'employees.html'));
});


app.get('/api/employees', (req, res) => {
    const order = req.query.order === 'desc' ? 'DESC' : 'ASC';
    const sql = `
        SELECT 
            e.lastName AS employeeLastName,
            e.firstName AS employeeFirstName
        FROM employees e
        ORDER BY e.lastName ${order}
    `;

    db.all(sql, [], (err, rows) => {
        if (err) {
            console.error('Erreur lors de l\'exécution de la requête SQL:', err.message);
            res.status(500).json({ error: err.message });
            return;
        }
        console.log('Données récupérées:', rows);
        res.json(rows);
    });
});


app.listen(port, () => {
    console.log(`Serveur démarré sur http://localhost:${port}`);
});