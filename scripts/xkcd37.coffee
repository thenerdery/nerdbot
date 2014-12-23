# Description:
#   A sweet ass-Hubot script.
#   Taking inspiration from XKCD 37, this script will move the - one space to the right.
#
# Dependencies:
#   none
#
# Configuration:
#   none
#
# Commands:
#   none
#
# Notes:
#   none
#
# Author:
#   damionbroadaway

module.exports = (robot) ->
  robot.hear /(.*)-ass (.*)/i, (msg) ->
    punctuation = ['.', '!', '?', ';']

    assThing = msg.match[2]
    if assThing in punctuation
      return

    endOfAss = assThing.substring((assThing.length-1))
    if endOfAss in punctuation
      assThing = assThing.substring(0, (assThing.length-1))

    frontWords = msg.match[1]
    lastSpace = frontWords.lastIndexOf " "
    assAdjective = frontWords.substring(lastSpace+1)

    newAssThing = "ass-#{assThing}"
    msg.send "That's a #{assAdjective} #{newAssThing}!"
