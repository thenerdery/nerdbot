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
# Author:
#   sbausch@nerdery.com


module.exports = (robot) ->
  robot.respond /W0\d{6}/, (msg) ->
    orderNumber = msg.match[0]
    msg.send "https://mainframe.nerdery.com/search?q=#{orderNumber}"

  robot.respond /SO\d{6}/, (msg) ->
    orderNumber = msg.match[0]
    msg.send "https://mainframe.nerdery.com/search?q=#{orderNumber}"


