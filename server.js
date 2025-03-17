// server.js

const express = require('express');
const mysql = require('mysql2');
const productosRoutes = require('./routes/productos');
const reseniaRoutes = require('./routes/Resenia');
const dotenv = require('dotenv');

dotenv.config(); // Cargar variables de entorno!

const app = express();
const port = process.env.PORT || 3000;

// Middleware para parsear el cuerpo de las solicitudes JSON
app.use(express.json());

// Configuración de la conexión a la base de datos
const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
});

// Conectar a la base de datos
db.connect((err) => {
    if (err) {
        console.error('Error de conexión a la base de datos: ' + err.stack);
        return;
    }
    console.log('Conectado a la base de datos MySQL.');
});

// Rutas de la api 
app.use('/api/productos', productosRoutes(db));
app.use('/api/resenia', reseniaRoutes(db));
// Manejo de errores
app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(500).send('Algo salió mal!');
});

// Iniciar el servidor
app.listen(port, () => {
    console.log(`Servidor escuchando en http://localhost:${port}`);
});