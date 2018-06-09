# Shortcodes

A shortcode is a WordPress-specific code that lets you do nifty things with very little effort.
Shortcodes can embed files or create objects that would normally require lots of complicated,
ugly code in just one line. Workshop Butler plugin uses them to help you
change the layout of the pages easily.

!!! info
    If you are not familiar with the shortcodes, we recommend to read [this article](https://codex.wordpress.org/shortcode) first.

## Types of shortcodes
There are two types of shortcodes: page level and template level shortcodes.

**Page level** shortcodes are used to render the content of a whole page. For example,
`[wsb_schedule]` renders an event schedule. You add the shortcodes of this type
to the body of WordPress page.

The shortcodes of **template level** define where and how the elements are shown
on a page. For example, a trainer's photo or a registration button.

## Templates
The templates define the layout of any page (Schedule, Event, Trainer List, Trainer Profile).
You need to use **Template level** shortcodes to modify them.

* [Schedule Template](shortcodes/schedule-template.md) shortcodes
* [Event Template](shortcodes/event-template.md) shortcodes
* [Trainer List Template](shortcodes/trainer-list-template.md) shortcodes
* [Trainer Profile Template](shortcodes/trainer-profile-template.md) shortcodes

## Updating the templates
To change the template, follow the steps below:

1. Go to Workshop Butler plugin settings in WordPress
2. Open **Pages** tab and select the page for editing
3. Make the changes and click **Save**
