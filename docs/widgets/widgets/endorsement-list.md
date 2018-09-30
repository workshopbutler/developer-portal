# List of Testimonials

This widget renders the list of testimonials for one of the trainers from your account. It is particularly useful
for an individual trainer to integrate this widget on his/her website. The list of testimonials updates automatically
and almost immediately when you add a new testimonial to your account.

## Configuration options

| Name | Type | Default | Description |
|------|------|---------|-------------|
| **type** | string | | Must be `TestimonialList` for this widget |
| **target** | string | | ID of an HTML element where the widget's content is placed. Should have a leading `#` symbol |
| **trainerId** | number | | ID of the trainer |
| **template** | optional string || ID of an HTML element containing a [Nunjucks template](https://mozilla.github.io/nunjucks/) for an testimonial in the list. Must have a leading `#` symbol. |
| **templateUrl** | optional string || URL to a file containing a [Nunjucks template](https://mozilla.github.io/nunjucks/) for an testimonial in the list. Use it during the development only as it significantly reduces the speed of content rendering. |
| **theme** | optional string || Name of the theme. Five themes are supported out of the box: *alfred*, *dacota*, *britton*, *hayes*, and *gatsby*. Provide a name of your own theme if you [created a custom one](/themes/custom-theme.md). |

## Example

```javascript

const testimonials = 
   {
       type: 'TestimonialList',
       target: '#wsb-testimonial-list',
       trainerId: 25,
       theme: 'alfred'
   };

const widgets = [testimonials];
const config = {
  apiKey: apiKey,
  locale: 'en-us'
};

WorkshopButlerWidgets.launch(config, widgets);

```
