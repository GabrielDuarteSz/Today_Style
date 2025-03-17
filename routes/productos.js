// routes/productos.js

const express = require('express');
const { body, validationResult } = require('express-validator');

module.exports = (db) => {
    const router = express.Router();

    // Obtener todos los productos
    router.get('/', (req, res) => {
        db.query('SELECT * FROM productos', (err, results) => {
            if (err) {
                console.error(err);
                return res.status(500).json({ error: 'Error al obtener los productos' });
            }
            res.json(results);
        });
    });

    // Obtener un producto por ID
    router.get('/:id', (req, res) => {
        const { id } = req.params;
        db.query('SELECT * FROM productos WHERE idProducto = ?', [id], (err, results) => {
            if (err) {
                console.error(err);
                return res.status(500).json({ error: 'Error al obtener el producto' });
            }
            if (results.length === 0) {
                return res.status(404).json({ error: 'Producto no encontrado' });
            }
            res.json(results[0]);
        });
    });

    // Agregar un nuevo producto
    router.post('/', [
        body('idProducto').isInt(),
        body('nombreProducto').isString().notEmpty(),
        body('precioProducto').isString(),
        body('descripciónProducto').optional().isString(),
    ], (req, res) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json({ errors: errors.array() });
        }

        const nuevoProducto = req.body;
        db.query('INSERT INTO productos SET ?', nuevoProducto, (err, results) => {
            if (err) {
                console.error(err);
                return res.status(500).json({ error: 'Error al agregar el producto' });
            }
            res.status(201).json({ id: results.insertId, ...nuevoProducto });
        });
    });

    // Actualizar un producto
    router.put('/:id', [
        body('idProducto').isInt(),
        body('nombreProducto').isString().notEmpty(),
        body('precioProducto').isString(),
        body('descripciónProducto').optional().isString(),
    ], (req, res) => {
        const { id } = req.params;
        const updates = req.body;

        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json({ errors: errors.array() });
        }

        db.query('UPDATE productos SET ? WHERE id = ?', [updates, id], (err, results) => {
            if (err) {
                console.error(err);
                return res.status(500).json({ error: 'Error al actualizar el producto' });
            }
            if (results.affectedRows === 0) {
                return res.status(404).json({ error: 'Producto no encontrado' });
            }
            res.json({ message: 'Producto actualizado correctamente' });
        });
    });

    // Eliminar un producto
    router.delete('/:id', (req, res) => {
        const { id } = req.params;

        db.query('DELETE FROM productos WHERE idProducto = ?', [id], (err, results) => {
            if (err) {
                console.error(err);
                return res.status(500).json({ error: 'Error al eliminar el producto' });
            }
            if (results.affectedRows === 0) {
                return res.status(404).json({ error: 'Producto no encontrado' });
            }
            res.json({ message: 'Producto eliminado correctamente' });
        });
    });

    return router;
};