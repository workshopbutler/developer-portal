# Changelog

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
