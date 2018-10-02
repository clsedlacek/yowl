import { observable, action } from 'mobx';

class RoomStore {
	@observable room = {id: 1, roomName: 'Test Room Name'};
	@observable users = [{id: 1, userName: 'admin'}, {id: 2, userName: 'gizmo'}];
	@observable recentMessages = [{id: 1, messageBody: 'Message 1'}, {id: 2, messageBody: 'Message 2 test'}, {id: 3, messageBody: 'Message 3 foobar'}];

	constructor(socket) {
		this.socket = socket;

		this.socket.on('room.clientEnter', socketData => null);
		this.socket.on('room.clientExit', socketData => null);
		this.socket.on('room.userEnter', socketData => null);
		this.socket.on('room.userExit', socketData => null);
		this.socket.on('room.userMove', socketData => null);
		this.socket.on('room.message', socketData => null);
	}

	@action setRoom(room) {
		this.room = room;
	}

	@action leaveRoom() {
		this.room = undefined;
	}

	@action addMessage(message) {
		this.recentMessages.push(message);
	}

	@action addUser(user) {
		this.users.push(user);
	}

	@action removeUser(user) {
		let index = 0;
		let removedUser;

		for (let checkUser of this.users) {
			if (checkUser.id === user.id) {
				return this.users.splice(index, 1);
			}
			index++;
		}
	}
}

export default RoomStore;

