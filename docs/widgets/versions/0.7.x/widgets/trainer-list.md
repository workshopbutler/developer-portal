# Trainer List

This widget renders the list of trainers from your account.

## Configuration options

| Name | Type | Default | Description |
|------|------|---------|-------------|
| **type** | string | | Must be `TrainerList` for this widget |
| **target** | string | | ID of an HTML element where the widget's content is placed. Should have a leading `#` symbol |
| **trainerPageUrl** | string | | A relative path to a page with a configured [TrainerProfile](trainer-profile.md) widget. This path is used to make an URL to the profile page. For example, with `#!js trainerPageUrl='/trainer-page.html'`, an URL for the trainer with `id=1` will be `#!js /trainer-page.html?id=1` |
| **filters** | array of strings | | Contains the names of filters which should be added to the list of trainers. Supported filters are: <br> <ul><li>**location**. Trainers are filtered by country</li><li>**language**. Trainers are filtered by the language they speak</li><li>**trainer**. Trainers are filtered by name.</li><br>The order of filters is important. If you want to see a filter by trainers first, by location - second, and by language - third, then the configuration should be `['trainer', 'location', 'language']`. |
| **template** | string || ID of an HTML element containing a [Nunjucks template](https://mozilla.github.io/nunjucks/) for a trainer in the list. Must have a leading `#` symbol. |
| **templateUrl** | string || URL to a file containing a [Nunjucks template](https://mozilla.github.io/nunjucks/) for a trainer in the list. Use it during the development only as it significantly reduces the speed of content rendering. |
| **theme** | string || Name of the theme. Five themes are supported out of the box: *alfred*, *dacota*, *britton*, *hayes*, and *gatsby*. Provide a name of your own theme if you [created a custom one](/widgets/custom/theme.md). |

## Example

```javascript

const widgets = [
   {
       type: 'TrainerList',
       target: '#wsb-trainer-list',
       trainerPageUrl: '/trainer-details.html',
       filters: ['location', 'trainer', 'language'],
       theme: 'alfred'
   }
];
```
