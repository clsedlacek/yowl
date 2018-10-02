import React from 'react';
import { inject, observer } from 'mobx-react';
import Layout from '../components/Layout/Layout.js';

@inject('currentUserStore', 'roomStore')
@observer
class RoomRoute extends React.Component {
	render() {
		const roomStore = this.props.roomStore;

		return (
			<div>
				<Layout>
					<div>room route contents</div>
					<div className="room">
						<div className="room__textChat">
							<div className="chatLogs">
								logs here
							</div>
							<div className="chatInput">
								<input type="text" className="chatInput__input" />
								<button className="chatInput__send">Send</button>
							</div>
						</div>
						<div className="room_stage">
							visual chat room goes here
							<div className="stage__users">
								<ul className="stageUsers">
									{roomStore.users.map(user =>
										<li key={user.id} className="stageUsers__user">
											<img src="" alt={`Avatar of ${user.userName}`} />
											{user.userName}
										</li>
									)}
								</ul>
							</div>
						</div>
						<div className="room__userList">
							<h2>{roomStore.room.roomName}</h2>
							<ul className="userList">
								{roomStore.users.map(user =>
									<li key={user.id} className="userList__user">{user.userName}</li>
								)}
							</ul>
						</div>
					</div>
				</Layout>
			</div>
		);
	}
}

export default RoomRoute;
