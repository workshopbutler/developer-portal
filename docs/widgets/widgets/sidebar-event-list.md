# Sidebar Event List

This widget renders the list of events for your account in a layout, friendly for sidebars.

## Configuration options

| Name | Type | Default | Description |
|------|------|---------|-------------|
| **type** | string | | Must be `SidebarEventList` for this widget |
| **target** | string | | ID of an HTML element where the widget's content is placed. Should have a leading `#` symbol |
| **eventPageUrl** | string | | A path to a page with a configured [EventPage](event-page.md) widget. This path is used to make an URL to the event page. For example, with `#!js eventPageUrl='/event-details.html'`, an URL for the event with `id=1` will be `#!js /event-details.html?id=1`
| **template** | optional string || ID of an HTML element containing a [Nunjucks template](https://mozilla.github.io/nunjucks/) for an event in the list. Must have a leading `#` symbol. |
| **templateUrl** | optional string || URL to a file containing a [Nunjucks template](https://mozilla.github.io/nunjucks/) for event in the list. Use it during the development only as it significantly reduces the speed of content rendering. |
| **hideIfEmpty** | boolean | false | Removes the widget from the page if no events are found. |
| **length** | int | 3 | Number of events in the list |
| **country** | optional string || Filters the events in the list by country. It can contain:<ul><li>2-letter country code, ex. `DE`</li><li>word `detect` to order Workshop Butler to detect a visitor’s country by IP. This should be used to show visitors the events nearby.</li></ul> |
| **eventType** | optional int || Filter events by their type. It should contain an ID of the selected type. |
| **future** | boolean | true | When `true`, the widget shows future events. When `false`, the widget shows past events. |
| **trainer** | optional int || Filter events in the list by a trainer. It should contain an ID of the selected trainer. <br>To use it on [a trainer profile page](trainer-profile.md), use a helper to retrieve the ID of the trainer:<br>`#!js WorkshopButlerWidgets.getQueryParam('id')` |
| **excludeId** | optional int || Exclude an event with the ID from the list. For example, to exclude a current event from the list of upcoming events on the event page. <br>To use it on [an event page](event-page.md), use a helper to retrieve the ID of the trainer:<br>`#!js WorkshopButlerWidgets.getQueryParam('id')` |
| **theme** | optional string || Name of the theme. Five themes are supported out of the box: *alfred*, *dacota*, *britton*, *hayes*, and *gatsby*. Provide a name of your own theme if you [created a custom one](../../themes/custom-theme.md). |

## Container
There is a difference between containers for other widgets, and a container for `SidebarEventList` widget. There are two
reasons to that difference:

1. `SidebarEventList` can be a part of other widgets
2. It has `hideIfEmpty` configuration option which hides the content if there are no events.

That is why a container for a standalone `SidebarEventList` should be similar to:

```html
<div id="upcoming-events-nearby" class="wsb-content">
  <div data-events-list></div>
</div>
``` 

### Important takeaways
1. A container should have a class `wsb-content`. Otherwise, [the default themes](/themes/index.md) do not work
2. There must be a `<div data-events-list></div>` inside the container. Otherwise, you do not see the list of events.

## Example

```javascript

const sidebar = 
   {
     type: 'SidebarEventList',
     hideIfEmpty: true,
     target: '#upcoming-events-nearby',
     eventPageUrl: '/event-page.html',
     length: 5,
     country: 'detect'
};

const widgets = [sidebar];
const config = {
  apiKey: apiKey,
  locale: 'en-us'
};

WorkshopButlerWidgets.launch(config, widgets);
```
