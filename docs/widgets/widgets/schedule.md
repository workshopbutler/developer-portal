# Schedule

This widget renders the list of public upcoming events for your account.

## Configuration options

| Name | Type | Default | Description |
|------|------|---------|-------------|
| **type** | string | | Must be `Schedule` for this widget |
| **target** | string | | ID of an HTML element where the widget's content is placed. Should have a leading `#` symbol |
| **eventPageUrl** | string | | A path to a page with a configured [EventPage](event-page.md) widget. This path is used to make an URL to the event page. For example, with `#!js eventPageUrl='/event-details.html'`, an URL for the event with `id=1` will be `#!js /event-details.html?id=1`
| **filters** | array of strings | | Contains the names of filters which should be added to the list of events. Supported filters are: <br> <ul><li>**type**. Events are filtered by event type</li><li>**location**. Events are filtered by country</li><li>**language**. Events are filtered by spoken language</li><li>**trainer**. Events are filtered by trainers of these events.</li><br>The order of filters is important. If you want to see a filter by trainers first, by location - second, by type - third and no filter by language, then the configuration should be `['trainer', 'location', 'type']`. |
| **table** | boolean | false | All default themes support two layouts for the schedule: tiles and table. When this parameters is `true`, the `table` layout is used. |
| **registration** | boolean | false | If true, a registration button for each event leads directly to [a registration page](registration-form.md), not to [an event page](event-page.md). Parameter `registrationPageUrl` must be set |    
| **registrationPageUrl** | optional string | |  A path to a page with a configured [RegistrationPage](registration-form.md) widget. This path is used to make an URL to the registration page. For example, with `#!js registrationPageUrl='/registration.html'`, an URL for the event with `id=1` will be `#!js /registration.html?id=1`<br><br>==This parameter must be set if `registration=true`== | 
| **template** | optional string || ID of an HTML element containing a [Nunjucks template](https://mozilla.github.io/nunjucks/) for an event in the list. Must have a leading `#` symbol. |
| **templateUrl** | optional string || URL to a file containing a [Nunjucks template](https://mozilla.github.io/nunjucks/) for event in the list. Use it during the development only as it significantly reduces the speed of content rendering. |
| **fields** | optional array of string || Additional fields which should be returned by [Workshop Butler API](/api) for each event. Check the API description for the list of available fields |
| **theme** | optional string || Name of the theme. Five themes are supported out of the box: *alfred*, *dacota*, *britton*, *hayes*, and *gatsby*. Provide a name of your own theme if you [created a custom one](../../themes/custom-theme.md). |


## Example

```javascript
const schedule = {
   type: 'Schedule',
   target: '#wsb-event-list',
   eventPageUrl: '/event-page.html',
   filters: ['location', 'language', 'trainer'],
   table: true,
   // template: '#event-tpl',
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

```html
<script id='event-tpl' type='text/nunjucks'>
	{{ event.title }}
</script>
```
