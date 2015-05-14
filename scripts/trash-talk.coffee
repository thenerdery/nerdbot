# Description:
#   Bot will quote somebody as talking trash about some technology.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot Does <person> have an opinion about <technology>[?] - <person> talks trash about <technology>.
#
# Author:
#   snackCake

module.exports = (robot) ->
  robot.respond /Does (.+) have an opinion about ([^?]+)\??/i, (msg) ->
    person = msg.match[1]
    tech = msg.match[2]
    quotes = [
      "#{person} can do more pushups than of all our #{tech} developers combined.",
      "#{person} created a #{tech} framework so performant it broke Einstein's theory of relativity, so #{person} deleted it.",
      "Usually #{person} grabs a random person's Jimmy John's sandwich and eat it for lunch. Free lunch tastes so much better when you're hacking on #{tech}.",
      "#{person} is convinced that JHipster is a faster development platform than #{tech}.",
      "#{person} will let you know that anyone who uses #{tech} is a total poser.",
      # Add new trash talk templates here. Don't forget your trailing comma
      "/em #{person} thinks #{tech} is just fine."
    ]
    msg.send msg.random quotes
