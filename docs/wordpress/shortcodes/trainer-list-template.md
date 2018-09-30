# Trainer List Template shortcodes

The following shortcodes are available in the trainer list template.

## Structure
A proposed structure for the shortcodes:

    [wsb_trainer_list_filters]
    [wsb_trainer_list_item]
        [wsb_trainer_list_photo]
        [wsb_trainer_list_name]
        [wsb_trainer_list_country]
        [wsb_trainer_list_badges]
        [wsb_trainer_list_rating]
    [/wsb_trainer_list_item]

## wsb_trainer_list_filters
Renders trainers' filters

### Attributes

* **filters**, *string*. Names of filters, separated by comma (,).
The valid filters are `trainer`, `location`, `language`, `badge`, `rating`

## wsb_trainer_list_item
Renders a trainer

## wsb_trainer_list_photo
Renders the photo of a trainer.

## wsb_trainer_list_name
Renders the full name of a trainer

## wsb_trainer_list_country
Renders a country of origin 

## wsb_trainer_list_badges
Renders the list of badges, a trainer owns

## wsb_trainer_list_rating
Renders a rating for public events

