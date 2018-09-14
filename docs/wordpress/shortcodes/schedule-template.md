# Schedule Template shortcodes

The following shortcodes are available in the schedule template.

## Structure
A proposed structure for the shortcodes:

    [wsb_schedule_filters]
    [wsb_schedule_item]
        [wsb_schedule_title]
        [wsb_schedule_info]
        [wsb_schedule_register]
    [/wsb_schedule_item]

## wsb_schedule_filters
Represents event filters

### Attributes

* **filters**, *string*. Names of filters, separated by comma (,).
The valid filters are `trainer`, `location`, `type`, `language`

## wsb_schedule_item
Represents an event

## wsb_schedule_title

!!! danger
    This shortcode works only for [Tiles](https://support.workshopbutler.com/articles/configuring-the-wordpress-plugin/) layout
    of the schedule

Represents an event's title

## wsb_schedule_info

!!! danger
    This shortcode works only for [Tiles](https://support.workshopbutler.com/articles/configuring-the-wordpress-plugin/) layout
    of the schedule

Represents an event's details (location, dates and trainers)

## wsb_schedule_register

!!! danger
    This shortcode works only for [Tiles](https://support.workshopbutler.com/articles/configuring-the-wordpress-plugin/) layout
    of the schedule

Represents a registration button to the event
