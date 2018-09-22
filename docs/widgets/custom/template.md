# Template Customisation

Sometimes [theme customisation](theme.md) is not enough for you and the change of the layout is needed. There are several
ways to update templates. 

1. Store a widget's template in HTML code and pass it to the widget
1. Store a widget's template on your server and pass it to the widget
1. Create a new set of templates and pass them to widgets

## Storing a template in HTML code

The easiest way to change the layout is to take [an existing template](https://github.com/workshopbutler/js-widgets/tree/master/src/templates),
copy its content, tweak, add it on the page with an install widget and pass its position to the widget. 

First, you need to add the template's code to the page. 

```html
<div id="my-template">
  <div class="wsb-content">
    <div class="wsb-schedule">
      <div class="wsb-table" data-event-list>
        <div class="wsb-table__head">
          <div class="wsb-table__col">{{ _t('schedule.when') }}</div>
          <div class="wsb-table__col">{{ _t('schedule.where') }}</div>
          <div class="wsb-table__col">{{ _t('schedule.what') }}</div>
          <div class="wsb-table__col"></div>
        </div>
      </div>
      <div class="wsb-no-events" data-empty-list>
          {{ _t('schedule.noEvents') }}
      </div>
      </div>
  </div>
</div>
```

Then you update a configuration of the widget, adding `template` parameter to it. For example,

```javascript
const schedule = {
   type: 'Schedule',
   target: '#wsb-event-list',
   eventPageUrl: '/event-page.html',
   filters: ['location', 'language', 'trainer'],
   table: true,
   template: '#my-template',
   theme: 'alfred',
   fields: ['paid_ticket_types']
};
const widgets = [schedule];
const config = {
  apiKey: apiKey,
  locale: 'en-us'
};

WorkshopButlerWidgets.launch(config, widgets);
```

The widget reads the template and produces a final HTML code.

## Storing a template on your server

In the previous method, a template is stored inside page code. In this case, a template is stored on your server and is 
accessible by URL. All you need is to pass that URL to the widget via `templateUrl` parameter.


```javascript
const schedule = {
   type: 'Schedule',
   target: '#wsb-event-list',
   eventPageUrl: '/event-page.html',
   filters: ['location', 'language', 'trainer'],
   table: true,
   templateUrl: 'https://mydomain.com/mytemplate.njk',
   theme: 'alfred',
   fields: ['paid_ticket_types']
};
const widgets = [schedule];
const config = {
  apiKey: apiKey,
  locale: 'en-us'
};

WorkshopButlerWidgets.launch(config, widgets);
```

## Creating a new set of templates

From time to time, it makes sense to create new templates for all widgets. To do that, you need to pass the templates
as a parameter to `WorkshopButlerWidgets.launch` method. 

### Set up and Launch a development server
Check [Theme Customisation](theme.md#set-up) to learn how to launch a development server.

### Custom templates
An object you pass to `launch` method, must implement [`ITemplates`](https://github.com/workshopbutler/js-widgets/blob/master/src/templates/ITemplates.ts)
interface. 

There is a [default implementation](https://github.com/workshopbutler/js-widgets/blob/master/src/templates/DefaultTemplates.ts) 
that you can reuse. Simply change the default templates and the local server finds the changes and refreshes pages in a browser.

Each widget exports several variables and functions to use inside the templates:

* `_f(arg: any, type: string)` converts an argument to string. See [Formatter](https://github.com/workshopbutler/js-widgets/blob/master/src/view/Formatter.ts) and related classes for more information
* `_t(token: string)` translates a token. See [the locales](https://github.com/workshopbutler/js-widgets/tree/master/src/locales) for all available tokens.
* `config` contains [a widget's configuration](https://github.com/workshopbutler/js-widgets/tree/master/src/widgets/config)

Additional variables depend on the type of widget. It can be `events`, `event`, `trainers`, `trainer` and etc. See
`render` method of each widget for a full list of parameters passed to templates.

### Installation

To compile new templates, use `npm run build`. It produces `dist/template.[version].js` files, containing the templates.

Add this file to HTML page and pass the templates to a widget.

```javascript
const schedule = {
  ...
};
const widgets = [schedule];
const config = {
  apiKey: apiKey,
  locale: 'en-us'
};

WorkshopButlerWidgets.launch(config, widgets, WorkshopButlerTemplates);
```

!!!info
    If you want to store your templates not in `WorkshopButlerTemplates`, but in another variable, update 
    [`template.ts`](https://github.com/workshopbutler/js-widgets/blob/master/src/templates.ts)  
