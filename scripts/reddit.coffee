# Description:
#   Provides frontpage reddit links
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   reddit me - Get a frontpage reddit link
#
# Author:
#   Ben Liset

module.exports = (robot) ->
  robot.respond /reddit( me)?/i, (msg) ->
    msg.http("http://www.reddit.com/.json")
      .get() (err, res, body) ->
        listings = JSON.parse(body).data.children
        sfwListings = []

        for listing in listings
          do (listing) ->
            if !listing.data.over_18
              sfwListings.push(listing)

        randomNumber = Math.floor(Math.random() * sfwListings.length)
        msg.send "http://www.reddit.com" + sfwListings[randomNumber].permalink
