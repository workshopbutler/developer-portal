# Next event

The following shortcodes are available for `Next event` shortcode

## Shortcodes
    [wsb_next_event category="42"]
        [wsb_next_event_button]
    [/wsb_next_event]

## wsb_next_event_button
Renders a link (or button) leading to the next active event if the one is available.

### Attributes

* **target**, *string*. Defines where a registration form opens (new tab, new window, etc.). Possible values are the same as for `target` attribute for HTML link `<a>`. By default, set to `_self`. Works only for internal registration forms. 
* **registration**, *boolean*. If true, a registration button for each event leads directly to [a registration page](registration-form.md), not to [an event page](event-page.md)
* **title**, *string*. Title of the button. If empty, a default title is taken.
* **no_event_title**, *string*. Message to show when there is no event available. If empty, a default message is taken. 
