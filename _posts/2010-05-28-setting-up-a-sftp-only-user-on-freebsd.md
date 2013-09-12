--- 
layout: post
title: Setting up a SFTP Only user on FreeBSD
tags: 
- FreeBSD
- Howto
- SFTP
- SSH
author: Anthony Scotti
email: anthony.m.scotti@gmail.com
---
Sometimes it's nice to be able to share files with other people. There are many sites online where you are able to do this but you are limited by size, type of file, or lacking in security. [SFTP](http://en.wikipedia.org/wiki/SSH_file_transfer_protocol) gives you the ablity to transfer from your server securely. Users that have SSH access can start using SFTP right away with applications like [WinSCP](http://winscp.net/eng/index.php). You don't want to give people full access to your system, so this is where SFTP only users come in to play. This will keep them from logging in and running commands and playing around with files they shouldn't.

Make a new group for the sftp only users to be added to.
<pre>#pw groupadd sftponly</pre>
Edit  the sshd_config file.
<pre>#vi /etc/ssh/sshd_config</pre>
and  add
<pre>Match Group sftponly
ChrootDirectory /usr/home/%u
X11Forwarding no
AllowTcpForwarding no
ForceCommand internal-sftp</pre>
Please  note that the chroot folder needs to be owned by root  for the user/group  to be able to log in.

Add a new user to the system and set  the login group to sftponly.
<pre>#adduser</pre>
I believe this will also work on OpenBSD but I'm not fully sure on that.

Open for questions, comments, or any way to improve this!
