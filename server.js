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

app.use(express.urlencoded({ extended: true }));

app.post('/insert', (req, res) => {
  const { firstName, lastName, gender, phoneNumber, country, city, street1, street2, appartement, postId } = req.body;

  db.run(`INSERT INTO adresses (country, city, street1, street2, appartement) VALUES (?, ?, ?, ?, ?)`, [country, city, street1, street2, appartement], (err) => {
    if (err) {
      console.error(err);
      res.status(500).send('Erreur lors de l\'insertion des données');
    } else {
      const adressId = this.lastID;

      db.run(`INSERT INTO employees (firstName, lastName, gender, phoneNumber, adressId, postId) VALUES (?, ?, ?, ?, ?, ?)`, [firstName, lastName, gender, phoneNumber, adressId, postId], (err) => {
        if (err) {
          console.error(err);
          res.status(500).send('Erreur lors de l\'insertion des données');
        } else {
          res.send('Données insérées avec succès');
        }
      });
    }
  });
});

app.get('/posts', (req, res) => {
  db.all('SELECT postId, PositionTitle FROM posts', (err, rows) => {
    if (err) {
      console.error(err);
      res.status(500).send('Erreur lors de la récupération des données');
    } else {
      res.json(rows);
    }
  });
});

app.use(express.static(path.join(__dirname, 'public')));


app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});
app.get('/insert', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'insert.html'));
});
app.get('/employees.html', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'employees.html'));
});


app.get('/api/employees', (req, res) => {
    const sql = `
        SELECT 
            e.name AS employeName, 
            e.gender AS employeGender, 
            e.phoneNumber AS employePhoneNumber, 
            p.Salary AS employeSalary
        FROM employees e
        JOIN posts p ON e.postId = p.postId;
    `;
    db.all(sql, [], (err, rows) => {
        if (err) {
            return res.status(500).send(err.message);
        }
        res.json(rows);
    });
});

// Démarrer le serveur
app.listen(port, () => {
    console.log(`Serveur démarré sur http://localhost:${port}`);
});