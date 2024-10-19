# EventApp

## Authentication
To authenticate your request, you will need to provide a header `'Authorization: Bearer <token>'`. `token` is included in sign up and sign in response.

## Sign up
`POST v1/users/tokens/sign_in`

### Authorization
not needed

### Body
| key      | type   |
| -------- | ------ |
| email    | string |
| password | string |

### Example
```
# Request
curl --location --request POST 'http://127.0.0.1:3000/v1/users/tokens/sign_up' \
--header 'Content-Type: application/json' \
--data-raw '{
    "email": "test@mail.com",
    "password": "123456"
}'

# Response
{
    "token":"AUwu8z_5ZyGNWmQrgxCDeiBbbYVxaUzaiUoKdmeVRQczq8u6XRo32mxNHz9n","refresh_token":"2-SU5x1h-KLDFWNQz7dH7GtxPdYAxTFccY11vC9rsgq7vuVkjq2Ag185U-T5",
    "expires_in":3600,
    "token_type":"Bearer",
    "resource_owner":{
        "id":1,
        "email":"test@mail.com",
        "created_at":"2024-10-19T05:14:20.860Z",
        "updated_at":"2024-10-19T05:14:20.860Z"
    }
}
```

## Sign in
`POST v1/users/tokens/sign_in`

### Authorization
not needed

### Body
| key      | type   |
| -------- | ------ |
| email    | string |
| password | string |

### Example
```
# Request
curl --location --request POST 'http://127.0.0.1:3000/v1/users/tokens/sign_in' \
--header 'Content-Type: application/json' \
--data-raw '{
    "email": "test@mail.com",
    "password": "123456"
}'

# Response
{
    "token":"y_PEygcXcQbFy3oKt6DzFQj9gmnBUSM5sPAY7XGNaLFed1zkjNCuckgPixge","refresh_token":"_4198Anci-JHd1VKvJGCWxC2A_76-Yy1dnmqjySD1xoysfpvDVyoBTQ2BibZ",
    "expires_in":3600,
    "token_type":"Bearer",
    "resource_owner":{
        "id":1,
        "email":"test@mail.com",
        "created_at":"2024-10-19T05:14:20.860Z",
        "updated_at":"2024-10-19T05:14:20.860Z"
    }
}   
```

## List all events
`GET v1/events`

### Authorization
not needed

### Body
empty

### Example
```
# Request
curl --location --request GET 'http://127.0.0.1:3000/v1/events'

# Response
[
    {
        "id":1,
        "name":"Event",
        "start_at":"2000-01-01T05:50:58.587Z",
        "capacity":10,
        "created_at":"2024-10-19T05:50:58.594Z",
        "updated_at":"2024-10-19T05:50:58.594Z"
    }
]
```

## Get event
`GET v1/events/{event_id}`

### Authorization
admin

### Body
empty

### Example
```
# Request
curl --location --request GET 'http://127.0.0.1:3000/v1/events/1' \
--header 'Authorization: Bearer <access_token>'

# Response
{
    "id":1,
    "name":"Event",
    "start_at":"2000-01-01T05:50:58.587Z",
    "capacity":10,
    "created_at":"2024-10-19T05:50:58.594Z",
    "updated_at":"2024-10-19T05:50:58.594Z"
}
```

## Create event
`POST v1/events/`

### Authorization
admin

### Body
| key      | type     |
| -------- | ------   |
| event.name     | string   |
| event.capacity | integer  |
| event.start_at | datetime |

### Example
```
# Request
curl --location --request POST 'http://127.0.0.1:3000/v1/events' \
--header 'Authorization: Bearer <access_token>' \
--header 'Content-Type: application/json' \
--data-raw '{
    "event": {
        "name": "Event",
        "capacity": "10",
        "start_at": "2024-10-19T07:29:42.000Z"
    }
}'

# Response
{
    "id":1,
    "name":"Event",
    "start_at":"2000-01-01T05:50:58.587Z",
    "capacity":10,
    "created_at":"2024-10-19T05:50:58.594Z",
    "updated_at":"2024-10-19T05:50:58.594Z"
}
```

## Update event
`PUT v1/events/{event_id}`

### Authorization
admin

### Body
| key      | type     |
| -------- | ------   |
| event.name     | string   |
| event.capacity | integer  |
| event.start_at | datetime |

### Example
```
# Request
curl --location --request PUT 'http://127.0.0.1:3000/v1/events/1' \
--header 'Authorization: Bearer <access_token>' \
--header 'Content-Type: application/json' \
--data-raw '{
    "event": {
        "name": "Event",
        "capacity": "10",
        "start_at": "2024-10-19T07:29:42.000Z"
    }
}'

# Response
{
    "id":1,
    "name":"Event",
    "start_at":"2000-01-01T05:50:58.587Z",
    "capacity":10,
    "created_at":"2024-10-19T05:50:58.594Z",
    "updated_at":"2024-10-19T05:50:58.594Z"
}
```

## Delete event
`DELETE v1/events/{event_id}`

### Authorization
admin

### Body
empty

### Example
```
# Request
curl --location --request DELETE 'http://127.0.0.1:3000/v1/events/1' \
--header 'Authorization: Bearer <access_token>'

# Response
{
    "id":1,
    "name":"Event",
    "start_at":"2000-01-01T05:50:58.587Z",
    "capacity":10,
    "created_at":"2024-10-19T05:50:58.594Z",
    "updated_at":"2024-10-19T05:50:58.594Z"
}
```