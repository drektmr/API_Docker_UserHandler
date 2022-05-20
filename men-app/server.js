const express = require('express')
//require('./db/connection');
const app = express()
const cors = require('cors')

const {loginUser,registerUser,loginMelomany,registerMelomany} = require('./controllers/users.controller');
const {getSongs,getPlaylists} = require('./controllers/playlist.controller');

app.use(cors());
app.use(express.json());


app.post('/songs',getSongs);

app.post('/playlists',getPlaylists);

app.post('/users/login',loginUser);

app.post('/users/register', registerUser);

app.post('/users/loginUser',loginMelomany);

app.post('/users/registerUser',registerMelomany);

app.listen(8080, () => {
    console.log('Server is runing on port 8080');
})