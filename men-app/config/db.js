const mysql = require('mysql');

const connection = mysql.createConnection({
    host: "192.168.25.2",
    port: 3306,
    user: 'melomany',
    password: "thos",
    database: "melomany"
})

connection.connect(function(err) {
    if (err) throw err;
    console.log("mysql connected");
})

module.exports=connection;