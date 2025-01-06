//import daisyui from "daisyui"
/** @type {import('tailwindcss').Config} */
module.exports = {
	content: [
		'./src/**/*.html',
	],
	theme: {
		extend: {},
	},
	plugins: [
		require('tailwindcss-animated'),
	],

}
