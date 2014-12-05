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
#   \w{5,10}-\d{1,5} - Returns a JIRA ticket link
#
# Author:
#   sbausch@nerdery.com


module.exports = (robot) ->
  # Mainframe Links
  robot.hear /W0\d{6}/, (msg) ->
    orderNumber = msg.match[0]
    msg.send "https://mainframe.nerdery.com/search?q=#{orderNumber}"

  robot.hear /SO\d{6}/, (msg) ->
    orderNumber = msg.match[0]
    msg.send "https://mainframe.nerdery.com/search?q=#{orderNumber}"

  robot.hear /OP\d{5}/, (msg) ->
    orderNumber = msg.match[0]
    msg.send "https://mainframe.nerdery.com/search?q=#{orderNumber}"

  # JIRA Links
  robot.hear /\w{5,10}-\d{1,5}/, (msg) ->
    orderNumber = msg.match[0]
    msg.send "https://issues.nerdery.com/browse/#{orderNumber}"


