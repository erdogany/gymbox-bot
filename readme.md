![gif](https://media.giphy.com/media/3oz8xK9ER0CRMAhozK/giphy.gif)

# Gymbox bot

Provide you a complete experience to automate booking of your gymbox classes:

* API: Add class to book
* Scheduler: Cron to run on your server to check class to book everydays at 7am for classes on next day
* Cli: Book a class using command line

## How to make a booking

First you need to add your `email` and `password` into a `./data/config.json`, example:

```json
{
  "email": "YOUR_EMAIL_HERE",
  "password": "YOUR_PASSWORD_HERE"
}
```

Secondly you need to add the class you want to book to either the `./data/classes.json` file, using the date as the key,
or for recurring bookings by adding the class you want to book to the `./data/classesByDay.json` file. Format for
classes.json is:

```json
{
  "2017-06-21": {
    "className": "Gymnastic Conditioning",
    "time": "12:15",
    "location": "Farringdon"
  }
}
```

Format for classesByDay.json is:

```json
{
  "Monday": {
    "className": "Gymnastic Conditioning",
    "time": "12:15",
    "location": "Farringdon"
  }
}
```

### Using the cli

```
node cli.js -c run
```

### Using the scheduler

> Edit cron expression in `scheduler.js` then:

```
node scheduler.js
```

## How to use the API

```
node api.js
```

Endpoints:

* GET: `/api/table`: return the gymbox time table

  * Query params:
    * `email`: Gymbox user email
    * `password`: Gymbox user password

* GET: `/api/add`: Add a class to book

  * Query params:
    * `email`: Gymbox user email
    * `password`: Gymbox user password
    * `className`: The name of the class to book
    * `time`: The time of the class to book, format: HH:mm
    * `date`: The date of the class to book, format: YYYY-MM-DD
    * `location`: The gym location of the class to book

* GET: `/api/run`: Run the booking process
  * Query params:
    * `email`: Gymbox user email
    * `password`: Gymbox user password

# Using on heroku (free)

Simply create a heroku account and deploy this app. (See docs: https://devcenter.heroku.com/articles/git)

Once you create the app add heroku scheduler. (https://devcenter.heroku.com/articles/scheduler)

Scheduler needs to run bin/book.sh everyday at 7am; this will make the bookings.
