# Yuzu.Anilist-GraphQL

## Uses

You can use these GraphQL in any application to perform queries on the Anilist.co API.
Right now I'm focusing on covering the main feature set of Yuzu with these queries.

## Getting the schema

### Requirements
- Apollo
- Node.js 8 or higher
- npm

Install Apollo using  `npm i -g apollo` and download the Anilist.co schema with this command  `apollo schema:download --endpoint=https://graphql.anilist.co schema.json`

(There is probably a less bloaty way of achieving this, but I did it like this)

## Personal usecase

This repository is being used a submodule for Yuzu which uses Apollo to generate Swift classes from these GraphQL queries. 
