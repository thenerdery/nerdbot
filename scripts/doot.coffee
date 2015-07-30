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
#   thank mr skeltal
#
# Author:
#   jmullin

module.exports = (robot) ->
  robot.hear /^thanks? mr skeltal|doot doot$/i, (msg) ->
    msg.send 'http://media.giphy.com/media/p7PU6lbV4Rq3C/giphy.gif'
