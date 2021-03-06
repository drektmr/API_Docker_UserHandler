/**
 * Constante que nos permitirá trabajar con bases de datos MySQL
 * @type {{createConnection?: function((Object|string)): Connection, createPool?: function((Object|string)): Pool, createPoolCluster?: function(Object=): PoolCluster, createQuery?: function(string, Array=, Function=): Query, escape?: function(*, boolean=, string=): string, escapeId?: function(*, boolean=): string, format?: function(string, Array=, boolean=, string=): string, raw?: function(string): *, Types?: *}|{createConnection?: function((Object|string)): Connection, createPool?: function((Object|string)): Pool, createPoolCluster?: function(Object=): PoolCluster, createQuery?: function(string, Array=, Function=): Query, escape?: function(*, boolean=, string=): string, escapeId?: function(*, boolean=): string, format?: function(string, Array=, boolean=, string=): string, raw?: function(string): *, Types?: *}}
 */
const mysql = require('mysql2');

/**
 * Aquí generaremos la conexión a base de datos
 * @type {Connection}
 */
const connection = mysql.createConnection({
    host: "192.168.25.3",
    port: 3306,
    user: 'melomany',
    password: 'thos',
    database: 'melomany'
})
/**
 * Con la siguiente función realizaremos la conexión a la base de datos, en caso de error nos lo devolverá en el log del servidor
 */
connection.connect(function(err) {
    if (err) throw err;
    console.log("mysql connected");
})
/**
 * La exportamos para poder utilizarla desde otros componentes
 * @type {Connection}
 */
module.exports=connection;