--- 
layout: post
title: Using multiple SSH private keys
tags: 
- Howto
- Linux
- SSH
author: Anthony Scotti
email: anthony.m.scotti@gmail.com
---
I did some postings last year about SSH and making keys and how to move them to systems you are working with. What if you need to do this in reverse? You are the person setting up a system for others to work with and you want to pass the private key to the users. An example of this is Amazon's EC2 setup where you get the private key to be able to log in to the VMs you make.

Now there is no issue at all if you don't have any keys previously made on your system, just move the key to your .ssh folder within your home folder and you should be good to go, but if you have keys of your own and don't want to over write them you can set them up within your .ssh/config file. In most cases you may need to make this file if there isn't one already there.

The layout of the file is like so:

<pre>
Host server1.128bitstudios.com
  User tony
  Hostname server1.128bitstudios.com
  IdentityFile ~/.ssh/server1-identity

Host server2.128bitstudios.com
  User scotti
  Hostname server2.128bitstudios.com
  IdentityFile ~/.ssh/server2-identity
</pre>

Host name can be set to whatever you want, if you want to use a nickname for the server you are free to do so. Ensure the IdentityFile is pointing to the right path where you have the key. Also note that you can setup a User for the server as well, this will make it so you don't have to add "USER@" when trying to ssh to a server as a different user. The config file can also accept other settings like ports.

After setting up the config file you should be able to just type ssh  and host and be logged in.

Open for questions, comments, or any way to improve this!
