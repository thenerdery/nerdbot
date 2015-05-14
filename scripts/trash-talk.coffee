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
      "#{person} is convinced that JHipster is a faster development platform than #{tech}.",
      "#{person} can do more pushups than of all our #{tech} developers combined.",
      "#{person} created a #{tech} framework so performant it broke Einstein's theory of relativity, so #{person} deleted it.",
      "Usually #{person} grabs a random person's Jimmy John's sandwich and eats it for lunch. Free lunch tastes so much better when you're hacking on #{tech}.",
      "#{person} will let you know that anyone who uses #{tech} is a total poser.",
      "#{person} is frankly embarrassed at how slow #{tech} is on https://www.techempower.com/benchmarks/.",
      "#{person} could implement all of #{tech} in like ten lines of Erlang. Tops.",
      "#{person} has demonstrated that #{tech} is simultaneously past its prime, and not yet ready for primetime.",
      "#{person} is trying to bring #{tech} before a war crimes tribunal at The Hague.",
      "#{person} knows that #{tech} is so brittle, osteoporosis sufferers feel bad for it.",
      # Add new trash talk templates here. Don't forget your trailing comma
      "/em #{person} thinks #{tech} is just fine."
    ]
    msg.send msg.random quotes
