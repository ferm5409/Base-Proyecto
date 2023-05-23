const mysql = require('mysql2');

const connection = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: '994af0B843:)',
  database: 'mydb',
});

connection.connect((error) => {
  if (error) {
    console.error('Error al conectar a la base de datos:', error);
  } else {
    console.log('Conexión exitosa a la base de datos');
  }
});

const resolvers = {
  Query: {
    getCustomer: (parent, args) => {
      const { id } = args;
      
      return new Promise((resolve, reject) => {
        const query = 'SELECT * FROM customers WHERE id = ?';
        connection.query(query, [id], (error, results) => {
          if (error) {
            reject(error);
          } else {
            resolve(results[0]);
          }
        });
      });
    },
    
  },
  Mutation: {
    createCustomer: (parent, args) => {
      const { input } = args;
      
      return new Promise((resolve, reject) => {
        const query = 'INSERT INTO customers (name, email, password) VALUES (?, ?, ?)';
        const values = [input.name, input.email, input.password];
        connection.query(query, values, (error, results) => {
          if (error) {
            reject(error);
          } else {
            resolve({
              id: results.insertId,
              ...input,
            });
          }
        });
      });
    },
    
  },
};

module.exports = resolvers;

server.listen({ port: 4001 }).then(({ url }) => {
    console.log(`Servidor GraphQL listo en ${url}`);
  });
  
