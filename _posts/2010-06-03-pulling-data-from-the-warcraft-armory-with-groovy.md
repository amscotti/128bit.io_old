--- 
layout: post
title: Pulling data from the Warcraft Armory with Groovy
tags: 
- Groovy
- Howto
- Wow
- XML
author: Anthony Scotti
email: anthony.m.scotti@gmail.com
---

**Update:**

New code using Battle.net's REST API can be found [here]({% post_url 2011-09-22-updated-world-of-warcraft-armory-code %}).

This posting is similar to "[Pulling data from the Warcraft Armory with Ruby]({% post_url 2010-05-09-ruby-and-armory %})" but with Groovy. For the people who are not familar with [Groovy Home](http://groovy.codehaus.org) it's "Object-oriented language alternative for Java platform; Java-like syntax, dynamically compiles to JVM bytecodes" in other words it's another language that gets compiled to JVM bytecodes like [Jython](http://www.jython.org) (Python based) and [JRuby](http://jruby.org) (Ruby based), but unlike being based off another language, this is new take on the Java language. Groovy is also the key part in [Grails](http://www.grails.org) which is a [MVC](http://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller) web framework like [Ruby on Rails](http://rubyonrails.org). Both Groovy and Grails aim to allow rapid development but still use enterprise standards Java technologies.

I love looking into and leaning a new language and for me the best way to learn is to redo something I already did in another language. This seem a bit pointless but for me I can see the key differences from one to the other.

<pre>
def realm = URLEncoder.encode("Staghelm")
def guild = URLEncoder.encode("Controlled Chaos")

def url = "http://www.wowarmory.com/guild-info.xml?r=${realm}&amp;n=${guild}".toURL()

def types = [
"1": "Warrior", "2": "Paladin", "3": "Hunter",
"4": "Rogue", "5": "Priest", "6": "Death Knight",
"7": "Shaman", "8": "Mage", "9": "Warlock",
"11": "Druid"].withDefault { key -&gt; "unknown" }

url.openConnection().with {
  setRequestProperty("User-Agent", "Firefox/2.0.0.4")
  inputStream.withReader('UTF-8') { reader -&gt;
    def characters = new XmlSlurper().parse(reader)
      .guildInfo.guild.members.character
      .findAll { it.@level == '80' }
      .collect { [name: it.@name.text(), type: it.@classId.text()] }
    def groupedByType = characters.groupBy { it.type }

    println "Total: ${characters.size()} characters found with level 80"
    groupedByType.each { type, avatars -&gt;
      println "\n${avatars.size()} characters of class ${types[type]}"
      avatars.sort { it.name }.each { avatar -&gt; println "- ${avatar.name}" }
    }
  }
}
</pre>

EDIT: I updated my code using Guillaume Laforge's example.

This should output the list of characters in the guild that are level 80 by class. I did find working with XML in Groovy was a bit easier then Ruby. Overall, I find Groovy an interesting language and I do wish to learn more about it, along with Grails.


If any one knows of a better way to do this or any other language or technology that I should look into please let me know by posting a comment. Also feedback and questions are welcome!

**Update:**

Thanks to Guillaume Laforge there is a more 'groovify' example along with code to deal with character classes. Check it out at [http://groovyconsole.appspot.com/script/140001](http://groovyconsole.appspot.com/script/140001)
