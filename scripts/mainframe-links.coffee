# Description:
#   Provides links to WO, SO, And Opps from Mainframe
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   W0\d{6} - Return a Work Order link
#   SO\d{6} - Return a Sales Order link
#   OP\d{6} - Returns an Opportunity Link
#
# Author:
#   sbausch@nerdery.com


module.exports = (robot) ->
  robot.hear /W0\d{6}/, (msg) ->
    orderNumber = msg.match[0]
    msg.send "https://mainframe.nerdery.com/search?q=#{orderNumber}"

  robot.hear /SO\d{6}/, (msg) ->
    orderNumber = msg.match[0]
    msg.send "https://mainframe.nerdery.com/search?q=#{orderNumber}"

  robot.hear /OP\d{5}/, (msg) ->
    orderNumber = msg.match[0]
    msg.send "https://mainframe.nerdery.com/search?q=#{orderNumber}"

