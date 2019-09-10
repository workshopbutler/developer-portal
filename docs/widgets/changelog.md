# Changelog

## 1.7.3
* Fixes rendering of italic, sub and sup tags
* Fixes support for IE11. New polyfill must be used: https://polyfill.io/v3/polyfill.min.js?features=Number.isNaN%2CIntl%2CString.prototype.startsWith%2CString.prototype.repeat


## 1.7.2
* Fixes the representation of bold text in event and trainer descriptions

## 1.7.0
* Adds `eventTypeId` and `trainerId` parameters to [Schedule](widgets/schedule.md). If set, events in the schedule are 
filtered by these parameters.
* Adds support for cover images in [Schedule](widgets/schedule.md) and [EventPage](widgets/event-page.md). 
If a workshop contains a cover image, then you can retrieve it and its thumbnail by `event.coverImage.url` and 
`event.coverImage.thumbnail` in the templates.


## 1.6.0
* Adds `future` parameter to [Schedule](widgets/schedule.md). Default is `true`
* Adds `length` parameter to [Schedule](widgets/schedule.md). Default is `none`
* Changes the sorting order of workshops for [Schedule](widgets/schedule.md) and [SidebarEventList](widgets/sidebar-event-list.md). 
When `future=false`, the events are shown in the reverse order, from the latest to the oldest. 

## 1.5.0
Adds a new Category filter to [Schedule](widgets/schedule.md)

## 1.4.0
SEO-related release

* Adds JSON-LD markup for [event pages](widgets/event-page.md)
* Adds page descriptions for [event pages](widgets/event-page.md)

## 1.3.0
Adds support for URL pattern of [event pages](widgets/event-page.md). Now you can use strings
like `id={{id}}&title={{title}}&dates={{dates}}` to customise the URLs of event pages. Use `eventPagePattern`
parameter on [Schedule](widgets/schedule.md) and [SidebarEventList](widgets/sidebar-event-list.md) widgets

## 1.2.1
* Rendering of [custom fields](https://support.workshopbutler.com/article/46-how-to-add-a-new-custom-field) was fixed. Before labels for custom fields were not shown
* Rendering of [custom page templates](https://workshopbutler.com/developers/widgets/custom/template/) was fixed. They could produce errors in some cases.

## 1.2.0

* Functions `_t`, `_f` and widget config are available in [user's templates](custom/template.md)
* Default translations can be modified with user dictionaries
* *Location* filter in [the list of trainers](widgets/trainer-list.md) filters trainers by countries they work at, not the countries they live

## 1.1.1
Fixes several serious flaws with mobile templates which did not work correctly in many cases.

## 1.1.0
This release radically improves the usability of all themes for mobiles and adds several useful features.

### New

* New column for a [Schedule widget](widgets/schedule.md) in a Table view - trainers
* You can change the order of columns and hide columns in a Table view of the workshop schedule via parameters

### Improved

* All themes support mobile screens. Now your workshops are more accessible than ever
* The URLs for [trainer's profile](widgets/trainer-profile.md) have a form `id=[id]&name=[trainer name]`

### Changed / Removed
* We removed the header for a Table view of the [workshop schedule](widgets/schedule.md). In this version, it is simply hidden via styles. You can show it back without changing the layout.
* Columns in a Table view got new classes to support more flexible table configurations

## 1.0.2
* Fixes a **Trainer** filter in the schedule of events
* Improves the styles and layout of the schedule of events a bit 

## 1.0.1
This version represents the next generation of Workshop Butler widgets for website integration. It comes with:

* Support of six languages: English, German, French, Spanish, Portuguese, and French
* Support of locales. For example, 'en-us' and 'en-gb'
* Much improved five themes
* Separate registration form to workshops
* List of testimonials for trainers
* Multiple configuration options 
* [Integration Kit](https://workshopbutler.com/kit) for a simple configuration

## 0.7.1
* Fixes a bug when a event's timezone is shown even if it does not exist

## 0.7.0
**Support for times and timezones in events**

!!!info
    Related API update: [2018-06-28](../api/changelog.md#2018-06-28)

* Adds support for start and end times of events, of events' timezones
* Removes `formatDate` function
* Moves different attributes for `Event` to `schedule` and `location` attributes
* Adds `format` method for `Schedule` to render dates, times and timezones correctly

## 0.6.0
* Adds detailed statistics for trainers. See `Statistics.votes` attribute for more information
* Adds `getFullName` function to `Trainer`
* Fixes the support for a separate registration form

## 0.5.0
* Changes the logic to remove the dependence on the theme's classes
* Renames EventList widget to Schedule, TrainerPage to TrainerProfile
* Ups the theme version to 0.5.1

## 0.4.0

**First public release**

* The scripts are moved to https://cdn.workshopbutler.com
* A project structure has changed and [the themes](../themes/index.md) are included as git submodule
* Build options have changed slightly
