import { observable, action } from 'mobx';

class CurrentUserStore {
	@observable currentUser = undefined;

	@action setUser(user) {
		this.currentUser = user;
	}

	@action forgetUser() {
		this.currentUser = undefined;
	}
}

export default new CurrentUserStore();
