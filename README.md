# uniqcast

## Notes for Reviewer

I haven't used the better player package for several reasons. The package is in beta and in the 
footer of the documentation informs of possible coming breaking changes. The package also hasn't 
been updated for 22 months and has no support for common platforms the team at uniqcast might be 
interested in such as web and desktop.

I am using an alternative package which does support all of the flutter platforms, is updated 
recently and is not in beta.

## Code walkthrough
I am using google fonts package for picking a font.
API:
    - I have used the Dio package
    - RequestInterceptor adds the headers and logs the user out on 401 (unauthenticated) server 
    response
    - There is a LogLevel to change the level of logging
    - All requests are type-safe via Generics
    - handleResponse function parses the data if need be
    - All data that isn't directly parsable (unlike dart data types) 
    is defined in the factories.dart file
    - json date time decorators are used to parse dates used to the local time zone
    - server error object is used for handling errors

Functions - to reduce boiler plate

Auth module:
    - login page, accesses the login state (provider),
    which, in term, accesses the auth service 
    which is the gateway to the client, 
    which returns a login response object
    handled by login state

Channels module:
    - channels view -> channels state -> channels service (fetch) -> client -> data 
    - each of the data in the list is used to display a channel card
    - channel card
        - fetches an image and displays it if provided
        - for the image - I also tried with the logos['CARD'] and logos['NORMAL'] ids but only 2 
        had images so I decided to use channel_id for the logo due to lack of documentation on 
        how to use the API
        - sets the state of the channel stream state (for that channel id)
        to the predetermined stream (happens on all)
        - notes about the video are displayed above
        - there's also handling for channels with no video

User packages module: state -> service -> client -> model -> data

text field module: different helpers for working with text fields

User module: user state and user model

Resources: shared constants and app theme - set to match unicast website

Routing: I have used go router and I have put it in a provider

Storage: used for storing tokens and user data. I use GetStorage but there are many good options

extensions: some utility extensions for ease of work
