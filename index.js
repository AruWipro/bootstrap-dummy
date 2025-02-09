const express = require('express');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3333;

// Serve static files from the "public" directory
app.use(express.static(path.join(__dirname, 'public')));

// Routes
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.get('/hero', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'hero.html'));
});

app.get('/about', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'about.html'));
});

app.get('/features', (req, res) => {
   console.log('routing to features');
    res.sendFile(path.join(__dirname, 'public', 'features.html'));
});

app.get('/services', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'services.html'));
});

app.get('/pricing', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'pricing.html'));
});

app.get('/contact', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'contact.html'));
});

app.get('/account-opening', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'account-opening.html'));
});

// Start the server
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});