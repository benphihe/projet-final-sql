const express = require('express');
const sqlite3 = require('sqlite3').verbose();
const path = require('path');
const app = express();
const port = process.env.PORT || 3000;

const db = new sqlite3.Database('./data.db', (err) => {
    if (err) {
        console.error('Erreur lors de l\'ouverture de la base de données:', err.message);
    } else {
        console.log('Connecté à la base de données SQLite');
    }
});

app.use(express.urlencoded({ extended: true }));
 
app.post('/insert', (req, res) => {
    const { firstName, lastName, gender, phoneNumber, country, city, street1, appartement, postId } = req.body;
   
    db.run(`INSERT INTO adresses (country, city, street1, appartement) VALUES (?, ?, ?, ?)`, [country, city, street1, appartement], function(err) {
      if (err) {
        console.error(err);
        return res.status(500).send('Erreur lors de l\'insertion des données d\'adresse');
      }
     
      const adressId = this.lastID;
 
      db.run(`INSERT INTO employees (firstName, lastName, gender, phoneNumber, adressId, postId) VALUES (?, ?, ?, ?, ?, ?)`, [firstName, lastName, gender, phoneNumber, adressId, postId], (err) => {
        if (err) {
          console.error(err);
          return res.status(500).send('Erreur lors de l\'insertion des données d\'employé');
        }
        res.send('Données insérées avec succès');
      });
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

app.get('/employees.html', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'employees.html'));
});

app.get('/insert', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'insert.html')); 
});


app.get('/api/employees', (req, res) => {
    const order = req.query.order === 'desc' ? 'DESC' : 'ASC';
    const search = req.query.search ? `%${req.query.search}%` : '%';
    const sql = `
        SELECT 
            e.lastName AS employeeLastName,
            e.firstName AS employeeFirstName,
            e.gender AS employeeGender,
            e.phoneNumber AS employeePhoneNumber,
            p.PositionTitle,
            p.Salary,
            a.country AS employeeCountry,
            a.city AS employeeCity,
            a.street1 AS employeeStreet1,
            a.appartement AS employeeAppartement,
            emp.startDate AS employeeStartDate,
            emp.endDate AS employeeEndDate
        FROM employees e
        JOIN posts p ON e.postId = p.postId
        JOIN adresses a ON e.adressId = a.adressId
        JOIN employements emp ON e.postId = emp.postId
        WHERE e.lastName LIKE ?
        ORDER BY e.lastName ${order}
    `;

    db.all(sql, [search], (err, rows) => {
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