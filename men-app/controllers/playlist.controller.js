const _db =require("../config/db");
const playlistManagement = {};
/**
 * Función que utilizaremos para obtener todas las canciones que componen una lista de reproducción
 * @param req
 * @param res
 * @returns {Promise<void>}
 */
playlistManagement.getSongs = async (req, res) => {
    try {
        const playlistId = req.body.playlistID;
        let text = "SELECT s.id, s.title, s.artist, s.featuring, s.duration, g.name, s.src, s.image FROM songs s INNER JOIN playlist_has_songs ps ON ps.songs_id= s.id INNER JOIN playlist p ON p.id = ps.playlist_id INNER JOIN genre g ON g.id=s.genre_ID WHERE p.id=?";
        _db.query(text,[playlistId], function (error, results) {
           if (error) throw error;
           res.json(results);
        });
    } catch (err) {
        res.status(400).json({
            error: err
        });
    }
};
/**
 * Función que utilizaremos para obtener todas las listas de reproducción de un usuario concreto
 * @param req
 * @param res
 * @returns {Promise<void>}
 */
playlistManagement.getPlaylists = async (req, res) => {
    try {
        const userId = req.body.id;
        let text = "SELECT id, name FROM playlist WHERE idOwner=?";
        _db.query(text,[userId],function (error, results) {
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