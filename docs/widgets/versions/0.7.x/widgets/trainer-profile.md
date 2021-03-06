# Trainer Profile

This widget renders the profile of a trainer.

## Configuration options

| Name | Type | Default | Description |
|------|------|---------|-------------|
| **type** | string | | `version >= 0.5.0` Must be `TrainerProfile` for this widget<br>`version <= 0.5.0` Must be `TrainerPage` for this widget |
| **target** | string | | ID of an HTML element where the widget's content is placed. Should have a leading `#` symbol |
| **template** | string || ID of an HTML element containing a [Nunjucks template](https://mozilla.github.io/nunjucks/) for an event in the list. Must have a leading `#` symbol. |
| **templateUrl** | string || URL to a file containing a [Nunjucks template](https://mozilla.github.io/nunjucks/) for event in the list. Use it during the development only as it significantly reduces the speed of content rendering. |
| **widgets** | array of objects || Configurations for JS widgets which should be placed on the profile page when it is rendered. For example, a list of upcoming events of this trainer. |
| **theme** | string || Name of the theme. Five themes are supported out of the box: *alfred*, *dacota*, *britton*, *hayes*, and *gatsby*. Provide a name of your own theme if you [created a custom one](/widgets/custom/theme.md). |

## Example

```javascript

const widgets = [
   {
       type: 'TrainerProfile',
       target: '#wsb-trainer',
       theme: 'alfred',
       widgets: [
           {
               type: 'SidebarEventList',
               hideIfEmpty: true,a
               target: '#upcoming-events-nearby',
               eventPageUrl: '/event-page.html',
               length: 5,
               country: 'detect'
           }]
};
```
