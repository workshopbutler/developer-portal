# Changelog

## 2019-03-10

- Adds `expand` parameter to [Events API](index.md#list-all-events) which can contain `category` key. If it exists,
  the `category` of each event will be expanded into a separate object

## 2018-09-14

- Adds new optional parameter **categoryId** for [Events API](index.md#list-all-events)

## 2018-06-28

- **schedule** and **location** attributes were added to the [Event](index.md#the-event-object) object
- Attributes **start**, **end**, **hours_per_day**, **total_hours** of the [Event](index.md#the-event-object) are ==deprecated==. Use **schedule** attribute instead.
- Attributes **city** and **country** of the [Event](index.md#the-event-object) are ==deprecated==. Use **location** attribute instead.
