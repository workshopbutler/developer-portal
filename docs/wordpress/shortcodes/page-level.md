# Page Level Shortcodes

You can add the following shortcodes in a post or a page.

## wsb_schedule

This shortcode should be added to a post or a page as a placeholder for the event schedule.
Check [Schedule Template shortcodes](schedule-template.md) for the list of available shortcodes.

### Usage
You can use several schedules if needed. By default, the content and settings of these schedules are taken from 
the plugin settings. However, you can overcome them by providing your own. 

For example, you have the main schedule for all your workshops. You want to add another schedule only for the workshops
of category **Facilitation**, on its landing page. In this case, you would need to provide the content of `[wsb_schedule]`
shortcode like this: 

    [wsb_schedule category=5 layout='table']
        [wsb_schedule_item]
            [wsb_schedule_title]
            [wsb_schedule_info]
            [wsb_schedule_register]
        [/wsb_schedule_item]
    [/wsb_schedule]


### Attributes

* **category**, *number*. Category ID to show only the events from this category
* **event_type**, *number|list of numbers, separated by commas*. Event type (or types) to show only the events from these types. Example: `1,2,3`
* **layout**, *string*. Type of layout. There are two available layouts: `table`, `tile`. When you do not set a layout, the one you configured through the settings, is used. 
* **only_featured**, *boolean*. When true, only featured events are shown on the schedule. 

## wsb_event

This shortcode should be added to a post or a page as a placeholder for the event page with
a detailed information about the event, including a registration form. Check [Event Template shortcodes](event-template.md) for the list of available shortcodes.


## wsb_trainer_list

This shortcode should be added to a post or a page as a placeholder for the list of trainers.
Check [Trainer List Template shortcodes](trainer-list-template.md) for the list of available shortcodes.

## wsb_trainer

This shortcode should be added to a post or a page as a placeholder for the event schedule. Check [Trainer Profile Template shortcodes](trainer-profile-template.md) for the list of available shortcodes.

## wsb_registration

This shortcode should be added to a post or a page as a placeholder fo the event registration form. Check [Registration Page shortcodes](registration-page.md) for the list of available shortcodes
