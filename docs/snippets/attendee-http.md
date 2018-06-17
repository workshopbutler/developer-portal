??? example "Request"
    ```json
    {
        "event_id": 123,
        "first_name": "Carl",
        "last_name": "Maddow",
        "email": "carl.maddow@test.com",
        "date_of_birth": "1951-09-17",
        "country": "NL",
        "city": "Amsterdam",
        "province": "Holland",
        "organisation": "Lost Beauty BV",
        "role": "Developer",
        "work.country": "NL",
        "work.city": "Rotterdam"
    }
    ```

??? example "Response 201"

    ```json
    {
      "attendee_id": 1
    }
    ```

??? example "Response 403"

    ```json
    {
      "code": 403,
      "message": "Forbidden Request",
      "info": {
        "event_id": "This parameter is required"
      }
    }
    ```

??? example "Response 422"

    ```JSON
    {
        "code": 422,
        "message": "Validation failed",
        "info": { "event_id": "This parameter is required" }
    }
    ```
