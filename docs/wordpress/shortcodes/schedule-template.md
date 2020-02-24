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

!!! danger
    This attributes works only for [Table](https://support.workshopbutler.com/articles/configuring-the-wordpress-plugin/) layout
    of the schedule

* **cols**, *string*. Names of columns with data, separated by comma (,). Must be used together with other shortcodes,
like `[wsb_schedule_title]` or `[wsb_schedule_location]`. The valid names are `schedule`, `location`, `title`, `register`, `trainers`.
The order of the names matters.  

The attribute `cols` defines how the header of the table with workshops is generated. If you set it to `location`, only
one column with the caption *Where* is added. As a result, you must align the headers with related shortcodes.  

## wsb_schedule_title

Shows an event's title

## wsb_schedule_image

Shows an event's cover image (thumbnail)

### Attributes

* **without_url**, *boolean*. When true, the link to the image is not added.
* **width**, *int*. The width of the image. Default - 300.
* **height**, *int*. The height of the image. Default - 200. 

## wsb_schedule_schedule

Shows the start/end dates and time of event

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
