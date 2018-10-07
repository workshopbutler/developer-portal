# Workshop Butler WordPress Plugin

!!! danger
    The plugin is on the review by a WorkPress team and is not available on WordPress.org yet. If you want to use it, please, send a request to support@workshopbutler.com

!!! info
    Current version: 2.0.0  

    Repository: [https://github.com/workshopbutler/wordpress-plugin](https://github.com/workshopbutler/wordpress-plugin)

Our plugin for WordPress contains several page templates and a number of
shortcodes to make an integration easy. On top of that, if the shortcodes are
not enough, you can completely redesign each page using [Twig](https://twig.symfony.com/) templates.

## Getting Started

1. Follow [these instructions](https://support.workshopbutler.com/articles/installing-the-wordpress-plugin/)
to install the plugin
1. Generate [an API key](../index.md)
1. [Configure](https://support.workshopbutler.com/articles/configuring-the-wordpress-plugin/) the plugin
1. Now you are ready to customise it further. You have three options:
    1. Change the style
    1. Change the layout using shortcodes
    1. Change the layout using Twig

## Side Effects
During the activation, the plugin adds four pages:

* Schedule (/schedule) contains the event schedule
* Event (/schedule/event) hosts the detailed information of each event
* Trainer List (/trainers, containing the list of all trainers
* Trainer (/trainers/profile) for the trainer profiles

If you want to change these pages, read [Change Default Pages for the WordPress Plugin](https://support.workshopbutler.com/articles/change-default-pages-for-the-wordpress-plugin/).

No other additional entities or objects are created.

## How It Works
The plugin makes a request to [Workshop Butler API](https://support.workshopbuter.com/api) each time
a visitor opens a page. As soon as you add a new workshop or trainer to your account,
they appear on your website. There is no need for additional synchronisation.

This comes at the expense of non-user-friendly URLs to specific events and trainer profiles. For example,
`https://yourwebsite.com/trainers/profile?id=329&name=alfred-butler` or `https://yourwebsite.com/schedule/event?id=4ljsyhf&title=facilitation-workshop-in-london-uk-29-30-may-2018`.

`name` and `title` parameters are not required and here only for improving search results.

## Report a bug / Request a feature / Have a question
Here is our public repository on Github. [Open an issue](https://github.com/workshopbutler/wordpress-plugin) there.
