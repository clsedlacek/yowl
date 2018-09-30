import socketio from 'socket.io-client';

class WebsocketService {
	constructor() {
		this.socket = socketio('http://localhost:3001');
	}
}

export default WebsocketService;
