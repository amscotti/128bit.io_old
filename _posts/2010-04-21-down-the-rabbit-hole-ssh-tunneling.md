--- 
layout: post
title: "Down the Rabbit Hole: SSH Tunneling"
tags: 
- Howto
- Linux
- SSH
- UNIX
author: Anthony Scotti
email: anthony.m.scotti@gmail.com
---
SSH is one of my favorite tools on a Linux/Unix system. There is so much you can do from copying files, to tunneling data security. SSH is a great way to get access to your system at home, but also access to your network. Lets go over some things about SSH tunneling and why it's good to use!

**Basic Idea:**

The idea of tunneling is to give you a secure way to pass data from one point to another. You can also use tunneling to get past a firewall to access services that you are blocked from or even make a tunnel back to the system you are tunneling from.

**Example:**

An example that I use tunneling for is its adds security. Lets say you are at a cafe with your laptop and you wish to do some online banking or some type of posting on your blog. You would want to know that what you are doing is secure and you don't have someone reading the info going over the line. Yes, banks have security built into their sites, but man-in-the-middle attacks can disable a lot of security put in place by the banks it's also not going to hurt to add in some more security which will take less than a minute to setup!

**Setup - Dynamic Port Forwarding:**

The first type of tunnel is called dynamic port, as you can kind of guess from the name it lets you work with dynamic ports. I use this for Web browsing and IM clients, you tell the application to use a port on your localhost and it will open up any needed port on the remote computer as needed for the application. This is the type of tunnel you want to use if you are on a public network and want to browse the web without fear of people eavesdropping on you.

<pre>$ ssh -CND 1080 user@server</pre>
<pre>C is for compression.
N is no remote command, so you will not get a command line.
D is for dynamic posts. This lets the remote computer open any ports needs for the client.</pre>
When you are done, just ctrl+c to close the tunnel.

With in most web browsers and IM clients you are able to uses this tunnel as a SOCKS proxy, just uses localhost for the IP and whatever port number you used. Port 1080 is used in the in this example but any unused port will do.

**Setup - Port Forwarding:**

This type of tunnel is useful if you need to get to another system on the network (or outside the network). I use this type of tunnel for applications like RDP/VNC and other applications that need specialized ports to work. This lets you get to computers without the need for opening ports on your firewall/router.
<pre>$ ssh user@server -CNL PORT:INNER_IP:PORT</pre>
<pre>C and N are the same as before.
L is for binding your local port to the remote system's port.</pre>
Same as before, just ctrl+c to close the tunnel.

With this tunnel, just point the applications to localhost and the port you used and it should be connecting to the remote system.

**Setup - Reverse Tunnel:**

Reverse tunnel lets you setup a tunnel that the system on the other end can use. So if the client system is behind a firewall and will not let incoming SSH connections come in, you can setup a reverse tunnel where the system at the other end can SSH back into the system. I really don't use this type of tunnel much. I haven't found a good use for this type of tunnel because the tunnel needs to be setup before hand and then you must go to the other system to do what you need to do. Though a good example I have for this type of tunnel is, if your work computer is behind a firewall, setting up a reverse tunnel to your system at home will let you access your work computer. More likely than not, companies have better ways to let you work from home or have a system already open to the outside so you can access your work. This is still useful to know though if the need ever comes up.
<pre>$ ssh user@server -CNR 1080:localhost:22</pre>
<pre>C and N are the same as before.
R is like L but works to let the remote system uses the ports/tunnel.</pre>
ctrl+c to close the tunnel.

**Make it easy with a script:**

You can setup a script for all the tunnels you need, also if you add in SSH keys you have a nice fast way to make tunnels!

Example for port forwarding tunnel,

{% gist 5401025 %}

Copy this to a file and add in the needed info (anything with in the &lt;&gt; needs to be replace). Save and chmod +x &lt;FILENAME&gt; to make it executable. To run, ./&lt;FILENAME&gt;
If you have a SSH key all set you should be good to go, else it will ask you for a password.

**PuTTY:**

If you find yourself on a windows system and need to make some tunnels you can do all this with PuTTY. There is a great write up by John of thinkhole.org that goes into detail on how to setup a dynamic port forwarding and setting up some applications to use them.
[http://thinkhole.org/wp/2006/05/10/howto-secure-firefox-and-im-with-putty/](http://thinkhole.org/wp/2006/05/10/howto-secure-firefox-and-im-with-putty/)

Open for questions, comments, or any way to improve this!
