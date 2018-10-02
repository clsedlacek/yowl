import { observable, action } from 'mobx';

class CurrentUserStore {
	@observable currentUser = undefined;

	constructor(socket) {
		this.socket = socket;
	}

	@action setUser(user) {
		this.currentUser = user;
	}

	@action forgetUser() {
		this.currentUser = undefined;
	}
}

export default CurrentUserStore;
