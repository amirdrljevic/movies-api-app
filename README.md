# README

This is a basic API app, MOVIES-API-APP. With only one model Movie and 2 attributes (name, description).


* The app is dockerized. 
* To set it up run this command: 
```
docker-compose -f docker-compose.override.yml up
```

* There is an entrypoint that gets called once the conatiner starts up
* It runs the DB creation, migration and seeding

