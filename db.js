const mysql = require('mysql2');

// Configura la conexión con la base de datos
const connection = mysql.createConnection({
  host: '127.0.0.1', 
  user: 'root', 
  password: '994af0B843:)', 
  database: 'mydb', 
});

// Conecta a la base de datos
connection.connect((err) => {
  if (err) {
    console.error('Error al conectar a la base de datos:', err);
    return;
  }
  console.log('Conexión exitosa a la base de datos.');
});


module.exports = connection;
