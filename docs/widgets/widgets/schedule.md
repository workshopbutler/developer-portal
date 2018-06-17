# Schedule

This widget renders the list of public upcoming events for your account.

## Configuration options

| Name | Type | Default | Description |
|------|------|---------|-------------|
| **type** | string | | `version >= 0.5.0` Must be `Schedule` for this widget<br>`version <= 0.5.0` Must be `EventList` for this widget |
| **target** | string | | ID of an HTML element where the widget's content is placed. Should have a leading `#` symbol |
| **eventPageUrl** | string | | A relative path to a page with a configured [EventPage](event-page.md) widget. This path is used to make an URL to the event page. For example, with `#!js eventPageUrl='/event-details.html'`, an URL for the event with `id=1` will be `#!js /event-details.html?id=1`
| **filters** | array of strings | | Contains the names of filters which should be added to the list of events. Supported filters are: <br> <ul><li>**type**. Events are filtered by event type</li><li>**location**. Events are filtered by country</li><li>**language**. Events are filtered by spoken language</li><li>**trainer**. Events are filtered by trainers of these events.</li><br>The order of filters is important. If you want to see a filter by trainers first, by location - second, by type - third and no filter by language, then the configuration should be `['trainer', 'location', 'type']`. |
| **template** | string || ID of an HTML element containing a [Nunjucks template](https://mozilla.github.io/nunjucks/) for an event in the list. Must have a leading `#` symbol. |
| **templateUrl** | string || URL to a file containing a [Nunjucks template](https://mozilla.github.io/nunjucks/) for event in the list. Use it during the development only as it significantly reduces the speed of content rendering. |
| **fields** | array of string || Additional fields which should be returned by [Workshop Butler API](/api) for each event. Check the API description for the list of available fields |
| **theme** | string || Name of the theme. Five themes are supported out of the box: *alfred*, *dacota*, *britton*, *hayes*, and *gatsby*. Provide a name of your own theme if you [created a custom one](../../themes/custom-theme.md). |

## Switching between layouts
All default themes support two layouts for the schedule: tiles and table. Table is a default
layout. To change the layout, you need to request the template object first, and update its type.

```js
let templates = WorkshopButlerWidgets.getDefaultTemplates();
// true for a table view, false for a tile view
templates.setEventListType(true);
```

## Example

```javascript
const schedule = {
   type: 'Schedule',
   target: '#wsb-event-list',
   eventPageUrl: '/event-page.html',
   filters: ['location', 'language', 'trainer'],
   // template: '#event-tpl',
   theme: 'alfred',
   fields: ['paid_ticket_types']
};
const widgets = [schedule];
let templates = WorkshopButlerWidgets.getDefaultTemplates();
// true for a table view, false for a tile view
templates.setEventListType(true);
WorkshopButlerWidgets.launch(apiKey, widgets, templates);
```

```html
<script id='event-tpl' type='text/nunjucks'>
	{{ event.title }}
</script>
```
