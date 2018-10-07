# Registration Form

This widget renders the registration form of a specific event.

## Configuration options

| Name | Type | Default | Description |
|------|------|---------|-------------|
| **type** | string | | Must be `RegistrationForm` for this widget |
| **target** | string | | ID of an HTML element where the widget's content is placed. Should have a leading `#` symbol |
| **eventPageUrl** | string | | A relative path to a page with a configured [EventPage](event-page.md) widget. This path is used to make an URL to the event page. For example, with `#!js eventPageUrl='/event-details.html'`, an URL for the event with `id=1` will be `#!js /event-details.html?id=1`
| **template** | string || ID of an HTML element containing a [Nunjucks template](https://mozilla.github.io/nunjucks/) for an event in the list. Must have a leading `#` symbol. |
| **templateUrl** | string || URL to a file containing a [Nunjucks template](https://mozilla.github.io/nunjucks/) for event in the list. Use it during the development only as it significantly reduces the speed of content rendering. |
| **theme** | string || Name of the theme. Five themes are supported out of the box: *alfred*, *dacota*, *britton*, *hayes*, and *gatsby*. Provide a name of your own theme if you [created a custom one](/widgets/custom/theme.md). |

## Example

```javascript
const widgets = [
   {
       type: 'RegistrationForm',
       target: '#wsb-registration-form',
       template: '#event-tpl',
       eventPageUrl: '/event-details.html'
   }
];
```
