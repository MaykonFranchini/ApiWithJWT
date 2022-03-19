
# Rails API with JWT authentication

This API is build with Ruby on Rails using JWT(Json Web Token) to authenticate users.

## Resources

URL / ENDPOINT    |    VERB    |    DESCRIPTION   
----------------- | ---------- | -------------- 
api/auth/login       |    POST    | Generate token
api/users            |    POST    | Create user      
api/users            |    GET     | Return all users
api/users/{username} |    GET     | Return user      
api/users/{username} |    PUT     | Update user      
api/users/{username} |   DELETE   | Destroy user     

### Authentication

**POST** `api/auth/login`

To authenticate a user, the `email` and `password` must be sent in the request body. If the user is authenticated, a response will be sent with the user name, token and token expiration time.

**Example**
**Request body**
```js
  {
    "email": "test@test.com",
	  "password": "123456"
  }
```

**Response**
```js
  {
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2NDc2OTUyMTB9.iFtQPWdx40lI211nczs9AF2GfpucNsaVxSxKQ-LYLzQ",
    "exp": "03-19-2022 13:06",
    "name": "John Doe"
  }
```
The token is valid for 24 hours.

### Create user

**POST** `api/users`

To create a user, data must be sent in a request body.

**Example**
**Request body**
```js
  {
    "email": "test@test.com",
    "password": "123456",
    "password_confirmation": "123456",
    "first_name": "John",
    "last_name": "Doe",
    "username": "johndoe2022"
	
  }
```

**Response**
```js
  {
	"id": 1,
	"first_name": "John",
	"last_name": "Doe",
	"username": "johndoe2022"
}
```
### List users

**GET** `api/users`

To list all users, the user must be authenticated and the token must be sent in headers.

**Example**
**Request Header**
```js
  {
    "Authorization": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2NDc2OTUyMTB9.iFtQPWdx40lI211nczs9AF2GfpucNsaVxSxKQ-LYLzQ"
  }
```

**Response**
```js
[  
  {
    "id": 1,
    "first_name": "John",
    "last_name": "Doe",
    "username": "johndoe2022"
  },
  {
    "id": 2,
    "first_name": "Tom",
    "last_name": "Max",
    "username": "tommax121"
  }
]
```
### User profile

**GET** `api/users/{username}`

To get a user profile, the user must be authenticated, the token must be sent in the headers, and the username must be sent in the query parameters.

**Example**
**Request Header**
```js
  {
    "Authorization": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2NDc2OTUyMTB9.iFtQPWdx40lI211nczs9AF2GfpucNsaVxSxKQ-LYLzQ"
  }
```
**url**
`https://myweb.com/api/users/johndoe2022`

**Response**
```js
  {
	"id": 1,
	"first_name": "John",
	"last_name": "Doe",
	"username": "johndoe2022",
  "email": "test@test.com",
  "created_at": "2022-03-18T13:06:41.534Z",
	"updated_at": "2022-03-18T13:06:41.534Z"
}
```
### Update user

**PUT** `api/users/{username}`

To update a user, the user must be authenticated, the token must be sent in the headers, the username must be sent in the query parameters and the data must be sent in the body.

**Example**

**url**

`https://myweb.com/api/users/johndoe2022`

**Request body**
```js
  {
	  "username": "johndoeupdated"
  }
```

**Response**
```js
  {
	"id": 1,
	"first_name": "John",
	"last_name": "Doe",
	"username": "johndoeupdated"
}
```