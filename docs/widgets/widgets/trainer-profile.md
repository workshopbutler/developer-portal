# Trainer Profile

This widget renders the profile of a trainer.

## Configuration options

| Name | Type | Default | Description |
|------|------|---------|-------------|
| **type** | string | | Must be `TrainerProfile` for this widget |
| **target** | string | | ID of an HTML element where the widget's content is placed. Should have a leading `#` symbol |
| **futureEvents** | boolean | true | Adds the container for future events. You also must provide a related [SidebarEventList](sidebar-event-list.md) widget with target `#upcoming-events` to show the upcoming events. Check the example for more info |
| **pastEvents** | boolean | true | Adds the container for past events. You also must provide a related [SidebarEventList](sidebar-event-list.md) widget with target `#past-events` to show the past events. Check the example for more info |
| **template** | optional string || ID of an HTML element containing a [Nunjucks template](https://mozilla.github.io/nunjucks/) for an event in the list. Must have a leading `#` symbol. |
| **templateUrl** | optional string || URL to a file containing a [Nunjucks template](https://mozilla.github.io/nunjucks/) for event in the list. Use it during the development only as it significantly reduces the speed of content rendering. |
| **widgets** | optional array of objects || Configurations for JS widgets which should be placed on the profile page when it is rendered. For example, a list of upcoming events of this trainer. |
| **theme** | optional string || Name of the theme. Five themes are supported out of the box: *alfred*, *dacota*, *britton*, *hayes*, and *gatsby*. Provide a name of your own theme if you [created a custom one](/widgets/custom/theme.md). |

## Example

```javascript

const trainerProfile = 
   {
       type: 'TrainerProfile',
       target: '#wsb-trainer',
       theme: 'alfred',
       widgets: [
           {
               type: 'SidebarEventList',
               hideIfEmpty: true,
               target: '#upcoming-events',
               future: true,
               eventPageUrl: '/event-page.html',
               length: 5,
               country: 'detect',
               trainerId: WorkshopButlerWidgets.getQueryParam('id')
           },
          {
              type: 'SidebarEventList',
              hideIfEmpty: true,
              target: '#past-events',
              future: false,
              eventPageUrl: '/event-page.html',
              length: 5,
              country: 'detect',
              trainerId: WorkshopButlerWidgets.getQueryParam('id')
          }]
};

const widgets = [trainerProfile];
const config = {
  apiKey: apiKey,
  locale: 'en-us'
};

WorkshopButlerWidgets.launch(config, widgets);

```
