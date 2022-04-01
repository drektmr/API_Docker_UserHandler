require('./../db/connection');
const bcrypt = require('bcrypt');
const User = require('../db/model/user.schema');
const userManagement = {};
const comparePassword = async (password, hash) => {
    try {
        // Compare password
        return await bcrypt.compare(password, hash);
    } catch (error) {
        console.log(error);
    }

    // Return false if error
    return false;
};

// Definir mètode registerUser()
userManagement.registerUser = async (req, res) => {
    try {
        // Desar les dades amb el mètode .save(). Aquesta operació és asíncrona
        // Desar en una constant les dades que venen per POST
        const dataUser = req.body;
        const regexPass = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
        if (regexPass.test(dataUser.password)) {

            const userAux = await User.findOne({email: dataUser.email});
            if (userAux !== null) {
                throw "{User : 'This user already exist'}"
            } else {
                // Crear una instància de l'Schema amb les dades rebudes
                const password = await bcrypt.hash(dataUser.password, 10);
                dataUser.password=password;
                const newUser = new User(dataUser);
                // Desar les dades amb el mètode .save(). Aquesta operació és asíncrona
                await newUser.save();
            }
        } else {
            throw "{password : 'Invalid password format'}"
        }

        // Enviar un missatge de confirmació
        //res.send("El registro se completo correctamente.");
        res.json("El registro se completo correctamente.");
    } catch (err) {
        res.status(400).json({
            error: err
        });
    }
};
userManagement.loginUser = async (req, res) => {
    try {
        const dataUser = req.body;
        const userLogin = await User.findOne({email: dataUser.email});
        if (userLogin !== null) {
            const match = comparePassword(dataUser.password,userLogin.password);
            if (match) {
                return userLogin;
            } else {
                throw "{User : 'This password is not correct'}"
            }
        } else {
            throw "{User : 'This user not exist'}"
        }
    } catch (err) {
        res.status(400).json({
            error: err
        });
    }
};

module.exports = userManagement;
/**
 * onclick= (e)=>{
 *     e.preventDefault(tc)
 *     validation
 *     enviar si es correcto
 *     si los errores son false enviamos el formulario
 *     tener encuenta el type:submit para el bucle
 *     {error.email && <p>error.email</p>}
 * }
 */