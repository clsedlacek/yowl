import { observable, action } from 'mobx';

class RoomStore {
	@observable room = undefined;
	@observable users = [];
	@observable recentMessages = [];

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

export default new RoomStore();

