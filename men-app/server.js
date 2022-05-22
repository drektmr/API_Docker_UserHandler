/**
 * Constante para trabajar con express
 * @type {e | (() => Express)}
 */
const express = require('express')
//require('./db/connection');
/**
 * Instancia de express para nuestra app
 * @type {Express}
 */
const app = express()

/**
 * Constante para poder usar CORS
 * @type {function(*): function(*, *, *): void}
 */
const cors = require('cors')

/**
 * Importamos las funciones necesarias para nuestra aplicación desde los diferentes controladores
 */
const {/*loginUser,registerUser,*/loginMelomany,registerMelomany} = require('./controllers/users.controller');
const {getSongs,getPlaylists} = require('./controllers/playlist.controller');

/**
 * Indicamos que los fetch se harán utilizando CORS
 */
app.use(cors());

/**
 * Indicamos que los fetch mediante formato JSON
 */
app.use(express.json());

/*app.post('/users/login',loginUser);

app.post('/users/register', registerUser);*/
/**
 * Función de express que nos permitirá recoger las solicitudes de la aplicación mediante POST de todas las canciones de una lista de reproducción
 */
app.post('/songs',getSongs);

/**
 * Función de express que nos permitirá recoger las solicitudes de la aplicación mediante POST de todas las listas de reproducción de un usuario
 */
app.post('/playlists',getPlaylists);

/**
 * Función de express que nos permitirá recoger las solicitudes de la aplicación mediante POST para el login de usuarios
 */
app.post('/users/loginUser',loginMelomany);

/**
 * Función de express que nos permitirá recoger las solicitudes de la aplicación mediante POST para el registro de usuarios
 */
app.post('/users/registerUser',registerMelomany);

/**
 * Función de express para indicar por que puerto recogerá las solicitudes
 */
app.listen(8080, () => {
    console.log('Server is runing on port 8080');
})