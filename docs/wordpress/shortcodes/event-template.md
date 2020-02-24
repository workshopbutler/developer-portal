# Event Template shortcodes

The following shortcodes are available in the event page template.

## Structure
A proposed structure for the shortcodes:

    [wsb_event_title]
    [wsb_event_registration_button]
    [wsb_event_schedule]
    [wsb_event_location]
    [wsb_event_tickets]
    [wsb_event_events]
    [wsb_event_social_links]
    [wsb_event_description]
    [wsb_event_trainers]

## wsb_event_title
Renders a title of the event

## wsb_event_image

Shows an event's cover image

### Attributes
* **type**, *enum { thumbnail, full }*. If `thumbnail`, the thumbnail is show. If `full`, an original cover image is shown. Default - `full`.
* **width**, *int*. The width of the image. Default - 300.
* **height**, *int*. The height of the image. Default - 200. 
* **class**, *optional string*. If set, the class attribute is added to the image.


## wsb_event_registration_button
Renders a registration button for the event. When a visitor clicks on the button,
either a registration form is opened or he is transferred to another page. The behaviour
depends on the event and plugin configuration.

When the registrations are closed (no valid tickets or all of them are sold out),
the button is inactive with an appropriate message.

## wsb_event_schedule
Renders a start and end dates/times of the event

## wsb_event_location
Renders a location of the event. It usually shows a city and country except the case
when the event is online.

## wsb_event_tickets
Renders all types of tickets, either valid or not

### Attributes

* **show_expired_tickets**, *boolean*. If true, all ticket types are shown, including the one which are sold out or ended. Default is `true`.
* **show_number_of_tickets**, *boolean*. If true, the number of tickets left is shown. Default is `true`.

## wsb_event_events
Renders other upcoming events for this account

## wsb_event_social_links
Renders a block with social sharing (Twitter, LinkedIn, Facebook, G+)

## wsb_event_description
Renders an event's description

## wsb_event_trainers
Renders trainers who run the event
