# Event Template shortcodes

The following shortcodes are available in the schedule template.

## Structure
A proposed structure for the shortcodes:

    [wsb_event_title]
    [wsb_event_registration_button]
    [wsb_event_dates]
    [wsb_event_location]
    [wsb_event_tickets]
    [wsb_event_events]
    [wsb_event_social_links]
    [wsb_event_description]
    [wsb_event_trainers]
    [wsb_event_registration_form]

## wsb_event_title
Renders a title of the event

## wsb_event_registration_button
Renders a registration button for the event. When a visitor clicks on the button,
either a registration form is opened or he is transferred to another page. The behaviour
depends on the event and plugin configuration.

When the registrations are closed (no valid tickets or all of them are sold out),
the button is inactive with an appropriate message.

## wsb_event_dates
Renders a start and end dates of the event

## wsb_event_location
Renders a location of the event. It usually shows a city and country except the case
when the event is online.

## wsb_event_tickets
Renders all types of tickets, either valid or not

## wsb_event_events
Renders other upcoming events for this account

## wsb_event_social_links
Renders a block with social sharing (Twitter, LinkedIn, Facebook, G+)

## wsb_event_description
Renders an event's description

## wsb_event_trainers
Renders trainers who run the event

## wsb_event_registration_form
Renders a built-in registration form 
