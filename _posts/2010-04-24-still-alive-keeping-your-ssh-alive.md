--- 
layout: post
title: "Still Alive: Keeping your SSH alive"
tags: 
- Linux
- SSH
- Tip
- UNIX
author: Anthony Scotti
email: anthony.m.scotti@gmail.com
---
"This was a triumph."

If you find your SSH connections dropping or locking up after not being used for some time you may want to try to edit your ```ssh_config``` (/etc/ssh/ssh_config) file and uncomment/add in the line ```ServerAliveInterval 30```. The number is in seconds.

What this will do is send a small 'keep-alive' packet to the server to ensure you don't get dropped.

Why is this happening? It could be settings on the server that drop users after set time of inactive use or due to a firewall/switch rule that drop inactive connections to improve the performance of the network.