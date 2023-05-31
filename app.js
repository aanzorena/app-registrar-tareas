const express = require('express');
const { engine } = require('express-handlebars');
const myconnection = require('express-myconnection');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const tasksRoutes = require('./routes/tasks');

const dbOptions = {
  host: process.env.MYSQL_HOST,
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  port: process.env.MYSQL_PORT,
  database: process.env.MYSQL_DATABASE  || "registroTareas",
  multipleStatements: true
};

const app = express();
app.set('port', process.env.SERVER_PORT || 8081);

app.use(bodyParser.urlencoded({
  extended: true
}));
app.use(bodyParser.json());

app.set('views', __dirname + '/views');
app.engine('.hbs', engine({
  extname: '.hbs',
}));
app.set('view engine', 'hbs');

app.use(myconnection(mysql, dbOptions, 'single'));

app.listen(app.get('port'), () => {
  console.log('Listening on port ', app.get('port'));

});

app.use('/', tasksRoutes);

app.get('/', (req, res) => {
  res.render('home');
});