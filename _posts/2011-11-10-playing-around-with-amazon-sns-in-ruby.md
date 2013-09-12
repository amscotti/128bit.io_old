--- 
layout: post
title: Playing around with Amazon SNS in Ruby
tags: 
- Amazon
- AWS
- Howto
- Ruby
- SNS
author: Anthony Scotti
email: anthony.m.scotti@gmail.com
---
For a upcoming Ruby project that I plan on working on I want to be able to send small messages to myself with information from a form that gets filled out. Amazon has just updated Simple Notification Service to be able to send SMS messages along with emails. This fits in perfectly with what I'm looking for. Looking on Amazon's Github page for the aws-sdk gem I didn't see any sample code for using SNS and googling I couldn't find any right away. As I needed to learn this anyways I picked to make my own sample code which I hope to get a pull request in soon to have it on the official repository. After looking at the documentation and the source code for the library I was able to work this out.

{% gist 1356844 %}

If you see a way to make this better please feel free to post here or fork the Gist with your updates.
