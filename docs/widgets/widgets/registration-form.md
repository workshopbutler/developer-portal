# Registration Page

This widget renders the registration form of a specific event.

## Configuration options

| Name | Type | Default | Description |
|------|------|---------|-------------|
| **type** | string | | Must be `RegistrationPage` for this widget |
| **target** | string | | ID of an HTML element where the widget's content is placed. Should have a leading `#` symbol |
| **trainers** | boolean | false | When `true`, a block with trainers is added to the page. |
| **expiredTickets** | boolean | false | Shows the information about tickets which have ended or sold out. Set to `true` if you want to show all tickets groups |
| **numberOfTickets** | boolean | true | Shows the number of left tickets for each ticket group. Set to `false` if you want to hide how many tickets left for each ticket group |
| **eventPageUrl** | optional string | | A path to a page with a configured [EventPage](event-page.md) widget. This path is used to make an URL to the event page. For example, with `#!js eventPageUrl='/event-details.html'`, an URL for the event with `id=1` will be `#!js /event-details.html?id=1`
| **template** | optional string || ID of an HTML element containing a [Nunjucks template](https://mozilla.github.io/nunjucks/) for an event in the list. Must have a leading `#` symbol. |
| **templateUrl** | optional string || URL to a file containing a [Nunjucks template](https://mozilla.github.io/nunjucks/) for event in the list. Use it during the development only as it significantly reduces the speed of content rendering. |
| **theme** | optional string || Name of the theme. Five themes are supported out of the box: *alfred*, *dacota*, *britton*, *hayes*, and *gatsby*. Provide a name of your own theme if you [created a custom one](../../widgets/custom/theme.md). |

## Example

```javascript
const registrationPage = 
   {
       type: 'RegistrationPage',
       target: '#wsb-registration-page',
       eventPageUrl: '/event-details.html',
       trainers: true,
       numberOfTickets: false,
       theme: 'dacota'
   };

const widgets = [registrationPage];
const config = {
  apiKey: apiKey,
  locale: 'en-us'
};

WorkshopButlerWidgets.launch(config, widgets);

```
