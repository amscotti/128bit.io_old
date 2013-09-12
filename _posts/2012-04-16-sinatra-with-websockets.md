--- 
layout: post
title: Sinatra with WebSockets
tags: 
- Howto
- Ruby
- Sinatra
- WebSockets
author: Anthony Scotti
email: anthony.m.scotti@gmail.com
---
[WebSockets](http://en.wikipedia.org/wiki/WebSocket) are a hot topic now a days with the HTML5 push, even though they are not officially part of HTML5 spec. If WebSockets are new to you, they are a way of being able to keep a connection open from the client's browser to the server. It will let you push data back and forth, think AJAX but without  the need of pulling for new data over and over. WebSockets give you the ability to push, which gives you a very close to real time update on the client's side. At this time, most of the newest versions of the popular browsers support WebSockets.

Due to the real time factor of WebSockets, they have found themselves into online games. One of my new favorite examples of this is [http://browserquest.mozilla.org/](http://browserquest.mozilla.org/), a multiplayer Zelda clone. You see a lot of examples using [Node.js](http://nodejs.org/) along with [Socket.IO](http://socket.io/), which is a great pack of new technologies [example of my own]({% post_url 2011-06-29-a-look-in-to-nodejs %})) but what if  you don't feel like switching to a new platform to take use of WebSockets? Most languages have libraries for dealing with WebSockets. In Ruby there is an em-websocket gem which is an EventMachine based WebSocket server.

I have a small project on GitHub which shows how I setup a Sinatra application to take uses of WebSockets to make a chat application. Nothing too great but this should give you an idea of where to start.

Here is the main part of the code,

{% gist 5400781 %}

Link to the full project [here on Github](https://github.com/amscotti/em_sinatra_chat), if you have any questions or comments please post, also any suggestions on improving this are welcome.
