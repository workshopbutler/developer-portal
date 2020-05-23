# Schedule Template shortcodes

The following shortcodes are available in the schedule template.

## Structure
A proposed structure for the shortcodes in Tile layout:

    [wsb_schedule_filters]
    [wsb_schedule_item]
        [wsb_schedule_title]
        [wsb_schedule_schedule]
        [wsb_schedule_location]
        [wsb_schedule_trainers]
        [wsb_schedule_register]
    [/wsb_schedule_item]

A proposed structure for the shortcodes in Table layout:

    [wsb_schedule_filters]
    [wsb_schedule_item cols="schedule,location,title,register"]
        [wsb_schedule_schedule]
        [wsb_schedule_location]
        [wsb_schedule_title]
        [wsb_schedule_register]
    [/wsb_schedule_item]

## wsb_schedule_filters
Represents event filters

### Attributes

* **filters**, *string*. Names of filters, separated by comma (,).
The valid filters are `trainer`, `location`, `type`, `language`

## wsb_schedule_item
Represents an event

### Attributes

* **tags**, *string*. Defines which tags to show for events: `all` for all tags, `free` for only free events, `featured` for featured events.
* **highlight_featured**, *boolean*. When true, the schedule highlights featured events.

## wsb_schedule_title

Shows an event's title

### Attributes

* **truncate**, *boolean|int*. Maximum number of characters in the title. Adds '...' if truncation happens. When false, no truncation. Default - 60. This attribute works only for `tile` layout.   

## wsb_schedule_image

Shows an event's cover image (thumbnail)

### Attributes

* **without_url**, *boolean*. When true, the link to the image is not added.
* **width**, *int*. The width of the image. Default - 300.
* **height**, *int*. The height of the image. Default - 200. 

## wsb_schedule_schedule

Shows the start/end dates and time of event

## wsb_schedule_date

Shows the start/end dates of event

## wsb_schedule_language
Shows the languages of event, separated by comma if there are several languages. Example: `English, French`

## wsb_schedule_time

Shows the start and end time for a one-day event, and the start time for a multi-day event 

## wsb_schedule_location

Shows the location of event

## wsb_schedule_trainers

Shows the photos and names of the trainers, running an event.

### Attributes

* **trainer_name**, *boolean*. When true, the names of trainers are visible.

## wsb_schedule_register

Shows a registration button to the event

### Attributes

* **registration**, *boolean*. When true, `Register` button for each event leads directly to the registration form, not to the event page. 
