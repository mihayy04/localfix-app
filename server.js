const express = require('express');
const path = require('path');
const app = express();
const port = 3000;

app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));

let issues = [
  { id: 1, categorie: "Infrastructura", descriere: "Groapa adanca pe Strada Unirii 4", status: "In lucru" },
  { id: 2, categorie: "Curatenie", descriere: "Gunoi neridicat in parc", status: "Rezolvat" }
];

app.get('/api/issues', (req, res) => {
  res.json(issues);
});

app.post('/api/issues', (req, res) => {
  const { categorie, descriere } = req.body;
  if(!categorie || !descriere) {
      return res.status(400).json({ error: "Date incomplete" });
  }
  const newIssue = {
      id: issues.length + 1,
      categorie: categorie,
      descriere: descriere,
      status: "In asteptare"
  };
  issues.push(newIssue);
  res.status(201).json({ message: "Avarie raportata!", issue: newIssue });
});

app.listen(port, () => {
  console.log(`[Server] LocalFix ruleaza pe http://localhost:${port}`);
});