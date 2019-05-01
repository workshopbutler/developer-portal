# API Reference

The Workshop Butler API provides a set of methods to integrate
accounts of knowledge brands and independent trainers with their websites
to show scheduled events and licensed trainers, accept registrations and
evaluations.

Our API has predictable, resource-oriented URLs, and uses HTTP response
codes to indicate API errors. We use built-in HTTP features,
like HTTP authentication and HTTP verbs, which are understood by
off-the-shelf HTTP clients.

JSON is returned by all API responses, including errors.
All input should be sent in JSON format.

> Workshop Butler API provides only a limited functionality, and cannot be
> considered as a full-scaled REST API for Workshop Butler platform.

## Authentication

API requests require an API key. This key is unique for your account. Do not share your secret API keys in publicly
accessible areas such GitHub, client-side code, and so forth.

All API requests must be made over HTTPS. API requests without authentication will also fail.

There are two ways you can pass API key. The first one is as
GET query parameter.

**GET Query parameter**

````http
curl 'https://api.workshopbutler.com/facilitators?api_key=YOUR_KEY'
````

The second option is HTTP header.

**HTTP Header**

````http
curl -H 'X-Api-Key: YOUR_KEY' 'https://api.workshopbutler.com/facilitators'
````

### API Keys
The API supports all types of accounts, available in Workshop Butler: knowledge brand, training company and trainer. Each type of accounts has its own key pattern.

API keys for knowledge brand accounts has `ppk_` prefix. API keys for trainers are shorter
and starts with `tpk_`. Training companies have prefix `cpk_`.

To acquire the key:

- for a knowledge brand and a training company, open **API** tab in **Account Settings**
- for a trainer, open **Website Integration** tab in **Account Settings**.

## Errors
Workshop Butler uses HTTP response codes to report about an error. Any response with
4xx or 5xx is an error and should be handled appropriately.

All errors are in JSON format. Each error contains two required attributes: `code` and `message`.
`code` has an internal numeric identifier of the error. `message` gives you a better understanding
why the error occurred. Some errors may have additional attribute `info` which contains
a detailed description of the error.  

The example of an ordinary API error is below:

```json
{
  "code": 404,
  "message": "Not Found",
  "info": "The event with id=405 is not found"
}
```  

## Registration Forms

Workshop Butler allows users to configure what information they want to collect
during the registration. The users can add new fields of several different types,
make fields optional or required, and add fill-in instructions for the forms.

As a result, a set of attendee attributes, passed to the system through API for
successful registration, can differ from event to event. You can hard-code
a predefined set of fields on a registration form but you will limit a user's
ability to tweak the system for their needs.

This section explains how to implement registration forms correctly.

### Rendering a Form

When you request an [event](#events-events-get), the response contains two attributes,
related to the look of the form:

- `instructions`
- `registration_form`

The former one is a text with some instructions from the user to visitors on how
to fill-in the form. For example,

- *Add your food preferences to the comment*
- *Please, describe what your main goal for joining a workshop is*

The latter one is an array with sections and fields, the user expects visitors to fill in.
Each section has a name and one or several fields it contains.

The sections and the fields are ordered the way a user wants. Try not to change
the order if there are no other requirements from your users.

For example, this is a simplified form structure:

````json
[{
   "name": "Personal Info",
   "fields": [
     ...
   ]
 },{
   "name": "Billing Address",
   "fields": [
     ...
   ]
 }]
````

Based on it, you can create a form like:

````HTML
<form>
  <fieldset>
    <legend>Personal Info</legend>
    <p>
      <input ....>
    </p>
  </fieldset>
  <fieldset>
    <legend>Billing Address</legend>
    <p>
      <input ....>
    </p>
  </fieldset>
</form>
````

### Rendering Fields
Each field has four attributes: `name`, `type`, `required` and `label`. `select`
field contains one more attribute with the list of options.

````json
{
  "name": "first_name",
  "type": "text",
  "required": true,
  "label": "First Name"
}
````

From this JSON you may create a code similar to:

````HTML
<label for="first_name" class="required">
  First Name
  <input type="text" name="first_name"/>
</label>
````

`name` is an unique field name which is passed to [through API](#attendees-attendee-list-post-1)
along with a field's value. Using the `name`, Workshop Butler maps the passed
parameters to relevant attendee's attributes.

!!! warning
    It is up to you to check if a visitor fills in the fields with `required=true`.
    The system returns an error if one or several required fields are empty.  


There are 8 field types:

Type | Description
----:| ----
text | Basic input field, ````HTML <input type="text" ..>````
checkbox | Checkbox with true/false value, ````HTML <input type="checkbox" ...>````
select | Select field, ````HTML <select name=""><option>... </select>````
date | Date in format YYYY-MM-DD, ````HTML <input type="date" ...>````
textarea | Large text input, ````HTML <textarea ....>````
email | Email, ````HTML <input type="email" ...>````
country | List of countries to select from. A passed value for this field should be an ISO 8166-2 country code (**de**, **RU**).
ticket | A selector with available ticket types. The ticket types are in `paid_ticket_types` attribute.

Workshop Butler gives you plenty of information to render a beautiful yet
fully functional dynamic registration form.

## Attendee
An attendee represents a person participating in an event. It is created when
a new person registers for an event, or is added manually from the cabinet.


### The attendee object
| Name | Type | Description | Example |
|-|-|-|-|
| **id** | positive number | Unique identifier for the object | `5`|
| **first_name** | string | First name of the attendee | `Anna` |
| **last_name** | string | Last name of the attendee | `Brick` |
| **date_of_birth** | optional string | Date of birth in YYYY-mm-DD format | `1983-04-05` |
| **email** | string | Email of the attendee | `anna.brick@workshopbutler.com`|
| **country** | optional string | Home country, ISO 8166-2 2-letters country code |  `DE` |
| **city** | optional string | Home city | `Berlin` |
| **street_1** | optional string | Home street 1 ||
| **street_2** | optional string | Home street 2 ||
| **postcode** | optional string | Home postcode ||
| **province** | optional string | Home province or state ||
| **organisation** | optional string | Name of the company | `Bug Cleaner Ltd.` |
| **work_address** |  optional [address object](#the-address-object) | Work address of the attendee | |
| **billing_address** |  optional [address object](#the-address-object) | Billing address, used for invoicing | |
| **tax_info** |  optional [tax info object](#the-tax-info-object) | Sales tax information: tax number and the name of sales tax, like *VAT*, *GST* | |
| **phone** |  optional string | Phone | |
| **comment** |  optional string | Comment | |
| **blog** |  optional string | The url of the attendee's blog | |
| **website** |  optional string | The url of the attendee's website | |
| **role** |  optional string | Job title of the attendee | |
| **price** | optional string | The amount with currency which the attendee paid for entering the event | `EUR 100` |


### Important Info

There are two ways to create an attendee. The difference is in how Workshop Butler
reacts to it.

When you [create a new attendee](#attendees-attendee-list-post), the system:

1. adds a new attendee object
2. sets the attendee's `participated` attributes to `true`

When you [register a new attendee](#attendees-attendee-list-post-1), the system:

1. checks if a selected ticket is available
1. adds a new attendee object
1. triggers `New Attendee` event.

Getting `New Attendee` event the system:

- sends a welcome email to the attendee's email address.
- sends a notification to team members about new registration.

While integrating your website with Workshop Butler, prefer to use [`register`](#attendees-attendee-list-post-1) action
for a registration form. Use [`create`](#attendees-attendee-list-post) action only on an evaluation form, when you know
for sure the attendee has participated.

### Create an attendee

Adds a new attendee to the system without additional checks and without triggering
`New Attendee` event.

On success, the system returns `201` response code. On failure, the system returns:

- `403` response code when the account does not have an access to the event and cannot add a new attendee to it;
- `422` response code when the request has invalid data and cannot be processed

--8<-- "attendee-args.md"

**Definition**

`POST https://api.workshopbutler.com/attendees`    

--8<-- "attendee-http.md"

### Register an attendee

Adds a new attendee to the system after a ticket check, and triggers `New Attendee`
event.

!!! note
    You should prefer this action to [`create`](#create-an-attendee). For more details, read [Important info](#important-info).

On success, the system returns `201` response code. On failure, the system returns:

- `403` response code when the account does not have an access to the event and cannot add a new attendee to it;
- `422` response code when the request has invalid data and cannot be processed

--8<-- "attendee-args.md"

**Definition**

`POST https://api.workshopbutler.com/attendees/register`    

--8<-- "attendee-http.md"

## Evaluation

This object represents a feedback provided by attendee to a trainer. It consists of the answers to 10 questions.

### The evaluation object

| Name | Type | Description |
|-|-|-|
| **id** | positive number | Unique identifier for the object |
| **event_id** | positive number | Unique identifier for the event, the evaluation belongs to |
| **attendee_id** | positive number | Unique identifier for the attendee, the evaluation was given by |
| **reason_to_register** | optional string | The reason the attendee registered for the event |
| **facilitator_impression** | number in range [0, 10] | The impression, the trainer (-s) made to the attendee. It's used to calculate a trainer's rating |
| **facilitator_review** | string | The feedback to the trainer(-s). It can be later converted to an endorsement. |
| **changes_to_event** | string | Answer to a question "What can the trainer improve in the next event?" |
| **content_impression** | number in range [0, 10] | The attendee's impression from the content |
| **changes_to_content** | string | Answer to a question "How can the trainer improve the content?" |
| **host_impression** | optional number in range [0, 10] | The attendee's impression of the organisational stuff |
| **changes_to_host** | optional string | Answer to a question "How can the organiser improve next time?" |
| **action_items** | string | Answer to a question "What action items did you take from the event?" |
| **recommendation_score** | number in range [0, 100] | Shows how likely the attendee is ready to recommend the event to others, in percents |

### Create an evaluation  

Adds a new evaluation to the platform and informs a trainer (or trainers) about it via email

!!! warning
    This method is available only for knowledge brand and training company accounts. The owners of trainer accounts will get `403 Forbidden` response.

**Arguments**

| Name | Type | Description |
|-|-|-|
| **event_id**  | ==required== | ID of the event |
| **attendee_id**  | ==required== | ID of the attendee |
| **reason_to_register** | ==required== | The reason the attendee registered for the event |
| **facilitator_impression** | ==required== | The impression, the trainer (-s) made to the attendee. It's used to calculate a trainer's rating |
| **facilitator_review** | ==required== | The feedback to the trainer(-s). It can be later converted to an endorsement. |
| **changes_to_event** | ==required== | Answer to a question "What can the trainer improve in the next event?" |
| **content_impression** | optional | The attendee's impression from the content |
| **changes_to_content** | optional | Answer to a question "How can the trainer improve the content?" |
| **host_impression** | optional | The attendee's impression of the organisational stuff |
| **changes_to_host** | optional | Answer to a question "How can the organiser improve next time?" |
| **action_items** | ==required== | Answer to a question "What action items did you take from the event?" |
| **recommendation_score** | ==required== | Shows how likely the attendee is ready to recommend the event to others, in percents |

**Definition**

`POST https://api.workshopbutler.com/evaluations`    

??? example "Response 201"

    ```json
    {
      "evaluation_id": 4302
    }
    ```

??? example "Response 403"

    ```json
    {
      "code": 403,
      "message": "Forbidden Request"
    }
    ```

??? example "Response 409"

    ```json
    {
      "code": 403,
      "message": "An evaluation for the attendee exists. Only one evaluation per attendee per event is allowed"
    }
    ```

??? example "Response 422"

    ```JSON
    {
      "code": 422,
      "message": "Validation failed",
      "info": {
        "event_id": "This parameter is required"
      }
    }
    ```

### List all evaluations

Returns the list of all your evaluations. The evaluations are returned sorted by creation date, with the most recent evaluations appearing last.

!!! warning
    This method is available only for trainer's accounts. The owners of knowledge brand and training company accounts will get `403 Forbidden` response.

**URI Parameters**

| Name | Type | Default | Description |
|-|-|-|-|
| **sort** | optional string | `+created` | The name of the sort field, and the order (+ for asc, - for desc). Available options are `+created`, `-created`.

**Definition**

`GET https://api.workshopbutler.com/evaluations`

??? example "Response 200"

    ```JSON
    [
      {
        "event": {
          "id": 123,
          "title": "Hello, world!"
        },
        "attendee": {
          "id": 1,
          "first_name": "Hello, world!",
          "last_name": "Hello, world!",
          "email": "Hello, world!"
        },
        "id": 1,
        "question_1": {
          "question": "Hello, world!",
          "answer": "Hello, world!"
        },
        "question_2": {
          "question": "Hello, world!",
          "answer": "Hello, world!"
        },
        "question_3": {
          "question": "Hello, world!",
          "answer": "Hello, world!"
        },
        "question_4": {
          "question": "Hello, world!",
          "answer": "Hello, world!"
        },
        "question_5": {
          "question": "Hello, world!",
          "answer": "Hello, world!"
        },
        "question_6": {
          "question": "Hello, world!",
          "answer": "Hello, world!"
        },
        "question_7": {
          "question": "Hello, world!",
          "answer": "Hello, world!"
        },
        "question_8": {
          "question": "Hello, world!",
          "answer": "Hello, world!"
        },
        "question_9": {
          "question": "Hello, world!",
          "answer": "Hello, world!"
        },
        "question_10": {
          "question": "Hello, world!",
          "answer": "Hello, world!"
        }
      }
    ]
    ```

## Event

This object represents an event (or workshop) run by one or several trainers. [Attendees](#attendee)
can participate in an event and provide [evaluations](#evaluation).

### The event object

| Name | Type | Description |
|-|-|-|
| **id** | positive number | Unique identifier for the object |
| **hashed_id** | string | Unique identifier for the object |
| **title** | string | The event's title |
| **spoken_languages** | list in a string form, with elements separated by comma (',') | List of languages, separated by comma (','). |
| **start** | string | Start date of the event, in YYYY-MM-DD form. ==Deprecated since [2018-06-28](changelog.md#2018-06-28). Use **schedule**== |
| **end** | string | End date of the event, in YYYY-MM-DD form. ==Deprecated since [2018-06-28](changelog.md#2018-06-28). Use **schedule**== |
| **hours_per_day** | number | Number of hours per day. In most cases, it equals to zero. ==Deprecated since [2018-06-28](changelog.md#2018-06-28). Use **schedule**==|
| **total_hours** | number | The length of the event in hours. ==Deprecated since [2018-06-28](changelog.md#2018-06-28). Use **schedule**== |
| **schedule** | [schedule object](#the-schedule-object) | Event's schedule (start/end dates and times, timezone, lenght, etc.) |
| **location** | [location object](#the-location-object) | Location and timezone |
| **photo** | optional url | Link to the trainer's photo |
| **city** | string | Name of the city of the event. ==Deprecated since [2018-06-28](changelog.md#2018-06-28). Use **location**== |
| **country** | string | ISO 8166-2 2-letters country code. ==Deprecated since [2018-06-28](changelog.md#2018-06-28). Use **location**== |
| **rating** | number | The rating of the event. An average of [`facilitator_impression`](#the-evaluation-object) |
| **confirmed** | boolean | True if the event is confirmed and definitely will take place |
| **free** | boolean | True if the event is free |
| **online** | boolean | True if the event is online. ==Deprecated since [2018-06-28](changelog.md#2018-06-28). Use **location**== |
| **facilitators** | array of [trainer objects](#the-trainer-object) | Trainers, running the event |
| **cover_image** | [image object](#the-image-object) | Contains information about a cover image. If the image is not uploaded, all parameters are `null` | 

### List all events

Returns the list of your events.

The output depends on `fields` parameters. If `fields` parameter is missing,
then a default set of event attributes is returned.

**URI Parameters**

| Name | Type | Default | Description |
|-|-|-|-|
| future | optional boolean | null | If true, only future events in the list. If false, only past events in the list. |
| public | optional boolean | null | If true, only public events in the list. If false, only private events int he list. |
| archived | optional boolean | false | If true, only archived events in the list. If false, only active events in the list |
| countryCode | optional string | null | ISO 8166-2 country code. If set, only events from this country in the list. |
| eventType | optional number | null | Unique identifier of an event type. If set, only events with this type in the list. |
| categoryId | optional number | null | Unique identifier of a category. If set, only events of this category in the list. |
| trainerId | optional number | null | If set, only the events ran by a trainer with `id=[trainerId]` are returned |
| confirmed | optional boolean | null | If set, events are filtered by their confirmation state |
| widgetId | optional string | null | ==DEPRECATED==. ID of the website widget, created by a trainer |
| fields | optional list in a string form, with elements separated by comma (',') | null | The output contains only the defined fields. For example, `title,city` |
| expand | optional list in a string form, with elements separated by comma (',') | null | Can expand selected objects. For now the only supported value is `category` |

**Definition**

`GET https://api.workshopbutler.com/events`

??? example "Response 200"

    ```json
      [{
        "id" : 193,
        "title" : "Management 3.0 two day course",
        "type" : {
          "id": 1,
          "name": "Standard 2-days Course"
        },
        "spoken_languages" : [ "German" ],
        "start" : "2011-11-24",
        "end" : "2011-11-25",
        "hours_per_day" : 8,
        "total_hours" : 16,
        "facilitators" : [ {
          "id" : 31,
          "first_name" : "Mischa",
          "last_name" : "Ramseyer",
          "photo" : null,
          "country" : "CH",
          "rating": null
        } ],
        "city" : "Zürich",
        "country" : "CH",
        "rating" : 8.0,
        "confirmed" : true,
        "free" : false,
        "online" : false
      }, {
        "id" : 270,
        "title" : "Management 3.0 two day course",
        "type" : {
          "id": 1,
          "name": "Standard 2-days Course"
        },
        "spoken_languages" : [ "French" ],
        "start" : "2012-03-22",
        "end" : "2012-03-23",
        "hours_per_day" : 8,
        "total_hours" : 16,
        "facilitators" : [ {
          "id" : 36,
          "first_name" : "François",
          "last_name" : "Beauregard",
          "photo" : null,
          "country" : "CA",
          "rating": null
        } ],
        "city" : "Montréal",
        "country" : "CA",
        "rating" : 5.65,
        "confirmed" : false,
        "free" : true,
        "online" : false
      }]
    ```

### Get an event

Return a detailed info about an event

**URI Parameters**

| Name | Type | Default | Description |
|-|-|-|-|
| id | ==required== | string or number | Unique identifier of the event |
| fields | optional list in a string form, with elements separated by comma (',') | null | The output contains only the defined fields. For example, `title,city` |

**Definition**

`GET https://api.workshopbutler.com/events/{id}`

??? example "Response 200"

    ```json
    {
      "id": 1234,
      "title": "Management 3.0 - Curso de 2 días",
      "type": {
        "id": 1,
        "name": "Standard 2-days Course"
      },
      "description": "Curso Oficial Management 3.0 en Castellano",
      "spoken_languages": [
        "Spanish"
      ],
      "materials_language": "English",
      "additional_info": "precios Early Bird hasta el 31 de ....",
      "start": "2013-02-04",
      "end": "2013-02-05",
      "hours_per_day": 8,
      "total_hours": 16,
      "facilitators": [
        {
          "id": 76,
          "first_name": "Angel",
          "last_name": "Medinilla",
          "photo": "https://secure.gravatar.com/avatar/bfe39d10318bb80b9efe49c72065c548?s=300",
          "country": "ES",
          "rating": 9.55
        }
      ],
      "city": "Barcelona",
      "country": "ES",
      "website": "http://www.proyectalis.com/2012/12/10/semana-de-formacion-barcelona-2013/",
      "registration_page": "http://www.proyectalis.com/2012/12/10/semana-de-formacion-barcelona-2013/",
      "rating": 5.5,
      "confirmed": true,
      "free": true,
      "online": false
    }
    ```


## Trainer

### The trainer object

| Name | Type | Description |
|-|-|-|
| **id** | positive number | Unique identifier for the object |
| **first_name** | string | First name of the trainer |
| **last_name** | string | Last name of the trainer |
| **email_address** | string | Email of the trainer |
| **photo** | optional url | Link to the trainer's photo |
| **address** |  [address object](#the-address-object) | Trainer's address |
| **bio** | optional string | Trainer's bio in HTML |
| **interests** | optional string | Trainer's interests in HTML |
| **twitter_handle** | optional string | Twitter ID, e.g. `skotlov` |
| **facebook_url** | optional string | Link to a Facebook profile |
| **linkedin_url** | optional string | Link to a LinkedIn profile |
| **google_plus_url** | optional string | Link to a G+ profile |
| **website** | optional string | Link to a trainer's website |
| **blog** | optional string | Link to a trainer's blog |
| **active** | boolean | False if the trainer is not active |
| **organisations** | array of [organisation objects](#the-organisation-object) | List of the organisations, the trainer is member of |
| **endorsements** | array of [endorsement objects](#the-endorsement-object) | List of the endorsements, received by the trainer | **materials** | array of [material objects](#the-material-object) | List of materials, the trainer want to promote (like articles, videos, etc.) |
| **years_of_experience** | number | The number of years the trainer holds a knowledge brand's license. This number is `0` for training companies and individual trainers |
| **number_of_events** | number | The number of past confirmed events the trainer has |
| **rating** | number | Rating for public events. An average of [`facilitator_impression`](#the-evaluation-object) |
| **statistics** | [statistics object](#the-trainer-statistics-object) | Statistics of the trainer |
| **badges** | array of [badge objects](#the-badge-object) | Badges, assigned to the trainer |

### List all trainers

Returns the list of all trainers for the account. The trainers are returned sorted by name.

The content of the list depends on the type of account:

- for knowledge brands, it contains all active trainers/facilitators
- for training companies, it contains all active trainers, both employees and external trainers
- for individual trainers, it contains the only record of the trainer himself

**URI Parameters**

| Name | Type | Default | Description |
|-|-|-|-|
| fields | optional list in a string form, with elements separated by comma (',') | null | The output contains only the defined fields. For example, `first_name,email_address` |

**Definition**

`GET https://api.workshopbutler.com/facilitators`

??? example "Response 200"

    ```json
      [ {
        "id" : 12,
        "first_name" : "Nick",
        "last_name" : "Doom",
        "photo" : null,
        "country" : "GB",
        "languages" : [ "English" ],
        "countries" : [ "GB" ],
        "rating" : 6.416666984558105,
        "badges" : [ {
          "name" : "Certificate of Attendance",
          "url" : "https://d2ttjh3tmuazph.cloudfront.net/badges/3761a40b388780d62d73abb88896cef671c981c1.jpg"
        }, {
          "name" : "Certificate of Knowledge",
          "url" : "https://d2ttjh3tmuazph.cloudfront.net/badges/e473d0a30a730c33a2f41a47d178c57c9963e8b5.jpg"
        }, {
          "name" : "Change For Happiness",
          "url" : "https://d2ttjh3tmuazph.cloudfront.net/badges/ca751785ba194f43d7b19afa8226008e332f1976.jpg"
        } ]
      }, {
        "id" : 14,
        "first_name" : "Alejandra",
        "last_name" : "Dojo",
        "photo" : null,
        "country" : "ES",
        "languages" : [ "Spanish" ],
        "countries" : [ "ES", "CO" ],
        "rating" : 8.321,
        "badges" : [ ]
      }]
    ```

### Get a trainer

Return a detailed info about a trainer

**URI Parameters**

| Name | Type | Default | Description |
|-|-|-|-|
| id | ==required== | string or number | Unique identifier of the trainer |

**Definition**

`GET https://api.workshopbutler.com/facilitator/{id}`

??? example "Response 200"

    ```json
    {
        "id" : 25,
        "first_name" : "Sergey",
        "last_name" : "Kotlov",
        "email_address" : "skotlov@gmail.com",
        "image" : "https://secure.gravatar.com/avatar/996e4a0e5366080a444e43a4b446fcf6?s=300",
        "address" : {
            "street_1" : "3 Kotelnikova alley 75",
            "street_2" : null,
            "city" : "Saint-Petersburg",
            "post_code" : "197341",
            "province" : "----",
            "country" : "RU"
        },
        "bio" : "blabla",
        "interests" : null,
        "twitter_handle" : "skotlov",
        "facebook_url" : null,
        "linkedin_url" : null,
        "google_plus_url" : null,
        "website" : "http://changegeek.ru",
        "blog" : "http://changegeek.ru",
        "active" : true,
        "organisations" : [ {
            "id" : "24",
            "name" : "Happy Melly One BV",
            "city" : "Rotterdam",
            "country" : "NL",
            "website" : null
        } ],
        "endorsements" : [ {
            "content" : "I was impressed by his passion",
            "name" : "Sergey Kotlov",
            "company" : "Happy Melly"
        } ],
        "materials" : [ {
            "type" : "article",
            "link" : "http://mail.ru"
        }, {
            "type" : "video",
            "link" : "http://hithat.com"
        }, {
            "type" : "casestudy",
            "link" : "http://hithat.com"
        } ],
        "years_of_experience" -> 3,
        "number_of_events" -> 65,
        "rating": 0.0,
        "statistics": {
          "public_rating": 4.56,
          "private_rating": 4.56,
          "public_median": 7,
          "private_rating": 6,
          "public_nps": 45.5,
          "private_nps": 56.7,
          "number_of_public_evaluations": 57,
          "number_of_private_evaluations": 156
        },
        "badges" : [ {
            "name" : "Yay4Monday",
            "url" : "https://d2ttjh3tmuazph.cloudfront.net/badges/aae9390445ddb5e3935f8a2f0cd1eb5388f21619.jpg"
        }, {
            "name" : "Conference Talk",
            "url" : "https://d2ttjh3tmuazph.cloudfront.net/badges/7281fe689afb695f0c1f84baaf0af18e1460514a.jpg"
        } ]
    }
    ```


## Supportive Objects

### The address object

| Name | Type | Description | Example |
|-|-|-|-|
| **country** | string | Home country, ISO 8166-2 2-letters country code |  `DE` |
| **city** | optional string | Home city | `Berlin` |
| **street_1** | optional string | Home street 1 ||
| **street_2** | optional string | Home street 2 ||
| **postcode** | optional string | Home postcode ||
| **province** | optional string | Home province or state ||

### The badge object

| Name | Type | Description |
|-|-|-|
| **name** | string | Name of the badge |
| **url** | string | Link to the badge's image |

### The endorsement object

| Name | Type | Description |
|-|-|-|
| **name** | string | Name of the attendee, who provided the endorsement |
| **content** | string | The endorsement itself |
| **company** | optional string | Name of the company and/or the role of the attendee |
| **rating** | optional number | The impression, given by the attendee. The rating is `null` if the endorsement was added manually |

### The image object

| Name | Type | Description |
|-|-|-|
| **url** | optional string | URL to a full image |
| **thumbnail** | optional string | URL to a thumbnail (300x200 px) of the full image | 

### The location object 

| Name | Type | Description |
|-|-|-|
| **city** | optional string | Name of the city of the event. The city is `null`, if `online = true`. Otherwise it is a non empty string. |
| **country_code** | optional string | ISO 8166-2 2-letters country code. The country code is `null`, if `online = true`. Otherwise it is a non empty string.  |
| **online** | boolean | True when the event is online | 


### The material object

| Name | Type | Description |
|-|-|-|
| **type** | string | Type of the material. Available options are `article`, `video`, `link` |
| **link** | string | Link to the material |

### The organisation object

| Name | Type | Description |
|-|-|-|
| **name** | string | Name of the organisation |
| **country** | string | Home country, ISO 8166-2 2-letters country code |
| **city** | optional string | Home city |
| **website** | optional string | An organisation's website |

### The schedule object
| Name | Type | Description |
|-|-|-|
| **start** | string | Start date and time of the event, in YYYY-MM-DD HH:mm form |
| **end** | string | End date and time of the event, in YYYY-MM-DD HH:mm form |
| **hours_per_day** | number | Number of hours per day. In most cases, it equals to zero. |
| **total_hours** | number | The length of the event in hours |
| **timezone** | optional string | Timezone id. When timezone is null, the time parts (hours and minutes) in **start** and **end** are not valid and must not be rendered |

!!! info
    Only new or updated events have times and timezones. Empty timezone means that a trainer has not updated an event yet so the start and end times in **start**
    and **end** attributes are fake.


### The tax info object

| Name | Type | Description | Example |
|-|-|-|-|
| **vat_name** | optional string | Name of the sales tax, like *VAT*, *GST*, etc. | `VAT` |
| **vat_number** | string | Sales tax number | |


### The trainer statistics object

| Name | Type | Description |
|-|-|-|
| **public_number_of_evaluations** | number | Number of evaluations, provided by attendees to a trainer, for public events |
| **public_rating** | number | Trainer's rating. An average of [`facilitator_impression`](#the-evaluation-object) |
| **public_median** | number | Median of [`facilitator_impression`](#the-evaluation-object) |
| **public_nps** | number | Net Promotion Score, calculated based on [`recommendation_score`](#the-evaluation-object) |
| **public_impressions** | map of numbers | The number of impressions given by attendees, grouped by their values |
| **private_number_of_evaluations** | number | Number of evaluations, provided by attendees to a trainer, for private events |
| **private_rating** | number | Trainer's rating. An average of [`facilitator_impression`](#the-evaluation-object) |
| **private_median** | number | Median of [`facilitator_impression`](#the-evaluation-object) |
| **private_nps** | number | Net Promotion Score, calculated based on [`recommendation_score`](#the-evaluation-object) |
| **private_impressions** | map of numbers | The number of impressions given by attendees, grouped by their values |
| **recent_public_number_of_evaluations** | number | Number of evaluations, provided by attendees to a trainer, for public events in the last 12 months |
| **recent_public_rating** | number | Trainer's rating. An average of [`facilitator_impression`](#the-evaluation-object) |
| **recent_public_median** | number | Median of [`facilitator_impression`](#the-evaluation-object) |
| **recent_public_nps** | number | Net Promotion Score, calculated based on [`recommendation_score`](#the-evaluation-object) |
| **recent_public_impressions** | map of numbers | The number of impressions given by attendees, grouped by their values |
| **recent_private_number_of_evaluations** | number | Number of evaluations, provided by attendees to a trainer, for private events in the last 12 months |
| **recent_private_rating** | number | Trainer's rating. An average of [`facilitator_impression`](#the-evaluation-object) |
| **recent_private_median** | number | Median of [`facilitator_impression`](#the-evaluation-object) |
| **recent_private_nps** | number | Net Promotion Score, calculated based on [`recommendation_score`](#the-evaluation-object) |
| **recent_private_impressions** | map of numbers | The number of impressions given by attendees, grouped by their values |
