# Vita Music Servers

> The intention of this server is to serve json to a react web app that can be found [here](https://github.com/esmeryjose/vita-music-client).


This server is build on rails with postgresql as its database service. It also has been integrated with the spotify api, for wich you will have to acquire your own credentials. With this server you are able to sign in with your spotify account and create events, well as search for songs and add those songs to the events playlist; such playlist can be accessed on spotify. Note that this server uses token to grant authorization and only serves JSON.

## Installation

run:

```sh
bundle
```

## Routes

 * GET /api/v1/auth
 * POST /api/v1/login
 * GET /api/v1/sessions/current_user
 * POST /api/v1/rsvps
 * DELETE /api/v1/rsvps/:id
 * POST /api/v1/votes
 * DELETE /api/v1/votes/:id
 * GET /api/v1/users/:id
 * GET /api/v1/users/:id/events
 * POST /api/v1/users/:id/events
 * PATCH /api/v1/users/:id/events/:id
 * DELETE /api/v1/users/:id/events/:id
 * GET /api/v1/users/:id/events/:id
 * GET /api/v1/auth/playlists/:id
 * POST /api/v1/auth/playlist/:id/tracks/:id
 * GET /api/v1/auth/search/tracks


## Meta

Esmery Corniel – [@esmery_corniel](https://twitter.com/esmery_corniel)(Twitter) – [@esmerycornielle](https://medium.com/@esmerycornielle)(Blogs)

This project was bootstrapped with [Create React App](https://github.com/facebookincubator/create-react-app).
