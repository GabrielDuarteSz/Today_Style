// routes/resenia.js

const express = require('express');
const { body, validationResult } = require('express-validator');

module.exports = (db) => {
    const router = express.Router();

    // Obtener todos las resenias
    router.get('/', (req, res) => {
        db.query('SELECT * FROM resenia', (err, results) => {
            if (err) {
                console.error(err);
                return res.status(500).json({ error: 'Error al obtener las renias' });
            }
            res.json(results);
        });
    });

    // Obtener un resenia por ID
    router.get('/:id', (req, res) => {
        const { id } = req.params;
        db.query('SELECT * FROM resenia WHERE idResenia = ?', [id], (err, results) => {
            if (err) {
                console.error(err);
                return res.status(500).json({ error: 'Error al obtener la reseña' });
            }
            if (results.length === 0) {
                return res.status(404).json({ error: 'Reseña no encontrada' });
            }
            res.json(results[0]);
        });
    });

    // Agregar una nueva resenia
    router.post('/', [
        body('idResenia').isInt(),
        body('calificacion').isInt().notEmpty(),
        body('comentario').isString(),
        body('fechaResenia').optional().isDate(),
        body('idUsuario').isInt().notEmpty(),
        body('idProducto').isInt().notEmpty(),
    ], (req, res) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json({ errors: errors.array() });
        }

        const nuevaresenia = req.body;
        db.query('INSERT INTO resenia SET ?', nuevaresenia, (err, results) => {
            if (err) {
                console.error(err);
                return res.status(500).json({ error: 'Error al agregar la reseña' });
            }
            res.status(201).json({ id: results.insertId, ...nuevoProducto });
        });
    });

    // Actualizar una resenia
    router.put('/:id', [
        body('idResenia').isInt(),
        body('calificacion').isInt().notEmpty(),
        body('comentario').isString(),
        body('fechaResenia').optional().isISO8601(),
        body('idUsuario').isInt().notEmpty(),
        body('idProducto').isInt().notEmpty(),
    ], (req, res) => {
        const { id } = req.params;
        const updates = req.body;

        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json({ errors: errors.array() });
        }

        db.query('UPDATE resenia SET ? WHERE idresenia = ?', [updates, id], (err, results) => {
            if (err) {
                console.error(err);
                return res.status(500).json({ error: 'Error al actualizar la reseña' });
            }
            if (results.affectedRows === 0) {
                return res.status(404).json({ error: 'Reseña no encontrada' });
            }
            res.json({ message: 'Reseña actualizada correctamente' });
        });
    });

    // Eliminar un resenia
    router.delete('/:id', (req, res) => {
        const { id } = req.params;

        db.query('DELETE FROM resenia WHERE idResenia = ?', [id], (err, results) => {
            if (err) {
                console.error(err);
                return res.status(500).json({ error: 'Error al eliminar la resenia' });
            }
            if (results.affectedRows === 0) {
                return res.status(404).json({ error: 'Reseña no encontrada' });
            }
            res.json({ message: 'Reseña eliminada correctamente' });
        });
    });

    return router;
};