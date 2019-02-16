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
| **dict** | JSON | {} | User dictionary to replace default values. Read more [below](#user-dictionary) |

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
  

### User dictionary

As you already [know](#locale), there are six supported languages. Sometimes you need to change a few
phrases because the default ones do not suit your needs. The user dictionary allows you to do that. 

#### How it works
All phrases and words that you see and which are not retrieved from [Workshop Butler API](../api/index.md), are represented by tokens. For example, the *Location* filter has a value **All locations**. The phrase **All locations** is stored in `filter.locations` token and its value is different from locale to locale. To replace its value to **All countries**, we'll need to set `filter.locations` in a user dictionary. 

```javascript

const generalOptions = {
  apiKey: apiKey,
  locale: 'en-us',
  dict: {
    en: {
      filter: {
        locations: "All countries"
      }
    }
  }
};
WorkshopButlerWidgets.launch(generalOptions, ...);
```

As you can see, first you need to pass a locale for which you want to replace a token, and then a structure, identical to a default one.

#### How to find a token
To find a token, open [the list of locales](https://github.com/workshopbutler/js-widgets/tree/master/src/locales), select the one you need,
and search for the phrase you want to replace. After that, use the token in a user dictionary.

To simplify the process, here's a short description of all high-level blocks from default locales:

* `filter` contains the tokens, used in workshop and trainer filters
* `country` contains the names of countries
* `language` contains the names of languages
* `rating` contains the values from **By rating** filter
* `schedule` contains the tokens from [Schedule](widgets/schedule.md) widget
* `trainers` contains the tokens from [TrainerList](widgets/trainer-list.md) widget
* `event` contains the tokens from [EventPage](widgets/event-page.md) widget
* `trainer` contains the tokens from [TrainerProfile](widgets/trainer-profile.md) widget
* `tax` contains the tokens about included/excluded VAT
* `form` contains the tokens from [RegistrationForm](widgets/registration-form.md) widget
* `registration` contains the texts the user sees after completing a registration
* `sidebar` contains the tokens related to [SidebarEventList](widgets/sidebar-event-list.md) widget