# MakersBnB

A web application that allows users to list spaces they have available, and to hire spaces for the night.

## Screenshots

## Specifications

### Headline specifications
- Any signed-up user can list a new space.
- Users can list multiple spaces.
- Users should be able to name their space, provide a short description of the space, and a price per night.
- Users should be able to offer a range of dates where their space is available.
- Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
- Nights for which a space has already been booked should not be available for users to book that space.
- Until a user has confirmed a booking request, that space can still be booked for that night.

### Nice-to-haves

- Users should receive an email whenever one of the following happens:
  - They sign up
  - They create a space
  - They update a space
  - A user requests to book their space
  - They confirm a request
  - They request to book a space
  - Their request to book a space is confirmed
  - Their request to book a space is denied
- Users should receive a text message to a provided number whenever one of the following happens:
  - A user requests to book their space
  - Their request to book a space is confirmed
  - Their request to book a space is denied
- A ‘chat’ functionality once a space has been booked, allowing users whose space-booking request has been confirmed to chat with the user that owns that space
- Basic payment implementation though Stripe.

## Minimum Viable Product (MVP)

- Any signed-up user can list a new space.
- Users can list multiple spaces.
- Users should be able to name their space, provide a short description of the space, and a price per night.
- Users should be able to offer a range of dates where their space is available.

## User Stories

```
__User Story 1__
As a user
So I can sign up to MakersBnB
I want to be able to enter my email address and password
```
```
__User Story 2__
As a host
So I can promote my house on the MakerBnb website
I want to be able to list my house
```
```
__User Story 3__
As a host
So I can earn more money
I want to be able to list more than one space
```
```
__User Story 4__
As a host
So I can give more details about my property
I want to be able to provide a name, description, price and data range for my space
```
## Entity Relationship Diagram

- A User has many Listings
- A Listing belongs to a User

## Tech used

- Ruby
- Capybara
- Sinatra

## How to use

### Project set up

` git clone git@github.com:biancaiordache/MakersBnB.git`

`bundle`

### Database set up

- Connect to `psql`
- Create the `makers_bnb` database:
```
CREATE DATABASE makers_bnb;
```
- Create the `makers_bnb_test` database:
```
CREATE DATABASE makers_bnb_test;
```
- Run the SQL scripts in the `db/migrations` folder.

### To run the MakersBnB app:

```
shotgun
```

Navigate to `localhost:9393`

### Testing

```
rspec
```
