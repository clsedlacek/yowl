function disconnect() {
	console.log('Client disconnected');
}

function connect(socket) {
	console.log('New client connected');
	socket.on('disconnect', disconnect);
}

module.exports = { connect, disconnect };
