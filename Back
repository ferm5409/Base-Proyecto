const db = require('./db');


const express = require('express');
const bodyParser = require('body-parser');

const app = express();


app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());


app.post('/api/register', (req, res) => {
  
  const brandName = req.body.brandName;
  const email = req.body.email;
  const password = req.body.password;
  const phone = req.body.phone;
  const paymentLevel = req.body.paymentLevel;
  const paymentStatus = req.body.paymentStatus;
  const socialMedia = req.body.socialMedia;
  const username = req.body.username;
  const joinDate = req.body.joinDate;

  
  res.status(200).json({ message: 'Registro exitoso' });
});


app.listen(3000, () => {
  console.log('Servidor iniciado en el puerto 3000');
});
