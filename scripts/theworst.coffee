# Description:
#   Daily dose of wisdom from Maxwell Vandervelde
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot 50 ft of crap
#   hubot literally the worst
#   hubot the worst
#   hubot basically the worst
#   hubot not bad
#
# Author:
#   TV

module.exports = (robot) ->
  robot.respond /50 ((ft)|(feet)) of crap/i, (msg) ->   
    selectChoice(msg, crap(), 'worse than 50 ft of crap')

  robot.respond /((literally)|(basically))? the worst/i, (msg) ->    
    quotes = worst()
    subtext = ""
    if msg.match.length > 0 && msg.match[1] == "basically"
      quotes = basic()
      subtext = "basically " 
    
    if msg.match.length > 0 && msg.match[1] == "literally"
      quotes = literal()
      subtext = "literally "
     
    selectChoice(msg, quotes, subtext + "the worst")

  robot.respond /not bad/i, (msg) ->                
    selectChoice(msg, notbad(), "not bad")
    
  robot.respond /the wurst/i, (msg) ->
    all = "Did you mean 'the worst'? Showing results for 'the worst'\r\n"
    for quote in notbad()
      all += '\r\n' + quote + " not bad"
      
    for quote in basic()
      all += '\r\n' + quote + " basically the worst"
    
    for quote in worst()
      all += '\r\n' + quote + " the worst"
    
    for quote in literal()
      all += '\r\n' + quote + " literally the worst"
    
    for quote in crap()
      all += '\r\n' + quote + " worse than 50 ft of crap"
      
    msg.send all

selectChoice = (msg, collection, trailer) ->
  quote = msg.random collection
  
  msg.send quote + " " + trailer
  
crap = () -> 
  # return
  [
    "Java 8-style default methods on interfaces are",
    "JobVite spam on Twitter is",
    "Sitefinity is",
    "Joomla is",
    "TFS is"
  ]
  
literal = () ->
  #return
  [ 
    "Beal is",
    "Ruby is",
    "Emacs is",
    "Oboe is",
    "Windows is",
    "Every library for handling HTTP Forms. Ever. is",
    "When we are out of cheese in the fridge is",
    "Timesheet reminder emails are",
    "Google hangouts are",
    "CVS is",
    "Cake PHP is"
  ]
  
worst = () ->
  #return 
  [
    "nano is",
    "PHP is",
    "Mix-ins are",
    "OS X is",
    "JavaScript is",
    "Talking in a movie theater is",
    "Zend Framework 1 is",
    "Zend Framework 2 is",
    "When we are out of beef sticks in the fridge is",
    "Timesheets are",
    "Svn is"
  ]
  
basic = () ->
  # return
  [
    "Vim is",
    "Java is",
    "Linux is",
    "Overused words like 'really' or 'basically' are"
  ]

notbad = () ->
  [
    "Douglas Linsmeyer is",
    "Patrick Fuentes is",
    "Max Vandervelde is"
  ] 
