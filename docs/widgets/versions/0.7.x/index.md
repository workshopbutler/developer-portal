# JS Widgets

!!!danger
    This is an old version. Get the latest version [here](/widgets) 

Workshop Butler JS Widgets library allows you to display information about events and trainers on
your website and enables visitors to register for your workshops via customisable registration forms.
It is easily configurable and works seamlessly with [Workshop Butler API](/api).

There are six types of supported widgets:

* [event schedule](widgets/schedule.md)
* [event page](widgets/event-page.md) containing the details of a specific event
* [registration form](widgets/registration-form.md) (all [default themes](/themes/index.md) support only built-in registration form for now).
* [list of trainers](widgets/trainer-list.md)
* [trainer profile page](widgets/trainer-profile.md)
* [sidebar list of events](widgets/sidebar-event-list.md) made to show a list of events in a sidebar-friendly manner

## Requirements

* jQuery version higher than 2.1.4

## Versions

!!! important
    Starting the version 0.4.0 the widgets are hosted on `https://cdn.workshopbutler.com`

| Version | Files |
| ------- | ----- |
| 0.7.1   | [0.7.1](https://cdn.workshopbutler.com/widgets.0.7.1.js) |
| 0.7.0   | [0.7.0](https://cdn.workshopbutler.com/widgets.0.7.0.js) |
| 0.6.0   | [0.6.0](https://cdn.workshopbutler.com/widgets.0.6.0.js) |
| 0.5.0   | [0.5.0](https://cdn.workshopbutler.com/widgets.0.5.0.js) |
| 0.4.0   | [0.4.0](https://cdn.workshopbutler.com/widgets.0.4.0.js) |
| 0.3.2   | [0.3.2](https://integrations.workshopbutler.com/widgets.0.3.2.js) |
| 0.3.1  | [0.3.1](https://integrations.workshopbutler.com/widgets.0.3.1.js) |


## Installation

### Include styles and libraries
Add this code to the header of any page you want to have a working widget:

```html
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<link href="https://use.fontawesome.com/releases/v5.0.8/css/all.css" rel="stylesheet">
<script src="https://cdn.workshopbutler.com/widgets.0.7.1.js" defer></script>
<link href="https://cdn.workshopbutler.com/styles.0.5.3.min.css" rel="stylesheet">
```

### Initialise a widget (or widgets)

During the initialisation phase, you specify what widgets should be created and launched.
The initialisation should be run only after our JS Widgets library is fully loaded.
For that, place your initialisation script inside a document event handler `wsbwidgetsloaded`:

```javascript
document.addEventListener('wsbwidgetsloaded', function () {
   //the initialisation code goes here
});
```

The initialisation script consists of two main parts: the configuration of widgets and the launch of Workshop Butler JS Widgets library.

```javascript
document.addEventListener('wsbwidgetsloaded', function () {
   const apiKey = 'api_key';
   const eventList = {
       type: 'Schedule',
       target: '#wsb-event-list',
       theme: 'alfred',
       eventPageUrl: '/event-details.html',
       filters: ['type', 'location', 'language', 'trainer'],
       template: '#event-tpl'
   };
   const widgets = [eventList];
   WorkshopButlerWidgets.launch(apiKey, widgets);
});
```

Let’s look at the example above.

1. First, we create the configuration. eventList contains the configuration for the widget.
 The list of events will have four filters (by type, location, language, and trainer) in the given order.
 The page with a configured `EventPage` widget is located at `event-details.html`.
 The widget will use a template located in HTML element with `id='event-tpl'` to render each event in the list.
1. The library can create several widgets at once so it accepts the array of widgets
1. We launch the library by specifying [API key](/widgets/index.md#generating-an-api-key) and the widgets to create.
