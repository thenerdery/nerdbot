# Description:
# A way to search images on giphy.com.  Forked from the hubot script of the same name:
# https://github.com/github/hubot-scripts/blob/master/src/scripts/giphy.coffee), with
# 'animate (me)' command added and default behavior to produce a gif when the query
# has no hits.

#
# Configuration:
#   HUBOT_GIPHY_API_KEY
#
# Commands:
#   hubot animate me <query> - Returns an animated gif matching the requested search term.

giphy =
  api_key: process.env.HUBOT_GIPHY_API_KEY
  base_url: 'http://api.giphy.com/v1'
  no_gif_found_query: process.env.HUBOT_GIPHY_DEFAULT_QUERY or 'otter'

module.exports = (robot) ->
  robot.respond /(animate|gif|giphy)( me)? (.*)/i, (msg) ->
    giphyMe msg, msg.match[3], (url) ->
      msg.send url

giphyMe = (msg, query, cb) ->
  endpoint = '/gifs/search'
  url = "#{giphy.base_url}#{endpoint}"

  msg.http(url)
    .query
      q: query
      api_key: giphy.api_key
    .get() (err, res, body) ->
      response = undefined
      try
        response = JSON.parse(body)
        images = response.data
        if images.length > 0
          image = msg.random images
          cb image.images.original.url
        else
          giphyMe(msg, giphy.no_gif_found_query, cb)

      catch e
        response = undefined
        cb 'Error'

      return if response is undefined
