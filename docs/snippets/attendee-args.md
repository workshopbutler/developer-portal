**Arguments**

!!! warning
    The optionality of the arguments depends on the configuration of [a registration form](#registration-forms) for event.
    For example, if a user makes a **phone** field required, then Workshop Butler returns `Unprocessable Entity` if a phone number is not provided.

| Name | Type | Description |
|-|-|-|
| **event_id**   | ==required== | ID of the event |
| **first_name** | ==required== | First name of the attendee |
| **last_name** | ==required== | Last name of the attendee |
| **date_of_birth** | optional | Date of birth in YYYY-mm-DD format |
| **email** | ==required== | Email of the attendee. Each event can have only one attendee with an unique email address. If a new attendee and an existing attendee have identical email addresses, then their attributes are merged. |
| **country** | optional | Home country, ISO 8166-2 2-letters country code |
| **city** | optional | Home city |
| **street_1** | optional | Home street 1 |
| **street_2** | optional | Home street 2 |
| **postcode** | optional | Home postcode |
| **province** | optional | Home province or state |
| **organisation** | optional | Name of the company |
| **work** |  optional | Work address of the attendee (see example) |
| **billing** |  optional | Billing address, used for invoicing (see example) |
| **tax_name** |  optional | The name of sales tax, like *VAT*, *GST* |
| **tax_number** | optional | Sales tax number |
| **phone** |  optional | Phone |
| **comment** |  optional | Comment |
| **blog** |  optional | The url of the attendee's blog |
| **website** |  optional | The url of the attendee's website |
| **role** |  optional | Job title of the attendee |
| **ticket** | optional | ID of the selected ticket |
