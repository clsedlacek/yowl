import React from 'react';

class Layout extends React.Component {
	render() {
		return (
				<div>
					<header>
						Layout header
					</header>
					<main>
						{this.props.children}
					</main>
					<footer>
						Layout footer
					</footer>
				</div>
		);
	}
}

export default Layout;
