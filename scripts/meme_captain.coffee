# Description:
#   Get a meme from http://memecaptain.com/
#
# Dependencies:
#   None
#
# Commands:
#   hubot Y U NO <text> - Generates the Y U NO GUY with the bottom caption of <text>
#   hubot I don't always <something> but when i do <text> - Generates The Most Interesting man in the World
#   hubot <text> (SUCCESS|NAILED IT) - Generates success kid with the top caption of <text>
#   hubot <text> ALL the <things> - Generates ALL THE THINGS
#   hubot <text> TOO DAMN <high> - Generates THE RENT IS TOO DAMN HIGH guy
#   hubot Yo dawg <text> so <text> - Generates Yo Dawg
#   hubot All your <text> are belong to <text> - All your <text> are belong to <text>
#   hubot If <text>, <word that can start a question> <text>? - Generates Philosoraptor
#   hubot <text>, BITCH PLEASE <text> - Generates Yao Ming
#   hubot <text>, COURAGE <text> - Generates Courage Wolf
#   hubot ONE DOES NOT SIMPLY <text> - Generates Boromir
#   hubot IF YOU <text> GONNA HAVE A BAD TIME - Ski Instructor
#   hubot IF YOU <text> TROLLFACE <text> - Troll Face
#   hubot Aliens guy <text> - Aliens guy weighs in on something
#   hubot Brace yourself <text> - Ned Stark braces for <text>
#   hubot Iron Price <text> - To get <text>? Pay the iron price!
#   hubot Not sure if <something> or <something else> - Generates a Futurama Fry meme
#   hubot <text>, AND IT'S GONE - Bank Teller
#   hubot WHAT IF I TOLD YOU <text> - Morpheus What if I told you
#
# Author:
#   bobanj

module.exports = (robot) ->
  robot.respond /Y U NO (.+)/i, (msg) ->
    memeGenerator msg, 'NryNmg', 'Y U NO', msg.match[1], (url) ->
      msg.send url

  robot.respond /iron price (.+)/i, (msg) ->
    memeGenerator msg, 'q06KuA', msg.match[1], 'Pay the iron price', (url) ->
      msg.send url

  robot.respond /aliens guy (.+)/i, (msg) ->
    memeGenerator msg, 'sO-Hng', msg.match[1], '', (url) ->
      msg.send url

  robot.respond /brace yourself (.+)/i, (msg) ->
    memeGenerator msg, '_I74XA', 'Brace Yourself', msg.match[1], (url) ->
      msg.send url

  robot.respond /(.*) (ALL the .*)/i, (msg) ->
    memeGenerator msg, 'Dv99KQ', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(I DON'?T ALWAYS .*) (BUT WHEN I DO,? .*)/i, (msg) ->
    memeGenerator msg, 'V8QnRQ', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(.*)(SUCCESS|NAILED IT.*)/i, (msg) ->
    memeGenerator msg, 'AbNPRQ', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(.*) (\w+\sTOO DAMN .*)/i, (msg) ->
    memeGenerator msg, 'RCkv6Q', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(NOT SURE IF .*) (OR .*)/i, (msg) ->
    memeGenerator msg, 'CsNF8w', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(YO DAWG .*) (SO .*)/i, (msg) ->
    memeGenerator msg, 'Yqk_kg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(All your .*) (are belong to .*)/i, (msg) ->
    memeGenerator msg, '76CAvA', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(.*)\s*BITCH PLEASE\s*(.*)/i, (msg) ->
    memeGenerator msg, 'jo9J0Q', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(.*)\s*COURAGE\s*(.*)/i, (msg) ->
    memeGenerator msg, 'IMQ72w', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /ONE DOES NOT SIMPLY (.*)/i, (msg) ->
    memeGenerator msg, 'da2i4A', 'ONE DOES NOT SIMPLY', msg.match[1], (url) ->
      msg.send url

  robot.respond /(IF YOU .*\s)(.* GONNA HAVE A BAD TIME)/i, (msg) ->
    memeGenerator msg, 'lfSVJw', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(.*)TROLLFACE(.*)/i, (msg) ->
    memeGenerator msg, 'dGAIFw', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(IF .*), ((ARE|CAN|DO|DOES|HOW|IS|MAY|MIGHT|SHOULD|THEN|WHAT|WHEN|WHERE|WHICH|WHO|WHY|WILL|WON\'T|WOULD)[ \'N].*)/i, (msg) ->
    memeGenerator msg, '-kFVmQ', msg.match[1], msg.match[2] + (if msg.match[2].search(/\?$/) == (-1) then '?' else ''), (url) ->
      msg.send url

  robot.respond /(.*)(AND IT\'S GONE.*)/i, (msg) ->
    memeGenerator msg, 'uIZe3Q', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /WHAT IF I TOLD YOU (.*)/i, (msg) ->
    memeGenerator msg, 'fWle1w', 'WHAT IF I TOLD YOU', msg.match[1], (url) ->
      msg.send url

memeGenerator = (msg, imageName, text1, text2, callback) ->
  memeCaptainUrl = 'http://memecaptain.com/gend_images'
  imageUrl = imageName

  memeData = {
    "src_image_id":        imageName,
    "private":             false,
    "captions_attributes": [
      {
        "text":           text1,
        "top_left_x_pct": 0.05,
        "top_left_y_pct": 0,
        "width_pct":      0.9,
        "height_pct":     0.25
      },
      {
        "text":           text2,
        "top_left_x_pct": 0.05,
        "top_left_y_pct": 0.75,
        "width_pct":      0.9,
        "height_pct":     0.25
      }
    ]
  };


  processResult = (err, res, body) ->
    return msg.send err if err
    if res.statusCode == 301
      msg.http(res.headers.location).get() processResult
      return
    if res.statusCode == 302
      msg.reply "#{res.headers.location}"
      callback res.headers.location
      return
    if res.statusCode > 300
      msg.reply "Sorry, I couldn't generate that meme. Unexpected status from memecaptain.com: #{res.statusCode}"
      return
    try
      result = JSON.parse(body)
    catch error
      msg.reply "Sorry, I couldn't generate that meme. Unexpected response from memecaptain.com: #{body}"
    if result? and result['imageUrl']?
      callback result['imageUrl']
    else
      msg.reply "Sorry, I couldn't generate that meme."

  client = msg.http(memeCaptainUrl).header('Accepts', 'application/json').header('Content-Type', 'application/json')

  client.post(JSON.stringify(memeData)) processResult