# Description:
#   Inserts pictures of Hearthstone: Heroes of Warcraft cards by name, inspired by and based
#   on the mtg.coffee hubot script.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   [botname] hearth <card name> - a picture of the named card
#   [botname] hearthgold <card name> - a picture of the named card
#
# Author:
#   JustinMullin

querystring = require 'querystring';

module.exports = (robot) ->
  robot.respond /hearth(gold)? (.+)/i, (msg) ->
    gold = msg.match[1] == "gold"
    card = msg.match[2] || "Dismal%20Failure"
    url = "https://omgvamp-hearthstone-v1.p.mashape.com/cards/#{card}"

    robot.http(url, {rejectUnauthorized: false})
      .headers('Accept': 'application/json', 'X-Mashape-Key': 'YB9jVNMtEAmshMcppgxNosnddWxjp1CiUrwjsnauUIPZjEzsaF')
      .get() (err, res, body) ->
        if err
          msg.send "Failed to load card."
          return

        data = JSON.parse(body)[0]

        if !data?
          msg.send "No card with this namo."
          return

        msg.send if gold then data.imgGold else data.img