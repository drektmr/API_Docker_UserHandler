require('./../db/connection');
const bcrypt = require('bcrypt');
const _db = require("../config/db");
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
        console.log(dataUser)
        if (regexPass.test(dataUser.password)) {
            const userAux = await User.findOne({email: dataUser.email});
            if (userAux !== null) {
                console.log("User : 'This user already exist");
            } else {
                // Crear una instància de l'Schema amb les dades rebudes
                const salt = await bcrypt.genSalt(10);
                const password = await bcrypt.hash(dataUser.password, salt);
                dataUser.password = password;
                const newUser = new User(dataUser);
                // Desar les dades amb el mètode .save(). Aquesta operació és asíncrona
                console.log(newUser);
                await newUser.save();
                res.json(newUser);
            }
        } else {
            console.log("password : 'Invalid password format");
        }

        // Enviar un missatge de confirmació
        //res.send("El registro se completo correctamente.");

    } catch (err) {
        res.status(400).json({
            error: err
        });
    }
};

userManagement.loginUser = async (req, res) => {
    try {
        const dataUser = req.body;
        console.log(req.body);
        const userLogin = await User.findOne({email: dataUser.email});
        if (!userLogin) throw "{User : 'This user not exist'}"
        const validPassword = await bcrypt.compare(dataUser.password, userLogin.password);
        if (!validPassword) throw "{User : 'This password is not correct'}"
        userLogin.password = "";
        console.log(userLogin);
        await res.json(userLogin);

    } catch (err) {
        res.status(400).json({
            error: err
        });
    }
};

userManagement.loginMelomany = async (req, res) => {
    try {
        const dataUser = req.body;
        console.log(dataUser);
        let text = "SELECT * FROM user WHERE email = ?";
            const stmt = await _db.query(text,[dataUser.email], function (error, results) {
                console.log(dataUser.password);
                bcrypt.compare(dataUser.password,results[0].password)
                    .then((pass)=>{
                        if (pass){
                            if (error) throw error;
                            console.log(results);
                            results[0].password="";
                            res.json(results[0]);
                        }else{
                            console.log("User : 'Some data is not correct.'");
                        }
                    });
            });

    } catch (err) {
        res.status(400).json({
            error: err
        });
    }
};
/*
userManagement.registerMelomany = async (req, res) => {
    try {
        // Desar les dades amb el mètode .save(). Aquesta operació és asíncrona
        // Desar en una constant les dades que venen per POST
        const dataUser = req.body;

        const regexPass = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
        if (regexPass.test(dataUser.password)) {
            let text="SELECT * FROM user WHERE email = ?";
            const password = await bcrypt.hash(dataUser.password, 10);
            console.log(dataUser.email)
            const stmt = await _db.query(text,dataUser.email, function (error, results) {
                console.log(results);
                if (results.length!==0){
                    throw "{User : 'This user already exist'}"
                    console.log("exist");
                } else {
                    dataUser.password = password;
                    let insert = "INSERT INTO user(rol, email, password, name, lastName, creditCard, direction) VALUE (?,?,?,?,?,?,?)";
                    const insertQuery = _db.query(insert,[4,dataUser.email,dataUser.password,dataUser.name,dataUser.lastName,null,null],function(error2, results2){
                        if (results2) {
                            results2.password = "";
                            res.json({
                                nom: dataUser.nom,
                                lastName: dataUser.lastName,
                                email: dataUser.email
                            });
                        } else {
                            throw "{User : 'Some data is not correct.'}"
                        }
                    })
                }
            })
        } else {
            throw "{password : 'Invalid password format'}"
        }
    } catch (err) {
        res.status(400).json({
            error: err
        });
    }
};
*/
userManagement.registerMelomany = async (req, res) => {
    try {
        // Desar les dades amb el mètode .save(). Aquesta operació és asíncrona
        // Desar en una constant les dades que venen per POST
        const dataUser = req.body;

        const regexPass = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
        if (regexPass.test(dataUser.password)) {
            let text="SELECT * FROM user WHERE email = ?";
            const password = await bcrypt.hash(dataUser.password, 10);
            console.log(dataUser.email)
            const stmt = await _db.query(text,dataUser.email, function (error, results) {
                console.log(results);
                if (results.length!==0){
                    throw "{User : 'This user already exist'}"
                    console.log("exist");
                } else {
                    dataUser.password = password;
                    let insert = "INSERT INTO user(rol, email, password, name, lastName, creditCard, direction, dateBirth, description) VALUE (?,?,?,?,?,?,?,?,?)";
                    const insertQuery = _db.query(insert,[4,dataUser.email,dataUser.password,dataUser.name,dataUser.lastName,null,null,dataUser.dateBirth,dataUser.description],function(error2, results2){
                        if (results2) {
                            results2.password = "";
                            res.json({
                                nom: dataUser.nom,
                                lastName: dataUser.lastName,
                                email: dataUser.email
                            });
                        } else {
                            throw "{User : 'Some data is not correct.'}"
                        }
                    })
                }
            })
        } else {
            throw "{password : 'Invalid password format'}"
        }
    } catch (err) {
        res.status(400).json({
            error: err
        });
    }
};
module.exports = userManagement;

