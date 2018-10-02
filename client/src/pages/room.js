import React from 'react';
import Layout from '../components/Layout/Layout.js';

class RoomRoute extends React.Component {
	render() {
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
									<li className="stageUsers__user">admin</li>
									<li className="stageUsers__user">gizmo</li>
								</ul>
							</div>
						</div>
						<div className="room__userList">
							<ul className="userList">
								<li className="userList__user">admin</li>
								<li className="userList__user">gizmo</li>
							</ul>
						</div>
					</div>
				</Layout>
			</div>
		);
	}
}

export default RoomRoute;
