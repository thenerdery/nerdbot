# Description:
#   Fetches random reddit post. Reworked from original reddit-random-top.coffee script
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot reddit me - A random top (today) post from the front page.
#   hubot reddit me image - A random top (today) image from the front page.
#
# Author:
#   Ben Liset

module.exports = (robot) ->
  robot.respond /reddit me( .+)*/i, (msg) ->
    reddit msg, msg.match[1]?.trim()

reddit = (msg, type) ->
  url = "http://www.reddit.com/top.json"
  msg
    .http(url)
      .get() (err, res, body) ->

        listings = JSON.parse(body).data.children

        posts = []
        imgPosts = []

        # SFW Filter
        for listing in listings
          if !listing.data.over_18
            posts.push(listing)
            if postIsImage listing.data
              imgPosts.push(listing)

        if type?.match /pic|pics|pictures|img|image|images/i
          post = getPost imgPosts 
        else
          post = getPost posts

        # Send pictures with the url on one line so Campfire displays it as an image
        if postIsImage post
          msg.send "#{post.title} - http://www.reddit.com#{post.permalink}"
          msg.send post.url
        else
          msg.send "#{post.title} - #{post.url} - http://www.reddit.com#{post.permalink}"

getPost = (posts) ->
  random = Math.floor(Math.random() * posts.length)
  posts[random]?.data

postIsImage = (post) ->
  postExtension = post.url.split(".").pop()
  # If there's no extension, postExtension will be the entire url
  if post.url == postExtension
    return false

  imageExtensions = /jpg|jpeg|png|gif/i
  post.domain == "i.imgur.com" or
  imageExtensions.test(postExtension)