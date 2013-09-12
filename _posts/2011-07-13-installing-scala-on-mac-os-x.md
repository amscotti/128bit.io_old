--- 
layout: post
title: Installing Scala on Mac OS X
tags: 
- Howto
- Install
- Mac
- Scala
author: Anthony Scotti
email: anthony.m.scotti@gmail.com
---
One of the other things I'm trying to learn on my free time is Scala, like Groovy it's a language that runs on top of the JVM and is both a object-oriented and functional programming language. One of the biggest places I know where its being used is [Foursquare](https://foursquare.com/)

Same idea as the other postings I did for installing [Groovy, Grails]({% post_url 2011-03-31-install-groovy-and-grails-on-mac-os-x %}) and [jRuby]({% post_url 2011-04-07-install-jruby-on-mac-os-x %}).

Head to the Scala home page at [http://www.scala-lang.org](http://www.scala-lang.org) and click on the '[Download Scala](http://www.scala-lang.org/downloads)' which is on the right side of the page. Download the [scala-2.9.0.1.tgz](http://www.scala-lang.org/downloads/distrib/files/scala-2.9.0.1.tgz) (which is the latest as of writing this posting).

If you just want to download it from the command line,
<pre>ascotti$ curl -O http://www.scala-lang.org/downloads/distrib/files/scala-2.9.0.1.tgz</pre>

If you want to ensure the file is downloaded correctly checkout the MD5 file.
<pre>ascotti$ curl http://www.scala-lang.org/downloads/distrib/files/scala-2.9.0.1.tgz.md5
10d01410fd75019fa21a88964462a077
ascotti$ md5 scala-2.9.0.1.tgz MD5 (scala-2.9.0.1.tgz) = 10d01410fd75019fa21a88964462a077</pre>

Now that we have the file we need to untar it, move it /usr/share and make the link to scala for it.
<pre>ascotti$ tar -xzf scala-2.9.0.1.tgz
ascotti$ sudo mv scala-2.9.0.1 /usr/share/
ascotti$ sudo ln -s scala-2.9.0.1/ scala</pre>

Last step is to update your .profile file within your home folder. Just add this to the top:
<pre>SCALA_HOME=/usr/share/scala; export SCALA_HOME
PATH=$SCALA_HOME/bin:$PATH; export PATH</pre>

Close all Terminals and reopen one. To test to see if everything is setup right, run this:
<pre>ascotti$ scala
&nbsp;
Welcome to Scala version 2.9.0.1 (Java HotSpot(TM) 64-Bit Server VM, Java 1.6.0_24).
Type in expressions to have them evaluated.
Type :help for more information.
&nbsp;
scala&gt;</pre>

After all this you should be all set to start working with Scala. If the time comes and you want to upgrade, all you need to do is download, unzip and move to /usr/share folder and update the symbolic link like so:
<pre>ascotti$ cd /usr/share/
ascotti$ sudo rm scala
ascotti$ sudo ln -s scala-2.9.0.1/ scala</pre>

If you have any questions or comments please post, also any suggestions on improving this are welcome.
