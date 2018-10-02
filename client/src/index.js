import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter } from 'react-router-dom';
import { Provider } from 'mobx-react';
import './index.css';
import App from './App';
import registerServiceWorker from './registerServiceWorker';
import WebsocketService from './services/WebsocketService.js';

// stores
import RoomStore from './stores/RoomStore.js';
import CurrentUserStore from './stores/CurrentUserStore.js';

// socket/store setup
const socket = new WebsocketService();
const stores = {
	roomStore: new RoomStore(socket),
	currentUserStore: new CurrentUserStore(socket)
};

// app
ReactDOM.render((
	<Provider {...stores}>
		<BrowserRouter>
			<App />
		</BrowserRouter>
	</Provider>
), document.getElementById('root'));
registerServiceWorker();
