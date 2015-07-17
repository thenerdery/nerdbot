# Description:
#   Responds appropriately when you thank mr skeltal.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   thanks mr skeltal
#
# Author:
#   jmullin

module.exports = (robot) ->
  robot.respond /thanks? mr skeltal/i, (msg) ->
    msg.send 'http://media.giphy.com/media/p7PU6lbV4Rq3C/giphy.gif'