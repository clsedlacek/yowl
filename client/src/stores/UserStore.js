import { observable, action } from 'mobx';

class UserStore {
	@observable user = undefined;

	@action setUser(user) {
		this.user = user;
	}

	@action forgetUser() {
		this.user = undefined;
	}
}

export default UserStore;
