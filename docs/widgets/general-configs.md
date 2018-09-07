# General Configuration

There are two types of configs: general configuration and widget configuration. **The general configuration** is the same for all widgets
on one page. It is passed as the first parameter to `WorkshopButlerWidgets.launch` function

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

const widgetOptions = [sidebar];
const generalOptions = {
  apiKey: apiKey,
  locale: 'en-us'
};

WorkshopButlerWidgets.launch(generalOptions, widgetOptions);

```

## Configuration Options

| Name | Type | Default | Description |
|------|------|---------|-------------|
| **apiKey** | string | | API key |
| **locale** | string | en-gb | Locale. Read more [below](#locale) |

### Locale
Locale determines what language to use for rendering content and how numbers, dates and prices must be formatted.

The first part of the locale defines what language to use for content. Right now there are six languages supported by 
JS widgets: English (`en`), German (`de`), Portuguese (`pt`), Spanish (`es`), French (`fr`), and Dutch (`nl`). If you 
set a language, which is not supported, for example Russian (`ru`), English is used as a default one.

!!!info
    If you need to add a support for another language, add a new locale and create a PR: 
    https://github.com/workshopbutler/js-widgets/tree/master/src/locales 


The locale itself defines how numbers and dates are formatted. In the US (`en-us`), the formatting is different 
to Britain (`en-gb`). You can find the list of locales [here](https://www.roseindia.net/tutorials/I18N/locales-list.shtml).
It is important to notice that we do not guarantee all locales from the list work correctly. Try it yourself!

!!!info
    Right now we use full locales (`en-gb`) only for formatting numbers, dates and prices. There is only one translation 
    per language (`en`). For example, there is no difference between British and American English. 
     
    If you want to add a support for a particular version of language, add a new locale and create a PR: 
    https://github.com/workshopbutler/js-widgets/tree/master/src/locales 
  
