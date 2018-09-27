// dependencies
const express = require('express');
const http = require('http');
const socketIo = require('socket.io');
const morgan = require('morgan');
const bodyParser = require('body-parser');
const multer = require('multer');

// base directory store
global.__basedir = __dirname;
global.__publicdir = __dirname + '/public';

// package data
const metadata = require('./package.json');

// port for REST API and websockets
const httpPort = 3001;

// preliminary server creation and setup
const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}));
app.use('/api/users', require('./src/routes/user.js'));

const server = http.createServer(app);
const io = socketIo(server);

// socket.io listen start
io.on('connection', socket => {
	console.log('New client connected');
	socket.on('disconnect', () => console.log('Client disconnected'));
});


// server listen start
server.listen(httpPort, () => console.log(`Yowl HTTP server version ${metadata.version} listening on port ${httpPort}`));
