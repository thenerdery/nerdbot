# Description:
#   Routes MTG card names and search terms to a locally-hosted MTG card fetcher service.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   Note: this behavior is allowed only from within the Magic room.
#
#   Query by name with double square brackets: [[Counterspell]]
#   Query by search terms with double curly braces: {{o:"counter target spell"}}
#
# Author:
#   jmullin

module.exports = (robot) ->
  baseUrl = "http://sadrobot.nerderylabs.com"

  robot.hear /\[\[([^\]]+)\]\]/g, (msg) ->
    if msg.message.room is "Magic"
      for match in msg.match
        robot.http("#{baseUrl}/byName")
          .post(match.substring(2, match.length - 2)) (err, res, body) ->

  robot.hear /\{\{([^\}]+)\}\}/g, (msg) ->
    if msg.message.room is "Magic"
      for match in msg.match
        robot.http("#{baseUrl}/byQuery")
          .post(match.substring(2, match.length - 2)) (err, res, body) ->
