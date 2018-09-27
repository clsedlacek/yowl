// dependencies
const express = require('express');

// setup
const router = express.Router();



// GET requests
router.get('/', (req, res) => {
	// get all users
	res.json(
		[
			{
				id: 1,
				userName: "admin"
			},
			{
				id: 2,
				userName: "gizmo"
			}
		]
	);
});

router.get('/:userId', (req, res) => {
	// get user with ID
});



// POST requests
router.post('/', (req, res) => {
	// create new user
});



// PUT requests
router.put('/:userId', (req, res) => {
	// update user with ID
});



// DELETE requests
router.delete('/:userId', (req, res) => {
	// delete user with ID
});


module.exports = router;
