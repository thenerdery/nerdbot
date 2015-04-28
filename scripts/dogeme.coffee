# Description:
#   Wow. Such Doge
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   nerdbot doge me Wow. Such Doge
#
# Author:
#   dly

module.exports = (robot) ->
  robot.respond /nerdbot doge( me)? (.*)/i, (msg) ->
    urlPart = msg.match[2].replace(/[.!?,]/g, '/').replace(/[ ]/g, '')
    msg.send 'http://dogr.io/' + urlPart + '.png'        