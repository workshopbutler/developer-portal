# Changelog

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
