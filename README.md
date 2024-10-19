# EventApp

## Authentication
To authenticate your request, you will need to provide a header `'Authorization: Bearer <token>'`. `token` is included in sign up and sign in response.

## Sign up
`POST users/tokens/sign_in`

### Body
| key      | type   |
| -------- | ------ |
| email    | string |
| password | string |

### Example
```
# Request
curl --location --request POST 'http://127.0.0.1:3000/users/tokens/sign_up' \
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
`POST users/tokens/sign_in`

### Body
| key      | type   |
| -------- | ------ |
| email    | string |
| password | string |

### Example
```
# Request
curl --location --request POST 'http://127.0.0.1:3000/users/tokens/sign_in' \
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
