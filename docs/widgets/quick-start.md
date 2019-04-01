# Quick Start Guide

By following this step-by-step guide, you learn how to integrate your website with Workshop Butler. 
In the end, the visitors of the website will be able to browse the schedule of workshops, register to them, 
check your trainers and their profiles. Approximate time for the completion is 10-15 mins. 

!!!info
   We have [an easy-to-use click-through kit](https://workshopbutler.com/kit) to configure the widgets. We recommend
   starting wih it and come back for more detailed info later.  

## How the Widgets work
Before making the first step, let's discuss shortly how the widgets work. This knowledge helps you to understand 
better the rest of the guide. 

A widget is a piece of javascript code. It executes when a page is fully loaded. As a result, you may experience a
 very short delay between the moment the page loads, and an appropriate content (a workshop schedule or a trainer's profile) appears. 

The execution process consists of several steps:

1. A widget parses an URL and retrieves required parameters. For example, the ID of a workshop.
2. The widget sends a request to Workshop Butler to get page data
3. The widget renders the content of the page, using the data it got on the previous step. 
4. The widget inserts the rendered content on the page inside **an existing HTML element**. When this step is completed, a visitor sees the content. 
5. If the widget contains references to other widgets, it executes them as well.

With new knowledge in hands, it's time to start integrating your website with Workshop Butler.

## Step 1. Define a website structure
First, you need to decide what website pages you use for adding the widgets on. Let's say you own a website on 
`https://awesomewebsite.com/' domain, and you want to have the list of trainers with their profiles, the schedule 
of events and related registration pages. 

In this case, a recommended structure is:

* `https://awesomewebsite.com/schedule` - for the schedule of workshops
* `https://awesomewebsite.com/schedule/details` - for the details of each workshop, together with a registration form
* `https://awesomewebsite.com/trainers` - for the list of trainers
* `https://awesomewebsite.com/trainers/details` - for the profiles of the trainers

Create these pages and move on to the next step.

## Step 2. Add libraries and styles
Before any Workshop Butler widget can be configured, it should be loaded first. 
Add this code to the header (`<head></head>` section) of each page you added on the previous step:

```html
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<link href="https://use.fontawesome.com/releases/v5.0.8/css/all.css" rel="stylesheet">
<script src="https://cdn.workshopbutler.com/widgets.1.4.0.js" defer></script>
<link href="https://cdn.workshopbutler.com/styles.1.4.0.min.css" rel="stylesheet">
```


### Line by line explanation
1. Loads jQuery library. It's required for correct functioning of the widgets. **Remove the line** if your website already loads this library. Otherwise, some conflicts may arise.
2. Loads [FontAwesome](https://fontawesome.com/icons) used by Workshop Butler [default themes](../themes/index.md).
3. Loads Workshop Butler JS widgets together with page templates
4. Loads styles for [default themes](../themes/index.md)

## Step 3. Configure `Schedule` widget
Open the page where you decided to have the schedule of workshop and add this code:

```html
<script>
document.addEventListener('wsbwidgetsloaded', function () {
   const schedule = {
       type: 'Schedule',
       target: '#wsb-schedule',
       theme: 'alfred',
       eventPageUrl: 'https://awesomewebsite.com/schedule/details',
       filters: ['type', 'location', 'language', 'trainer']
   };
   const widgets = [schedule];
   const config = {
      apiKey: 'api_key',
      locale: 'en-us'
    };
    
    WorkshopButlerWidgets.launch(config, widgets);
});
</script>
```

Then insert the code `<div id="wsb-schedule"></div>` where you want the schedule to appear on the page. This HTML 
element will contain the schedule. 

The last thing to do is to replace `api_key` with [a real API key](../index.md#generating-an-api-key), and 
set `eventPageUrl` to the page, you defined on [Step 1](#step-1-define-a-website-structure).

### Important Takeaways

1. Each widget references a container via `target` parameter to insert a generated content. 
The container (in this case, `<div id="wsb-schedule"></div>`) must be present on the page. 
2. `eventPageUrl` parameter contains a path to the page with a configured [EventPage](widgets/event-page.md) widget. 
The path can be absolute or relative.
3. You can provide a locale for a widget. The first part of the locale is used to detect the language. The second part 
is used to set formats for numbers, dates and currencies. Read more about them [here](general-configs.md#locale) 


!!! info
    You find a detailed description of `Schedule` widget and its parameters [here](widgets/schedule.md)

## Step 4. Configure `EventPage` widget
Open the page where you decided to have the details of each workshop. This page will also contain a registration 
form if you use [any default theme](../themes/index.md).

```html
<script>
document.addEventListener('wsbwidgetsloaded', function () {
   const eventPage = {
        type: 'EventPage',
        target: '#wsb-event-page',
        trainers: true,
        trainerPageUrl: 'https://awesomewebsite.com/trainers/details',
        theme: 'alfred',
        widgets: [
            {
                type: 'SidebarEventList',
                hideIfEmpty: true,
                target: '#upcoming-events',
                eventPageUrl: 'https://awesomewebsite.com/schedule/details',
                length: 5,
                theme: 'alfred',
                excludeId: WorkshopButlerWidgets.getQueryParam('id')
            }
        ]
   };
   const widgets = [eventPage];
   const config = {
      apiKey: 'api_key',
      locale: 'en-us'
    };
    
    WorkshopButlerWidgets.launch(config, widgets);
});
</script>
```

Then insert the code `<div id="wsb-event-page"></div>` where you want the event details to appear on the page. 
Replace `api_key` with [a real API key](../index.md#generating-an-api-key), and set `eventPageUrl` and `trainerPageUrl` 
to the pages, you defined on [Step 1](#step-1-define-a-website-structure). 

### Important Takeaways

1. `trainerPageUrl` parameter contains a path to the page with a configured [TrainerProfile](widgets/trainer-profile.md) 
widget. The path can be absolute or relative.

!!! info
    You find a detailed description of `EventPage` widget and its parameters [here](widgets/event-page.md)

## Step 5. Configure `TrainerList` widget
Open the page where you decided to have the list of trainers and add this code:

```html
<script>
document.addEventListener('wsbwidgetsloaded', function () {
   const trainerList = {
       type: 'TrainerList',
       target: '#wsb-trainer-list',
       theme: 'alfred',
       trainerPageUrl: 'https://awesomewebsite.com/trainers/details',
       filters: ['location', 'language', 'trainer']
   };
   const widgets = [trainerList];
   const config = {
      apiKey: 'api_key',
      locale: 'en-us'
    };
    
    WorkshopButlerWidgets.launch(config, widgets);
});
</script>
```

Then insert the code `<div id="wsb-trainer-list"></div>` where you want the schedule to appear on the page. This 
HTML element will contain the schedule. 

The last thing to do is to replace `api_key` with [a real API key](../index.md#generating-an-api-key), and set 
`trainerPageUrl` to the page, you defined on [Step 1](#step-1-define-a-website-structure).

!!! info
    You find a detailed description of `TrainerList` widget and its parameters [here](widgets/trainer-list.md)

## Step 6. Configure `TrainerProfile` widget
Open the page where you decided to have the profile of each trainer. 

```html
<script>
document.addEventListener('wsbwidgetsloaded', function () {
    const trainerProfile = {
        type: 'TrainerProfile',
        target: '#wsb-trainer-profile',
        theme: 'alfred',
        widgets: [
            {
                type: 'SidebarEventList',
                hideIfEmpty: true,
                target: '#upcoming-events',
                eventPageUrl: 'https://awesomewebsite.com/schedule/details',
                length: 5,
                future: true,
                trainer: WorkshopButlerWidgets.getQueryParam('id'),
                theme: 'alfred'                    },
            {
                type: 'SidebarEventList',
                hideIfEmpty: true,
                target: '#past-events',
                eventPageUrl: 'https://awesomewebsite.com/schedule/details',
                length: 5,
                theme: 'alfred',
                future: false,
                trainer: WorkshopButlerWidgets.getQueryParam('id'),
            }
        ]
    };
    const widgets = [trainerProfile];
   const config = {
      apiKey: 'api_key',
      locale: 'en-us'
    };
    
    WorkshopButlerWidgets.launch(config, widgets);
});
</script>
```

Then insert the code `<div id="wsb-trainer-profile"></div>` where you want the event details to appear on the page.
 Replace `api_key` with [a real API key](../index.md#generating-an-api-key), and set `eventPageUrl` to the pages, 
 you defined on [Step 1](#step-1-define-a-website-structure). 

!!! info
    You find a detailed description of `TrainerProfile` widget and its parameters [here](widgets/trainer-profile.md)

## Step 7. Configure `SidebarEventList` widgets
In the previous step, there is a section which may be confusing in the beginning. 

```javascript
widgets: [
    {
        type: 'SidebarEventList',
        hideIfEmpty: true,
        target: '#upcoming-events',
        eventPageUrl: 'https://awesomewebsite.com/schedule/details',
        length: 5,
        future: true,
        trainer: WorkshopButlerWidgets.getQueryParam('id'),
        theme: 'alfred'                    },
    {
        type: 'SidebarEventList',
        hideIfEmpty: true,
        target: '#past-events',
        eventPageUrl: 'https://awesomewebsite.com/schedule/details',
        length: 5,
        theme: 'alfred',
        future: false,
        trainer: WorkshopButlerWidgets.getQueryParam('id'),
    }
]
```

Let's take a closer look at it. As we already mentioned in [How the Widgets Work](#how-the-widgets-work), 
there is the fifth step in the execution process when a widget looks for the references to other widgets and executes 
them. The configurations for these widgets must be in `widgets` parameters.

Here we have two [SidebarEventList](widgets/sidebar-event-list.md) widgets. The first widget shows the upcoming events 
for the trainer. How do we know that? 

1. `future` parameter is `true`, so Workshop Butler returns only upcoming events
2. `trainer` parameter is `WorkshopButlerWidgets.getQueryParam('id')`. `WorkshopButlerWidgets.getQueryParam` is a 
helper function which retrieves a query parameter from the URL. The URL for each trainer profile is formed by adding `id` parameter to `trainerPageUrl`. In our case, it is something like this: `https://awesomewebsite.com/trainers/details?id=123`. So, the function `getQueryParam` returns `123` which is a trainer's ID. Workshop Butler returns only events, run by an active trainer.

The second widget shows the past events for the trainer. 

These widgets adds their content into `#upcoming-events` and `#past-events` containers. The containers are part of 
Workshop Butler [default themes](../themes/index.md)

!!! info
    You find a detailed description of `SidebarEventList` widget and its parameters [here](widgets/sidebar-event-list.md)

## Final Words
Awesome! You've just completed our quick start guide. Now your website is integrated with Workshop Butler. We hope 
you'll enjoy using it.

!!! advice
    In case you found some inconsistencies or errors, please [open an issue here](https://github.com/workshopbutler/developer-portal/). This way you help others to save time while configuring Workshop Butler JS widgets for their needs.
