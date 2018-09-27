import React from 'react';
import socketIoClient from 'socket.io-client';
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
				<header className="App-header">
					<img src={logo} className="App-logo" alt="logo" />
					<h1 className="App-title">Welcome to React</h1>
					<ul>
						{this.state.users.map(user =>
								<li key={user.id}>{user.userName}</li>
						)}
					</ul>
				</header>
				<p className="App-intro">
					To get started, edit <code>src/App.js</code> and save to reload.
				</p>
			</div>
		);
	}
}

export default App;
