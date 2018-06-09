# Creating a Custom Theme

## Set up

1. Clone or fork [this repo](https://github.com/workshopbutler/themes)
1. Login to [Workshop Butler](https://app.workshopbutler.com/), open *Account Settings -> API*, activate it and copy an API key for your account
1. Retrieve all dependences via `npm i`

## How it works
The build produces two files: `template.[version].js` and `styles.[version].min.css]`. The former one includes a layout for the themes. The latter one, obviously, contains the styles.

Such division gives you two options for implementing custom themes, based on the default ones:

1. Alter the styles
1. Change both the styles and the layout of the pages

If you change only the styles, compile a css file and include it on the page. If you change the layout,
you need to pass the new templates to JS widgets. 

## Launch and Build
`API_KEY=[your API key] npm run watch`

This command launches a webserver on `http://localhost:8080`.

* Open `http://localhost:8080/event-list.html` for the list of all events
* Open `http://localhost:8080/trainer-list.html` for the list of all trainers

To compile a theme, use `npm run build`. The compiled files are in `dist/` directory.

## Configuration
`package.json -> version`

Contains a version number, used in `template.[version].js` and `styles.[version].min.css`

`config.js -> options -> theme`

Name of an active theme. The theme is passed as a configuration parameter to Workshop Butler JS widgets. For default themes, use these values: `alfred`, `dacota`, `britton`, `gatsby`, `hayes`.

`config.js -> options -> widgetVersion`

Version number of Workshop Butler JS widgets. Based on this parameters, a particular version of the widgets is added to the HTML pages (for example, `event-list.html`).

## Found a bug / Have a question
Open [an issue](https://github.com/workshopbutler/themes/issues) and we will get back to you.
