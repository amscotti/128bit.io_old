--- 
layout: post
title: File Encryption with OpenSSL
tags: 
- Encryption
- Howto
- Linux
- OpenSSL
- UNIX
author: Anthony Scotti
email: anthony.m.scotti@gmail.com
---
Time to time you may find the need to encrypt a file before sending it to someone or store it where other people may have access to it. OpenSSL is a great tool for this and it is installed on most Linux/Unix and OS X (also, I believe there is an install for OpenSSL for Windows too).

Here's the command to encrypt a file,
<pre>$ openssl enc -aes-256-cbc -a -salt -in mytestfile.txt -out myencryptedtestfile.txt</pre>
It will ask you for a password and then encrypt the file.

To decrypt,
<pre>$ openssl enc -d -aes-256-cbc -a -in myencryptedtestfile.txt -out unencryptedmytestfile.txt</pre>
You can also pipe in data in and out of OpenSSL by removing the -in or -out (or both) like so,
<pre>$ cat mytestfile.txt | openssl enc -aes-256-cbc -a -salt -out myencryptedtestfile.txt</pre>
<pre>$ cat myencryptedtestfile.txt | openssl enc -d -aes-256-cbc -a -out unencryptedmytestfile.txt</pre>
You are also able to use different encryption algorithms with OpenSSL as long as you encrypt and decrypt using the same algorithms.

Open for questions, comments, or any way to improve this!
