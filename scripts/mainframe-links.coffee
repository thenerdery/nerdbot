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
#   [WS]O\d{6} - Return a Work Order or Sales Order link
#
# Author:
#   sbausch@nerdery.com


module.exports = (robot) ->
  robot.respond /[WS]O\d{6}/, (msg) ->
    orderNumber = msg.match[0]
    msg.reply "https://mainframe.nerdery.com/search?q=#{orderNumber}"

