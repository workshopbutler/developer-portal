# Event Page

This widget renders the details of a specific event.

## Configuration options

| Name | Type | Default | Description |
|------|------|---------|-------------|
| **type** | string | | Must be `EventPage` for this widget |
| **target** | string | | ID of an HTML element where the widget's content is placed. Should have a leading `#` symbol |
| **trainers** | boolean | false | When `true`, a block with trainers is added to the page. |
| **trainerPageUrl** | optional string | | A path to a page with a configured [TrainerProfile](trainer-profile.md) widget. This path is used to make an URL to the profile page. For example, with `#!js trainerPageUrl='/trainer-page.html'`, an URL for the trainer with `id=1` will be `#!js /trainer-page.html?id=1` |
| **registrationPageUrl** | string | | A path to a page with a configured [RegistrationPage](registration-form.md) widget. This path is used to make an URL to a separate registration page. For example, with `#!js registrationPageUrl='/registration-form.html'`, an URL for the event with `id=1` will be `#!js /registration-form.html?id=1` |
| **expiredTickets** | boolean | true | Shows the information about tickets which have ended or sold out. Set to `false` if you want to show only active or future tickets |
| **numberOfTickets** | boolean | true | Shows the number of left tickets for each ticket group. Set to `false` if you want to hide how many tickets left for each ticket group |
| **futureEvents** | boolean | true | Adds the container for future events. You also must provide a related [SidebarEventList](sidebar-event-list.md) widget with target `#upcoming-events` to show the upcoming events. Check the example for more info |
| **template** | optional string || ID of an HTML element containing a [Nunjucks template](https://mozilla.github.io/nunjucks/) for an event in the list. Must have a leading `#` symbol. |
| **templateUrl** | optional string || URL to a file containing a [Nunjucks template](https://mozilla.github.io/nunjucks/) for event in the list. Use it during the development only as it significantly reduces the speed of content rendering. |
| **widgets** | optional array of objects || Configurations for JS widgets which should be placed on the event page when it is rendered. For example, a list of other upcoming events. |
| **theme** | optional string || Name of the theme. Five themes are supported out of the box: *alfred*, *dacota*, *britton*, *hayes*, and *gatsby*. Provide a name of your own theme if you [created a custom one](../../themes/custom-theme.md). |

## Example

```javascript
const eventPage = 
   {
       type: 'EventPage',
       target: '#wsb-event-page',
       trainers: true,
       trainerPageUrl: '/trainer-page.html',
       registrationPageUrl: '/registration.html',
       template: '#event-tpl',
       expiredTickets: false,
       widgets: [
           {
               type: 'SidebarEventList',
               hideIfEmpty: true,
               target: '#upcoming-events',
               eventPageUrl: '/event-details.html',
               country: 'detect',
               length: 5,
               excludeId: WorkshopButlerWidgets.getQueryParam('id')
           }
       ]
   };

const widgets = [eventPage];
const config = {
  apiKey: apiKey,
  locale: 'en-us'
};

WorkshopButlerWidgets.launch(config, widgets);

```
