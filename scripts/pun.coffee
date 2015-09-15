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
      "She said I was just average. How Mean",
      "Becoming a vegetarian is a huge missed steak.",
      "Did you hear about the guy whose whole left side was cut off? He's all right now.",
      "Whiteboards are remarkable.",
      "Santa must have moved his workshop to Brazil. All of our present boxes were marked 'Amazon'",
      "Chewbacca doesn't strike me as someone with experience. He's a bit of a wookie.",
      "Have you heard about those new corduroy pillows? They're making headlines.",
      "A new type of broom came out, it is sweeping the nation.",
      "There is no gambling in Africa because there are too many cheetahs.",
      "I swallowed some food coloring the other day and I feel like I've dyed inside.",
      "I bought a pair of shoes from a drug dealer. I'm not sure what he laced them with but I've been tripping all day.",
      "If you love dictionaries so much why don't you Merriam.",
      "It takes ten-tickles to make a squid laugh.",
      "I don't trust these stairs because they're always up to something.",
      "I would enjoy perfume commercials a lot more if they actually made scents.",
      "I'm reading a book about anti-gravity. It's impossible to put down.",
      "Why do java programmers wear glasses? Because they don’t C#.",
      "Calculus jokes are too derivative for my tastes.",
      "When Buzz Aldrin had to retire, he wasn't over the moon about it.",
      "Claustrophobic people are more productive thinking outside the box.",
      "You know what's annoying about broom-maker discussions? All the straw man arguments.",
      "Some guy just threw a bottle of milk at my head.  How dairy!",
      "Pavlov? It rings a bell.",
      "I tried to write a note with my broken pencil, but it was pointless.",
      "I always throw away my leftovers.  I just can't stand the thought of my food going to waist.",
      "I accidentally left my vacuum cleaner running all night. I guess you could say it was an overnight suck excess.",
      "I was going to write a skeleton pun, but none of my ideas were humerus.",
      "Deaf mathematicians communicate through sine language.",
      "It's not that the man did not know how to juggle, he just didn't have the balls to do it.",
      "I wanted to get faster computer memory but I didn't have the cache.",
      # Add new puns above here. Don't forget your trailing comma
      "/em fails to pun."
    ]
    msg.send msg.random quotes
