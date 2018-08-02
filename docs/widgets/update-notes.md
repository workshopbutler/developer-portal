# Upgrade Notes

## 0.7.1
Just bump up the version number:
```html
<script src="https://cdn.workshopbutler.com/widgets.0.7.1.js"></script>
```

## 0.7.0

### Scripts
* Switch the script version to 0.7.0: 

```html
<script src="https://cdn.workshopbutler.com/widgets.0.7.0.js"></script>
```

### Templates
If you use default themes and templates, ==no updates needed==. 

If you use custom templates, this release brings breaking changes:

* Attributes `start`, `end`, `hoursPerDay`, `totalHours` of `Event` class were moved to `Event.schedule` attribute. So `Event.start` became `Event.schedule.start`
* Both `start` and `end` attributes are not longer [Date](https://www.w3schools.com/jsref/jsref_obj_date.asp) objects, but [DateTime](http://moment.github.io/luxon/docs/manual/tour.html) objects from [Luxon](https://moment.github.io/luxon/) library
* Attributes `city` and `online` of `Event` class were moved to `Event.location` attribute. So `Event.city` became `Event.location.city`
* Attribute `Event.country` class is replaced by `Event.location.countryCode`
* Attributes `Event.location.countryCode` and `Event.location.city` are `null` if `Event.location.online = true`
* Function `formatDate` was removed. Use `Schedule.format` method instead.
* New `Schedule` class comes with `format` method to format dates, times and timezones based on a user locale. It returns different results based on the value of its only parameter:
     *  `start_short` - Start date
     *  `start_long`  - Start date and time
     *  `end_short`   - End date
     *  `end_long`    - End date and time
     *  `full_short`  - Start and end date
     *  `full_long`   - Start and end date/time
     *  `timezone_short`  - Timezone abbreviation, e.g. `CET`
     *  `timezone_long`   - Timezone name, e.g. `Central European Time`

For more information, check [`Event`](https://github.com/workshopbutler/js-widgets/blob/master/src/models/Event.ts), [`Schedule`](https://github.com/workshopbutler/js-widgets/blob/master/src/models/Schedule.ts), and [`Location`](https://github.com/workshopbutler/js-widgets/blob/master/src/models/Location.ts) classes.
