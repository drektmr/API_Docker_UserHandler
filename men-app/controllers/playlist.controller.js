const bcrypt = require("bcrypt");
const _db =require("../config/db");
const playlistManagement = {};

playlistManagement.getSongs = async (req, res) => {
    try {
        // Desar les dades amb el mètode .save(). Aquesta operació és asíncrona
        // Desar en una constant les dades que venen per POST
        const playlistId = req.body.playlist;
        let text = "SELECT s.id, s.title, s.artist, s.featuring, s.duration, g.name, s.location, s.image FROM songs s INNER JOIN playlist_has_songs ps ON ps.songs_id= s.id INNER JOIN playlist p ON p.id = ps.playlist_id INNER JOIN genre g ON g.id=s.genre_ID WHERE p.id=?";
        const stmt=await _db.query(text,[playlistId], function (error, results) {
            if (error) throw error;
           // console.log(results);

            res.json(results);
        });
    } catch (err) {
        res.status(400).json({
            error: err
        });
    }
};

playlistManagement.getPlaylists = async (req, res) => {
    try {
        // Desar les dades amb el mètode .save(). Aquesta operació és asíncrona
        // Desar en una constant les dades que venen per POST
        const userId = req.body.userId;
        console.log(req.body);
        let text = "SELECT id, name FROM playlist WHERE idOwner=?";
        const stmt=await _db.query(text,[userId],function (error, results) {
            if (error) throw error;
            res.json(results);
        });
    } catch (err) {
        res.status(400).json({
            error: err
        });
    }
};

module.exports = playlistManagement;