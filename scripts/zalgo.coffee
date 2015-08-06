# Description:
#   Use with caution, as this script will summon He Who Waits Behind the Wall, invoking the feeling of chaos.  You cannot escape.  He comes.  ZALGO!
#
# Dependencies:
#   "zalgotxt": "^0.1.0"
#
# Configuration:
#   None
#
# Commands:
#   zalgo
#
# Author:
#   jmullin

zalgo = require("zalgotxt")

module.exports = (robot) ->
  robot.respond /zalgo(hard)? (.*)/i, (msg) ->
    msg.send zalgo(msg.match[2], if (!!msg.match[1]) then 1 else 0)