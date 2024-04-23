# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Plan

- hotel controller
    get all the links and convert the data and save
    this should be on button click
    mapping should also be customized for each
- helper module
    to clean the data and parse into standard format
- home page and controller

## Database
use sqlite - why this and not relational?
if we are collecting data, displaying it in a systematic way, relational is teh best way to do so, can make full use of indexing strategies to serve large amounts of data.

format, structure and integrity of data is impt.

## main methodology for cleaning and merging data
combining, do a left join
why not inner join? some data will be lost
why not union? duplicate data

some interesting methods:
- ml
- fuzzy matching - not a good idea because words that are different could have a close distance - e.g N Korea & S Korea


## Considerations
- keep history of changes
- show a page of differences and what to keep? 
- need to find a way to write helper classes that can be tested by iteslf with any type of data source when running the tests

## Assumptions
### images
assume that all links are working and we just store the urls

### addresses
assume that the lat and long are the most accurate, since having those will give the most precise location and can embed google maps and get street addresses from it.

if don't have then fallback to some logic to clean the addresses

### amenities
take the lowest level amenities,
don't need to break it down to such a molecular level =


