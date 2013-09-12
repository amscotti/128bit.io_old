--- 
layout: post
title: Updated World of Warcraft Armory code
tags: 
- API
- CoffeeScript
- Groovy
- Howto
- REST
- Ruby
- Wow
author: Anthony Scotti
email: anthony.m.scotti@gmail.com
---
I haven't been playing World of Warcraft for a bit, but I guess they did some big updates to the armory which stopped the code I had written before from running correctly. (Link to the old code, [Ruby]({% post_url 2010-05-09-ruby-and-armory %}) and [Groovy]({% post_url 2010-06-03-pulling-data-from-the-warcraft-armory-with-groovy %}))

After looking in to what has changed, I found out they added a new [REST API](http://en.wikipedia.org/wiki/Representational_state_transfer) for Battle.net which lets you pull data easily without the need of tricking the server to pass you XML. From the API, we get nice JSON data to work with. So here is some new code in Ruby, Groovy and CoffeeScript (running on [Node.js](http://nodejs.org/)) that can be used to get about the same output as the code I had before. ([Link to gist](https://gist.github.com/1236553))

### Ruby
{% gist 1236553 wowapi.rb %}

### Groovy
{% gist 1236553 wowapi.groovy %}

### CoffeeScript
{% gist 1236553 wowapi.coffee %}


For more info on the Battle.net API check out the [API Documentation](http://blizzard.github.com/api-wow-docs/)

If you have any questions or comments please post, also any suggestions on improving this are welcome as I'm sure there are ways to improve the code.
