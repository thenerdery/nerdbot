# Description:
#   Routes MTG card names and search terms to a locally-hosted MTG card fetcher service.
#
#   Query by name with double square brackets: [[Counterspell]]
#   Query by search terms with double curly braces: {{o:"counter target spell"}}
#
#   Output formatting (add :{format} after your :
#     Add ":oracle" after your braces/brackets to get the oracle rules text for a result
#     Add ":price" after your braces/brackets to get the card price (if available)
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#
# Author:
#   jmullin

module.exports = (robot) ->
  baseUrl = "http://sadrobot.nerderylabs.com"

  roomFilter = (room) -> room is "magic" || room is "sadrobottest" || room is "Shell"

  robot.hear /\[\[([^\]]+)\]\](?!:)/g, (msg) ->
    console.log(msg.message.room)
    if roomFilter(msg.message.room)
      for match in msg.match
        robot.http("#{baseUrl}/byName")
          .post(match.substring(2, match.length - 2)) (err, res, body) ->

  robot.hear /\{\{([^\}]+)\}\}(?!:)/g, (msg) ->
    if roomFilter(msg.message.room)
      for match in msg.match
        robot.http("#{baseUrl}/byQuery")
          .post(match.substring(2, match.length - 2)) (err, res, body) ->

  robot.hear /<<([^>]+)>>/g, (msg) ->
    if roomFilter(msg.message.room)
      for match in msg.match
        robot.http("#{baseUrl}/rules")
          .post(match.substring(2, match.length - 2)) (err, res, body) ->

  # There are several better ways to handle these matches and extract the
  # format without just duplicating the listeners, but I am not enterprising
  # enough to bother at this juncture. Maybe once/if I add more than a few
  # alternate output formats. - jmullin the lazy

  robot.hear /\[\[([^\]]+)\]\]:oracle/g, (msg) ->
    if roomFilter(msg.message.room)
      for match in msg.match
        robot.http("#{baseUrl}/byName?format=oracle")
          .post(match.substring(2, match.length - 9)) (err, res, body) ->

  robot.hear /\{\{([^\}]+)\}\}:oracle/g, (msg) ->
    if roomFilter(msg.message.room)
      for match in msg.match
        robot.http("#{baseUrl}/byQuery?format=oracle")
          .post(match.substring(2, match.length - 9)) (err, res, body) ->

  robot.hear /\[\[([^\]]+)\]\]:price/g, (msg) ->
    if roomFilter(msg.message.room)
      for match in msg.match
        robot.http("#{baseUrl}/byName?format=price")
          .post(match.substring(2, match.length - 8)) (err, res, body) ->

  robot.hear /\{\{([^\}]+)\}\}:price/g, (msg) ->
    if roomFilter(msg.message.room)
      for match in msg.match
        robot.http("#{baseUrl}/byQuery?format=price")
          .post(match.substring(2, match.length - 8)) (err, res, body) ->

  robot.hear /\[\[([^\]]+)\]\]:ruling/g, (msg) ->
    if roomFilter(msg.message.room)
      for match in msg.match
        robot.http("#{baseUrl}/byName?format=ruling")
          .post(match.substring(2, match.length - 9)) (err, res, body) ->

  robot.hear /\{\{([^\}]+)\}\}:ruling/g, (msg) ->
    if roomFilter(msg.message.room)
      for match in msg.match
        robot.http("#{baseUrl}/byQuery?format=ruling")
          .post(match.substring(2, match.length - 9)) (err, res, body) ->
