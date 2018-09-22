# Theme Customisation

In most cases, a theme includes styles (colours, fonts, etc) and HTML layout. In this guide, we talk only about 
styles, stored in `css` file and included on a HTML page. If you want to change the layout, 
read [Template Customisation](template.md)

## Set up

1. Clone or fork [this repo](https://github.com/workshopbutler/js-widgets)
1. Login to [Workshop Butler](https://app.workshopbutler.com/), open *Account Settings -> API*, activate it and copy an API key for your account
1. Retrieve all dependences via `npm i`

## Launch and Build

`API_KEY=[your API key] npm run watch`

This command launches a webserver on `http://localhost:8080`.

* Open `http://localhost:8080/schedule.html` for the list of all events
* Open `http://localhost:8080/trainer-list.html` for the list of all trainers

To compile a theme, use `npm run build`. The compiled files are in `dist/` directory.

## Configuration
`package.json -> version`

Contains a version number, used in `styles.[version].min.css`

`config.js -> options -> theme`

Name of an active theme. The theme is passed as a configuration parameter to Workshop Butler JS widgets. 
For default themes, use these values: `alfred`, `dacota`, `britton`, `gatsby`, `hayes`. 

## Customisation
We recommend you to duplicate one of the default themes, name it, and make the necessary tweak. The name of the theme
is added to the root `<div>` which holds HTML, produced by a widget. This way you can be sure that there is no interference
with the styles on your website pages.  

The example below shows how the style for a form button is defined.

```css
.alfred .wsb-content .wsb-form__btn {
    background-color: #4a90e2;
    border-radius: 5px;
    font-weight: 400;
    font-size: 18px;
}
```

The name of the theme is passed as a configuration parameter to all widgets, and is added automatically. If you name
your theme `my-awesome-theme`, then the code above should be:

```css
.my-awesome-theme .wsb-content .wsb-form__btn {
    background-color: #4a90e2;
    border-radius: 10px;
    font-size: 20px;
}
```

## Installation

1. After the compilation, you get a `css` file containing a custom theme. Replace default styles, loaded from
`https://cdn.workshopbutler.com`, with this file.
2. Set a correct name of your theme in all widgets' configurations.
