--- 
layout: post
title: Install Groovy and Grails on Mac OS X
tags: 
- Grails
- Groovy
- Howto
- Install
- Mac
author: Anthony Scotti
email: anthony.m.scotti@gmail.com
---
Just some steps to get people up and running with Groovy/Grails on Mac OS. Hopefully with this steps you will be able to easily upgrade to any new version that comes out. Keep in mind you will need to replace the version number that is part of the file names as they upgrade.

Download the newest releases of Groovy and Grails,

*  Groovy can be found at [http://groovy.codehaus.org/](http://groovy.codehaus.org/), and as I'm writing this the Stable Release is 1.7.10. You're going to want to download the 'Binary Release'
*  Grails can be found at, [http://www.grails.org/](http://www.grails.org/) and 1.3.7 is the lastest release.

After both are downloaded open up your Terminal, this can be found under in the Utilities folder within the Applications folder.

Terminal should start you in your home folder (which is /Users/&lt;username&gt;), we are going to move to the download folder and unzip the 2 files we just downloaded.

<pre>
ascotti$ cd Downloads/
ascotti$ unzip groovy-binary-1.7.10.zip
ascotti$ unzip grails-1.3.7.zip
</pre>

With the 2 files unzipped we are going to move them to the /usr/share folder, and then make a symbolic link and then update your .profile with the needed path info. To move the files into the /usr/share folder we are going to need to use sudo which will ask for your user's password.

<pre>
ascotti$ sudo mv groovy-1.7.10 /usr/share/
ascotti$ sudo mv grails-1.3.7 /usr/share/
ascotti$ cd /usr/share/
ascotti$ sudo ln -s groovy-1.7.10/ groovy
ascotti$ sudo ln -s grails-1.3.7/ grails
</pre>

The symbolic link will make things easier when updating to any new releases, you will not need to edit your profile with any new path info and if you need to downgrade for any reason all you have to do is reset the symbolic link to point to the old folder. Now you just need to add the path info within your .profile file that can be found within your home folder (If you don't have a .profile in your home folder, then you can just make one). You are able to use any text editor you want you just need to add this to the top of the file,

<pre>GROOVY_HOME=/usr/share/groovy; export GROOVY_HOME
PATH=$GROOVY_HOME/bin:$PATH; export PATH</pre>

<pre>GRAILS_HOME=/usr/share/grails; export GRAILS_HOME
PATH=$GRAILS_HOME/bin:$PATH; export PATH</pre>

Save, close any Terminals that are open and open a new one. To test things out try running this from within the Terminal.

<pre>
ascotti$ groovy -v
Groovy Version: 1.7.9 JVM: 1.6.0_24
ascotti$ grails
Welcome to Grails 1.3.7 - http://grails.org/
Licensed under Apache Standard License 2.0
Grails home is set to: /usr/share/grails</pre>

<pre>No script name specified. Use 'grails help' for more info or 'grails interactive' to enter interactive mode</pre>

After all this you should be all set to start working with Groovy and Grails. If the time comes and you want to upgrade, all you need to do is download, unzip and move to /usr/share folder and update the symbolic link like so.

<pre>
ascotti$ cd /usr/share/
ascotti$ sudo rm groovy
ascotti$ sudo ln -s groovy-1.7.10/ groovy
</pre>

If you have any questions or comments please post, also any suggestions on improving this are welcome.
