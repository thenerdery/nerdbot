# Nerd-bot

This is The Nerdery's [Hubot](https://github.com/github/hubot). Nerds: Hop in the "Nerd Bot" room if you have questions.

## Running locally (OSX)

*Prerequisites:*

 * Install Homebrew (http://brew.sh/) `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
 * `brew install node`
 * `brew install icu4c`
 * `brew install redis`
 * `chmod 755 bin/hubot`
 
To run, start redis and initialize with a shell

 # `redis-server /usr/local/etc/redis.conf &`
 # `bin/hubot -a shell`

To test your scripts, type commands such as `hubot howdy`

```
Hubot> hubot howdy
Hubot> Good 'aye!, Shell
Hubot> Shell: Hubot at your service!
```

## Contributing

To add new commands, find an [existing Hubot script](http://hubot-script-catalog.herokuapp.com/), or [write your own](https://github.com/github/hubot/blob/master/docs/scripting.md):

* Fork the repo, and clone it locally.
* Add .coffee file to `scripts` folder
* Push to your fork and submit a pull request.
** It is considered good form to add a pun to pun.coffee with every pull request
