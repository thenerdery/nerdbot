# Description:
#   Daily dose of puns
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot pun me - Get a pun
#
# Author:
#   PFB

module.exports = (robot) ->
  robot.respond /pun( me)?/i, (msg) ->
    quotes = [
      "I tried to catch some fog. I mist.",
      "When chemists die, they barium.",
      "Jokes about German sausage are the wurst.",
      "I'd tell you a UDP joke, but you might not get it.",
      "I know a guy who's addicted to brake fluid. He says he can stop anytime.",
      "How does Moses make his tea? Hebrews it.",
      "I stayed up all night to see where the sun went. Then it dawned on me.",
      "This girl said she recognized me from the vegetarian club, but I'd never met herbivore",
      "I'm reading a book about anti-gravity. I can't put it down.",
      "I did a theatrical performance about puns. It was a play on words.",
      "They told me I had type A blood, but it was a Type O.",
      "Without geometry, life is pointless.",
      "PMS jokes aren't funny. Period.",
      "Class trip to the Coca-Cola factory. I hope there's no pop quiz.",
      "Energizer Bunny arrested: Charted with battery.",
      "I didn't like my beard at first. Then it grew on me.",
      "When you get a bladder infection, urine trouble.",
      "What does a clock do when it's hungry? It goes back four seconds.",
      "I wondered why the baseball was getting bigger. Then it hit me!",
      "Broken pencils are pointless.",
      "Never trust an atom, they make up everything.",
      "I don't recommend dating bridge builders, they have truss issues.",
      "I had a brat the other day, it was the wurst",
      "Learning to dance is a two-step process.",
      "Sign language is a handy thing to know",
      "She said I was just average. How Mean"
    ]
    msg.send msg.random quotes
