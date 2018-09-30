import React from 'react';
import socketIoClient from 'socket.io-client';
import { Route, Switch } from 'react-router-dom';
import HomePage from './pages/home.js';
import MapPage from './pages/map.js';
import RoomPage from './pages/room.js';
import logo from './logo.svg';
import './App.css';

class App extends React.Component {
	constructor() {
		super();
		this.state = {
			users: [],
			socketEndpoint: 'http://127.0.0.1:3001'
		};
	}

	componentDidMount() {
		fetch('/api/users')
		.then(res => res.json())
		.then(users => this.setState({ users }));

		const socket = socketIoClient(this.state.socketEndpoint);
	}

	render() {
		return (
			<div className="App">
				<ul>
					{this.state.users.map(user =>
							<li key={user.id}>{user.userName}</li>
					)}
				</ul>
				<Switch>
					<Route exact path="/" component={HomePage} />
					<Route path="/map" component={MapPage} />
					<Route path="/chat" component={RoomPage} />
				</Switch>
			</div>
		);
	}
}

export default App;
