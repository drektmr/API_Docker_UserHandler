//require('./../db/connection');
const bcrypt = require('bcrypt');
const _db = require("../config/db");
const userManagement = {};
//const User = require('../db/model/user.schema');


// Definir mètode registerUser()
/*
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
*/
/**
 * Función con la que haciendo una consulta a base de datos obtendremos y devolveremos un usuario mediante MySQL
 * @param req
 * @param res
 * @returns {Promise<void>}
 */
userManagement.loginMelomany = async (req, res) => {
    try {
        const dataUser = req.body;
        let passWordisSet = true;
        if (!dataUser.password) {
            passWordisSet = false;
            res.json({error: 'La contraseña no puede estar vacia'});
        }
        if (passWordisSet) {
            let text = "SELECT * FROM user WHERE email = ?";
            _db.query(text, [dataUser.email], function (error, results) {
                if(results.length>0){
                    bcrypt.compare(dataUser.password, results[0].password)
                        .then((pass) => {
                            if (pass) {
                                if (error) throw error;
                                results[0].password = "";
                                res.json(results[0]);
                            } else {
                                res.json({error: 'Algún dato no es correcto'});
                            }
                        });
                }else{
                    res.json({error: 'Algún dato no es correcto'});
                }
            });
        }
    } catch (err) {
        res.status(400).json({
            error: err
        });
    }
};

/**
 * Función de registro mediante MySQL donde filtraremos y limpiaremos los datos que insertamos en la base de datos
 * además de retornarnos el usuario si todo ha ido bien para ya estar logeados en la web.
 * @param req
 * @param res
 * @returns {Promise<void>}
 */
userManagement.registerMelomany = async (req, res) => {
    try {
        const dataUser = req.body;

        const regexPass = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
        if (regexPass.test(dataUser.password)) {
            let text = "SELECT * FROM user WHERE email = ?";
            const password = await bcrypt.hash(dataUser.password, 10);
            const stmt = _db.query(text, dataUser.email, function (error, results) {
                if (results.length !== 0) {
                    throw 'El usuario ya existe';
                } else {
                    dataUser.password = password;
                    let insert = "INSERT INTO user(rol, email, password, name, lastName, creditCard, direction, dateBirth, description, country) VALUE (?,?,?,?,?,?,?,?,?,?)";
                    const insertQuery = _db.query(insert, [4, dataUser.email, dataUser.password, dataUser.name, dataUser.lastName, null, null, dataUser.dateBirth, dataUser.description, dataUser.country], function (error2, results2) {
                        if (results2) {
                            dataUser.password = "";
                            res.json(dataUser);
                        } else {
                            throw 'Algún dato no es correcto'
                        }
                    })
                }
            })
        } else {
            throw 'El formato de la contraseña no es correcto';
        }
    } catch (err) {
        res.status(400).json({
            error: err
        });
    }
};
/**
 * Función para modificar los datos de un usuario.
 * @param req
 * @param res
 * @returns {Promise<void>}
 */
userManagement.updateMelomany = async (req, res) => {
    try {
        const dataUser = req.body;
        let update = "UPDATE user SET creditCard=?,direction=?,description=?,dateBirth=?,country=? WHERE email=?";
        const insertQuery = _db.query(update, [dataUser.creditCard,dataUser.direction,dataUser.description,dataUser.dateBirth,dataUser.country,dataUser.email], function (error, results) {
            if (error) {
                res.json({error: 'Algún dato no es correcto'});
            }else{
                res.json(results);
            }
        })
    } catch (err) {
        res.status(400).json({
            error: err
        });
    }
};
module.exports = userManagement;

