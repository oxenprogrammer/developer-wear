# Sudo Wear

Sudo Wear is a Rails 6 API tied to a frontend written in react, made using the methodology and indications of the Capstone Project provided by [Microverse](https://www.microverse.org/). It provides endpoints to consume with an front-end client.

The documentation of this API is still under developement, I have manually documented the available endpoints below.

**Nice to Have**
I chose to implement a proper authentication since security is very important when collecting real user imformation. Users are protected by the Data Protection Policy updated in 2019

## Built With

- Ruby v3.01
- Ruby on Rails v6.1.0
- Rspec
- JWT
- heroku

## The Web App

The client live version of this project is on [Sudo Wear](https://sudowear.netlify.app/)

## Getting Started

To get a local copy up and running follow these simple example steps.İnitial

**Setup**

- Clone this repository with ` git clone https://github.com/oxenprogrammer/developer-wear.git` using your terminal or command line.<br>
- Create a cloudinary account since all images are stored in the cloud. Check [Cloudinary](https://cloudinary.com/) for details on how to create an account.<br>
- Change to the project directory by entering `cd developer-wear` in the terminal<br>
- Create a `.env` file in the root directory and use `.env_example` to put the right environment variables.<br>
- Next run `bundle install` to install the necessary dependencies<br>
- Run `rails db:migrate` to setup your local database.<br>
- Run `rails db:create` in case `the migration` doesn't run the first time.<br>
- Run `rails db:seed` to get seeded data for project. You will need to <br>


### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

> for test formatting add below script in .rspec file

```
    rpsec --format documentation
```

> To run all the tests run below script in the terminal

`rspec`
# Sudo Wear API endpoints
**BASE_URL** = `server/api/v1/`
## Register User
Route: **BASE_URL/users**
**POST Request**
```
  {
    "email": "john@gmail.com",
    "username": "john",
    "password": "123456",
    "password_confirmation": "123456"
  }
```
**Success Response Body**
```
  {
    "id": 7,
    "username": "ojok123444",
    "email": "ojok@gmail.com",
    "password_digest": "$2a$12$GNp45y5xQKEskyzCEq1i..oqC.6IXsL9rYVt2riw.aELLAgMuFPRe",
    "admin": false,
    "created_at": "2021-08-08T14:38:46.279Z",
    "updated_at": "2021-08-08T14:38:46.279Z"
  }
```

## Login User
Route: **BASE_URL/login**
**POST Request**
```
  {
    "email": "ojok@gmail.com",
    "password": "123456"
  } 
```
**Success Response Body**
```
  {
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo3fQ.B4o3uuM9PffSX50Dv-Idupe9jAfw4AQYXINCXBOLicA",
    "email": "ojok@gmail.com",
    "username": "ojok123444",
    "admin": false
  }
```

## Get Shirts
Route: **BASE_URL/shirts**
Header: `Authorization: "Bearer Token"`
**GET Request**

**Success Response Body**
```
  {
    "status": "ok",
    "count": 1,
    "data": [
        {
            "id": 4,
            "name": "no coffee no code",
            "description": "developers need coffee in order to execute their task successfully",
            "image": {
                "url": "http://res.cloudinary.com/emmisteel/image/upload/v1627507461/sl1xydorburv4rpcceie.jpg"
            },
            "price": 32000,
            "created_at": "2021-07-27T09:50:36.615Z",
            "updated_at": "2021-07-27T11:22:53.996Z"
        },
    ]
  }
```

## Get Favourite Shirts
Route: **BASE_URL/favourites**
Header: `Authorization: "Bearer Token"`
**GET Request**

**Success Response Body**
```
  {
    "status": "ok",
    "count": 1,
    "data": [
        {
            "id": 4,
            "name": "no coffee no code",
            "description": "developers need coffee in order to execute their task successfully",
            "image": {
                "url": "http://res.cloudinary.com/emmisteel/image/upload/v1627507461/sl1xydorburv4rpcceie.jpg"
            },
            "price": 32000,
            "created_at": "2021-07-27T09:50:36.615Z",
            "updated_at": "2021-07-27T11:22:53.996Z"
        },
    ]
  }
```

## Get Single Shirts
Route: **BASE_URL/shirts/:id**
Header: `Authorization: "Bearer Token"`
**GET Request**

**Success Response Body**
```
  {
    
    "id": 4,
    "name": "no coffee no code",
    "description": "developers need coffee in order to execute their task successfully",
    "image": {
        "url": "http://res.cloudinary.com/emmisteel/image/upload/v1627507461/sl1xydorburv4rpcceie.jpg"
    },
    "price": 32000,
    "created_at": "2021-07-27T09:50:36.615Z",
    "updated_at": "2021-07-27T11:22:53.996Z"
      
  }
```

## Get Shirts
Route: **BASE_URL/shirts**
Header: `Authorization: "Bearer Token"`
**GET Request**

**Success Response Body**
```
  {
    "status": "ok",
    "count": 1,
    "data": [
        {
            "id": 4,
            "name": "no coffee no code",
            "description": "developers need coffee in order to execute their task successfully",
            "image": {
                "url": "http://res.cloudinary.com/emmisteel/image/upload/v1627507461/sl1xydorburv4rpcceie.jpg"
            },
            "price": 32000,
            "created_at": "2021-07-27T09:50:36.615Z",
            "updated_at": "2021-07-27T11:22:53.996Z"
        },
    ]
  }
```

## Get All Users
Route: **BASE_URL/users**
Header: `Authorization: "Bearer Token"`
**GET Request**

**Success Response Body**
```
  {
    "status": "ok",
    "count": 2,
    "data": [
        {
            "id": 2,
            "username": "moses",
            "email": "moses@gmail.com"
        },
        {
            "id": 1,
            "username": "emmysteel",
            "email": "emmy@gmail.com"
        },
    ]
  }
```

## Add Shirt
Route: **BASE_URL/shirts**
Header: `Authorization: "Bearer Token"`
**POST Request (Form Data)**
```
    "name": "ojok@gmail.com",
    "description": "123456",
    "price": 3000,
    "image": Base64 Image
```
**Success Response Body**
```
  {
    "id": 9,
    "name": "CMD",
    "description": "As a programmer, you will spend a lot of time at the command line. love it, embrace it.",
    "image": {
        "url": null
    },
    "price": 40000,
    "created_at": "2021-08-08T15:00:39.763Z",
    "updated_at": "2021-08-08T15:00:39.763Z"
  }
```

## Author
👤 **Emanuel Okello**

- GitHub: [oxenprogrammer](https://github.com/oxenprogrammer)
- Twitter: [@ox_emmy](https://twitter.com/ox_emmy)
- LinkedIn: [Emanuel Okello](https://www.linkedin.com/in/emanuel-okello/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Acknowledgments

- Several YouTube Videos
- Several Medium Articles
- [Microverse](https://microverse.org)

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](https://opensource.org/licenses/MIT) licensed.