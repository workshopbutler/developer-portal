# Trainer Profile Template shortcode

The following shortcodes are available in the trainer profile template.

## Structure
A proposed structure for the shortcodes:

    [wsb_trainer_photo]
    [wsb_trainer_name]
    [wsb_trainer_social_link]
    [wsb_trainer_email]
    [wsb_trainer_stats]
    [wsb_trainer_badges]
    [wsb_trainer_events]
    [wsb_trainer_bio]
    [wsb_trainer_endorsements]
        [wsb_trainer_endorsement]
            [wsb_trainer_endorsement_author]
            [wsb_trainer_endorsement_rating]
            [wsb_trainer_endorsement_content]
        [/wsb_trainer_endorsement]
    [/wsb_trainer_endorsements]

## wsb_trainer_photo
Renders the photo of a trainer

## wsb_trainer_name
Renders the full name and the country of a trainer

### Attributes

* **with_country**, *boolean*, *default: true*. If true, the country of a trainer is
shown

## wsb_trainer_social_link
Renders a link to a social profile of a trainer

### Attributes

* **type**, *string*, *default: twitter*. Type of the social link. The valid values are: `twitter`, `facebook`, `linkedin`, `google-plus`, `blog`, `website`

## wsb_trainer_email
Renders a button with text **Contact by email**

## wsb_trainer_stats
Renders statistics of a trainer

### Attributes

* **type**, *string*, *default: years*. Type of the statistics to show. The valid values are:
  * **years**. Number of years a trainer has a license. This statistics makes sense only for knowledge brands.
  * **events**. Number of past confirmed events.
  * **public-rating**. Rating for public events.
  * **private-rating**. Rating for private events.

## wsb_trainer_badges
Renders the badges, assigned to a trainer

## wsb_trainer_events
Renders future or past events run by a trainer

### Attributes

* **future**, *boolean*, *default: true*. If false, the past events of a trainer are shown

## wsb_trainer_bio
Renders the bio of a trainer

!!! note
    The bio is not rendered if it is empty

## wsb_trainer_endorsements
Renders the block of endorsements. If a trainer has no endorsements, the block is not rendered.

## wsb_trainer_endorsement
Renders an endorsement.

## wsb_trainer_endorsement_author
Renders the name and the position of a person who left the endorsement

## wsb_trainer_endorsement_rating
Renders the rating of the endorsement. The rating can be empty if the endorsement was added manually
by a trainer, and not provided by an attendee via Workshop Butler evaluation form.

## wsb_trainer_endorsement_content
Renders the content of the endorsement
