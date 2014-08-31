---
layout: post
title: Fun with ZFS send and receive
tags:
- FreeBSD
- Howto
- Opensolaris
- Solaris
- ZFS
author: Anthony Scotti
email: anthony.m.scotti@gmail.com
---

For the people who haven't had the opportunity to play around with [ZFS](http://en.wikipedia.org/wiki/ZFS), it's a powerful filesystem which lets you easily manage storage with very simple commands. Right now you can use ZFS within FreeBSD, Opensolaris and Solaris and there are also ports for Linux, MacOS and NetBSD but they still in the works and something I wouldn't use in production. For this posting we will be looking at some ways you can use 'zfs send' and 'zfs receive' command and how they can help you manage your storage along with combining them with other Unix tools.

'zfs send' lets you  take a snapshot of ZFS filesystems and output it to a file or stream it into another command. You could use this file as a backup and move it to another system for storage, or have the receiving system create a new ZFS filesystems from the file. This is useful for storing backups for off-site. Think of it like dd the filesystems but without the need to unmount it. 'zfs receive' as you can guess is the counterpart to send. It will let you read a file or a stream and make a new filesystem out of it. Both commands are very diverse in the ways you can use them and due to this you can combine them with a lot of other Unix commands to achieve some nice outputs and feature.

The first step with using 'zfs send' is to take a snapshot of the filesystem. Since snapshots are read-only, you do not have to worry about files being written at the time you run 'zfs send'. Making a snapshot can be done by using zfs snapshot "filesystems name" like so.

<pre>zfs snapshot mybook/testzone@20100719-1600</pre>

After the snapshot is taken you are ready to start using zfs send. There are many  things you can do and here is a small sample of ideas. Keep in mind that the output of 'zfs send' is like the cat or other unix tools, this will let you pipe any number of commands together.

You are able to output a filesystem to a file just by directing the output of 'zfs send' to a file path. This is used for backing up the filesystem to a external drive or offsite/cloud storage. Here is the command syntax, zfs send "snapshot name" &gt; "output path/filename" and an example

<pre>zfs send mybook/testzone@20100719-1600 > /storage/temp/testzone</pre>

Now taking the same idea of output to a file, but it is now piped into gzip file to have it compress.

<pre>zfs send mybook/testzone@20100719-1600 | gzip &gt; /storage/temp/testzone.gz</pre>

You can even take this a step further. Lets use the OpenSSL command from my other posting on '[File Encryption with OpenSSL]({% post_url 2010-05-31-file-encryption-with-openssl %})' and output a gziped encrypted file. This is a good way to send a file if you ever need to send/save the filesystem in an encrypted way.

<pre>zfs send mybook/testzone@20100719-1600 | gzip | openssl enc -aes-256-cbc -a -salt &gt; /storage/temp/testzone.gz.ssl</pre>

'zfs receive' is the other half of the equation. You need some way to read the file and remake the file system, this is where 'zfs receive' comes into play. The commands are very similer in format and can be used along with other Unix commands if you format things correctly.

To use the file from a 'zfs send' output you just need to stream or pipe it in to 'zfs receive'. The basic syntax is zfs receive "zpoolname/newfilesystem name" &lt; "path to file" but for more compex commands you may need to play around with the format a bit. Here is an example of the basic syntax.

<pre>zfs receive mybook/testzone_new &lt; /storage/temp/testzone</pre>

To read in the output from the OpenSSL and gzip you need to workout th format of the commands to get the output correct. Here is what I came up with

<pre>openssl enc -d -aes-256-cbc -a -in /storage/temp/testzone.gz.ssl | gunzip | zfs receive mybook/testzone_new</pre>

Now using my favorite tool, SSH, you can use both 'zfs send' and 'zfs receive' together to copy filesystem over SSH to another system and because SSH is all encrypted this is a nice secure way to copy filesystems around. Here is a example for the command.

<pre>zfs send mybook/testzone@20100719-1600 | ssh testbox zfs receive sandbox/testzone@20100719-1600</pre>

As you can see, ZFS gives nice easy commands for manging your storage and you are able to do some powerful things easily. This is only a small part of what ZFS can do and it is really worth taking a look at if you are interested in doing some really fascinating things with data storage!

I have been working with ZFS for sometime now but there is still so much for me to learn, so if anyone sees something wrong in the posting or knows a better way of doing something please let me know as I do want to expand my knowledge of ZFS along with data storage/management.
