# Description:
#   This script lifts, brah.  Use it to improve your Lisp-like code.
#   Example: [botname] alpha me (defn add [a b] (+ a b))
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   [botname] alpha (me) [some command with parens]
#
# Author:
#   jmullin

module.exports = (robot) ->
  robot.respond /alpha( me)? +(.*)/i, (msg) ->
    alphatized = msg.match[2]
      .replace(/[()]/g, (match) ->
      	if (match == "(")
      	  " (bicepleft) "
      	else
      	  " (bicepright) ")
      .replace(/\s+(\(bicep(?:left|right)\))\s+/g, ' $1 ')
    msg.send alphatized