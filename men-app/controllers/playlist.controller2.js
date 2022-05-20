const User = require("../db/model/user.schema");
const bcrypt = require("bcrypt");
const _db =require("../config/db");
const playlistManagement = {};

playlistManagement.getPlaylist = async (req, res) => {
    try {
        // Desar les dades amb el mètode .save(). Aquesta operació és asíncrona
        // Desar en una constant les dades que venen per POST
        const id = req.body;
        let query = 'SELECT * FROM songs s INNER JOIN playlist_has_songs ps ON ps.song_id= s.id INNER JOIN playlist p ON p.id = ps.playlist_id WHERE p.id=1;';
        const stmt=await _db.query(query);
        res.json(stmt);
        await console.log(res.json(stmt));

    } catch (err) {
        res.status(400).json({
            error: err
        });
    }
};

module.exports = playlistManagement;