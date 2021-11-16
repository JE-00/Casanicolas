// Imports
const express = require('express');
const Joi = require('joi'); // en lugar de express-validator
const morgan = require('morgan');
const exphbs = require('express-handlebars');
const path = require('path');

// Initializations
const app = express();

// Settings
app.set('port', process.env.PORT || 3000);
app.set('views', path.join(__dirname, 'views'));
app.engine('.hbs', exphbs.engine({
    extname: '.hbs',
    defailtLayout: 'main',
    layoutsDir: path.join(app.get('views'), 'layouts'),
    partialsDir: path.join(app.get('views'), 'partials'),
    helpers: require('./lib/handlebars.js')
}));
app.set('view engine', '.hbs');

// Middlewares
app.use(morgan('dev'));
app.use(express.json());
app.use(express.urlencoded({extended:false}));

// Global variables
app.use((req, res, next) => {

    next();
});
// const migrantes = [
//     { id: 1, name: 'José' },
//     { id: 2, name: 'Carlos' },
//     { id: 3, name: 'Pompilio' }
// ];

// Routes
app.use(require('./routes/index'));
app.use(require('./routes/authentication'));
app.use('/records', require('./routes/records'));

// Public
app.use(express.static(path.join(__dirname, 'public')));

// Starting server

app.listen(app.get('port'), () => {
    console.log(`Server on port ${app.get('port')}...`);
});
