# Changelog
## 2.11.0
* Improves the output of event dates
* Adds `only_featured` parameter to [wsb_schedule](shortcodes/page-level.md) to show only featured workshops
* Fixes an issue with incorrect workshop dates in some border cases
* Adds two new shortcodes for [wsb_schedule](shortcodes/schedule-template.md): `wsb_schedule_date` and `wsb_schedule_time`
* Improves the output for timezone abbreviations which have no abbreviations (adds GMT before them)
* Adds failed request logging with the ability to switch it off

## 2.10.0
* Fixes an issue with non-working registration form for free events
* On the trainer's profile, the newest past events are shown, not the oldest ones
* Improves support for multiple locales

## 2.9.0 
* Adds `truncate` parameter to `wsb_schedule_title` (only for 'tile' view). By default, 60. Set to 0 or false to remove completely. ... is added when truncate is on.
* Adds `target` parameter to `wsb_event_registration_button`. By default, set to `_self`. Possible values are the same as for `target` attribute for HTML link <a>.
* Adds support for optional start/end dates in [ticket prices](https://workshopbutler.com/blog/sortable-tickets-optional-start-and-end-dates/)
* Fixes deactivation behaviour for the plugin (do not remove settings anymore)
* Adds complete settings removal when the plugin is uninstalled
* Sends a bit more statistics on each API request


## 2.8.4
Fixes a random bug when workshop ID wasn't retrieved from a query string (probably erased by WordPress)

## 2.8.3
Improves handling of secure requests for reverse-proxy website

## 2.8.2
Fixes a bug in Safari preventing card payments

## 2.8.1 
Fixes an incorrect Stripe key

## 2.8.0
Adds support for card payments (card payments must be activated in Workshop Butler)

## 2.7.6 
* Fixes the output of future/past events on a trainers's page: remove private workshops from the list
* Improves the handling of server errors during the registration process

## 2.7.5
* Fixes the output for future/past events on a trainer's page

## 2.7.4 
* Fixes a bug preventing sending a correct ticket type on multiple tickets
* Fixes a problem with promo code box not showing when the link is clicked
* Improves the look of registration form
* Fixes a bug when an external registration link did not work

## 2.7.3
Partially fixes an issue when an event page template is not updated

## 2.7.2
Fixes an issue with incomplete list of trainers and events

## 2.7.1
Fixes an issue prevented to update some classes in page templates

## 2.7.0
* Cleaner, easier-to-user registration form
* Multiple smaller UI fixes
* Adds two new configuration options for event page: a number of events in the sidebar and what events to show in the sidebar

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
