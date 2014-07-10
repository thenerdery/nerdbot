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
      "A soldier who survived mustard gas and pepper spray is now a seasoned veteran.",
      "I know a guy who's addicted to brake fluid. He says he can stop anytime.",
      "How does Moses make his tea? Hebrews it.",
      "I stayed up all night to see where the sun went. Then it dawned on me.",
      "This girl said she recognized me from the vegetarian club, but I'd never met herbivore",
      "I'm reading a book about anti-gravity. I can't put it down.",
      "I did a theatrical performance about puns. It was a play on words.",
      "They told me I had type A blood, but it was a Type O.",
      "Why were the Indians here first? They had reservations.",
      "PMS jokes aren't funny. Period.",
      "Class trip to the Coca-Cola factory. I hope there's no pop quiz.",
      "Energizer Bunny arrested: Charted with battery.",
      "I didn't like my beard at first. Then it grew on me.",
      "When you get a bladder infection, urine trouble.",
      "What does a clock do when it's hungry? It goes back four seconds.",
      "I wondered why the baseball was getting bigger. Then it hit me!",
      "Broken pencils are pointless.",
      "I don't recommend dating bridge builders, they have truss issues."
    ]
    msg.send msg.random quotes
