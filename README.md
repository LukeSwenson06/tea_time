# Tea Time
<details>
<summary> Table of Contents</summary>
<ol>
<li>About the Project</li>
<ul>
<li> Built With </li>
</ul>
<li> Getting Started </li>
<ul>
<li> Prerequisites </li>
<li> Installation </li>
</ul>
<li> Endpoints </li>
</ol>
</details>

## About the Project
 Tea Time is a backend application built with ruby on rails. This application was built for a Mod 4 project at the Turing School of Software and Design where we create a backend application for a fictional tea subscription service. This application will be able to subscribe a customer to a tea service, unsubscribe from a tea service, and show all that customer's cancelled and active tea subscriptions.


### Built With
- ![Ruby On Rails](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
- ![Github](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)
- ![PostgresSql](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)

## Getting Started

### Installation
1. Clone the repo
`git clone git@github.com:LukeSwenson06/tea_time.git`

2. Move into the file
`cd tea_time`

3. Install Gems
`bundle install`

4. Create database and migrate files
`rails db:{create,migrate}` 

5. Run localhost:3000
`rails s`

6. Hit endpoints using a service like Postman

7. Happy Hunting!

## Endpoints
### Subscribes a customer to a tea subscription
```
POST /api/v1/customers/1/subscriptions/1
```
```
{
    "data": {
        "id": "1",
        "type": "subscription",
        "attributes": {
            "title": "monthly masterpiece collection",
            "price": 127.0,
            "status": "active",
            "frequency": "yearly"
        }
    }
}
```
### Unsubscribes a customer from a tea subscription
```
PATCH /api/v1/customers/1/subscriptions/1
```
```
{
    "data": {
        "id": "1",
        "type": "subscription",
        "attributes": {
            "title": "monthly masterpiece collection",
            "price": 127.0,
            "status": "cancelled",
            "frequency": "yearly"
        }
    }
}
```
### Shows a Customer's cancalled and active tea subscriptions
```
{
    "data": [
        {
            "id": "1",
            "type": "subscription",
            "attributes": {
                "title": "monthly masterpiece collection",
                "price": 127.0,
                "status": "cancelled",
                "frequency": "yearly"
            }
        },
        {
            "id": "2",
            "type": "subscription",
            "attributes": {
                "title": "green goo subscription special",
                "price": 10.0,
                "status": "active",
                "frequency": "yearly"
            }
        }
    ]
}
```

