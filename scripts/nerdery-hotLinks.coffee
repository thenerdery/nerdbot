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
#   /(^|\s+)(W0\d{6})($|\s+)/ - Return a Work Order link
#   /(^|\s+)(SO\d{6})($|\s+)/ - Return a Sales Order link
#   /(^|\s+)(OP\d{5})($|\s+)/ - Returns an Opportunity Link
#   /(^|\s+)(\w{5,20}-\d{1,5})($|\s+)/ - Returns a JIRA ticket link
#
# Author:
#   sbausch@nerdery.com

/(^|\s+)W0\d{6}($|\s+)/
module.exports = (robot) ->
  # Mainframe Links
  robot.hear /(^|\s+)(W0\d{6})($|\s+)/, (msg) ->
    orderNumber = msg.match[2]
    msg.send "https://mainframe.nerdery.com/search?q=#{orderNumber}"

  robot.hear /(^|\s+)(SO\d{6})($|\s+)/, (msg) ->
    orderNumber = msg.match[2]
    msg.send "https://mainframe.nerdery.com/search?q=#{orderNumber}"

  robot.hear  /(^|\s+)(OP\d{5})($|\s+)/, (msg) ->
    orderNumber = msg.match[2]
    msg.send "https://mainframe.nerdery.com/search?q=#{orderNumber}"

  # JIRA Links
  robot.hear /(^|\s+)(\w{5,20}-\d{1,5})($|\s+)/, (msg) ->
    orderNumber = msg.match[2]
    msg.send "https://issues.nerdery.com/browse/#{orderNumber}"


