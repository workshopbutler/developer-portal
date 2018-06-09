# Trainer List Template shortcodes

The following shortcodes are available in the trainer list template.

## Structure
A proposed structure for the shortcodes:

    [wsb_trainer_list_filters]
    [wsb_trainer_list_item]
        [wsb_trainer_list_photo]
        [wsb_trainer_list_name]
    [/wsb_trainer_list_item]

## wsb_trainer_list_filters
Renders trainers' filters

### Attributes

* **filters**, *string*. Names of filters, separated by comma (,).
The valid filters are `trainer`, `location`, `language`

## wsb_trainer_list_item
Renders a trainer

## wsb_trainer_list_photo
Renders the photo of a trainer.

## wsb_trainer_list_name
Renders the full name and the country of a trainer

### Attributes

* **with_country**, *boolean*, *default: true*. If true, the country of a trainer is
shown
