# Changelog
## 2.6.0
* Two new shortcodes added to show cover image of events: `[wsb_schedule_image]` and `[wsb_event_image]`

## 2.5.0
* Added **Event Type** option to the widget. You can show events only from the selected event type
* Added **event_type** parameter to `[wsb_schedule]` shortcode. You can show events only from the selected event type
* If there is only one ticket type, it's selected automatically on the registration form
* When a user filters workshops in the schedule, this information is saved in URL so you can share links to a filtered schedule
* Improved Upcoming events widget on the event page: it shows events of an active trainer and do not show an active event

## 2.4.1
* Fixes a bug with the registration form

## 2.4.0
* Improves support for Google Analytics actions
* Fixes a filter configuration on the list of trainers

## 2.3.1
* Fixes a price output for some locales

## 2.3.0
* Adds support for Norwegian language
* Fixes the rendering of italic, bold, <sub> and <sup> text
* G+ is removed from social sharing

## 2.2.4
* Fixes a bug with an incorrect country code sent to Workshop Butler. As a result, the countries of attendees were not saved correctly

## 2.2.3
* Fixes an incorrect array initialisation for PHP version < 5

## 2.2.2
* Fixes a bug preventing attendee registration when billing and/or work addresses are set as required

## 2.2.1

* Rendering of [custom fields](https://support.workshopbutler.com/article/46-how-to-add-a-new-custom-field) was fixed. Before labels for custom fields were not shown


## 2.2.0
This release radically improves the usability of all themes for mobile devices and adds support for
Trainers' column in the [Schedule](shortcodes/schedule-template.md).

### New

* New column for a [Schedule](shortcodes/schedule-template.md) in a Table view - trainers

### Improved

* All themes support mobile screens. Now your workshops are more accessible than ever
* The URLs for [trainer's profile](shortcodes/trainer-profile-template.md) have a form `id=[id]&name=[trainer name]`

### Changed / Removed
* Columns in a Table view got new classes to support more flexible table configurations

## 2.1.0
* Adds support for WordPress 5.0
* Adds new shortcode [wsb_trainer_name]
* Improves the behaviour for external event pages – the links open in new tabs.

## 2.0.0 
* Support for several languages out of the box
* Several new widgets: registration page, configurable sidebar widget, list of endorsements
* Various options to configure the look of each widget
* Support for several event schedules 
 
## 1.3.0
**Initial release of the plugin**

* Support for custom styles and themes
* Support for editable page templates
* Works with five default themes
* Basic configuration options
