import React from 'react';
import Layout from './components/Layout/Layout'
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
				<Layout>
					<ul>
						{this.state.users.map(user =>
								<li key={user.id}>{user.userName}</li>
						)}
					</ul>
				</Layout>
			</div>
		);
	}
}

export default App;
