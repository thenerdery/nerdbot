# Description:
#   Utilizes Pokémon Fusion (http://pokemon.alexonsager.net/) to merge two Pokémon (original 151 only) images together.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   [botname] fuse [pokemon] with [pokemon]
# Author:
#   Justin Mullin

querystring = require 'querystring';

module.exports = (robot) ->
  robot.respond /fuse\s+(.*)\s+(and|with)\s+(.*)/i, (msg) ->
    nameA = msg.match[1].toLowerCase()
    nameB = msg.match[3].toLowerCase()
    url = "http://images.alexonsager.net/pokemon/fused/:a/:a.:b.png"

    idA = pokemon[nameA]
    idB = pokemon[nameB]

    msg.send nameError(nameA) if (!idA?)
    msg.send nameError(nameB) if (!idB?)
    
    if (errorMessage?)
      msg.send errorMessage

    if (idA? && idB?)
      msg.send (url.replace /:a/g, idA).replace /:b/g, idB

# Convenient way to capitalize strings.
String.prototype.capitalize = () -> this.charAt(0).toUpperCase() + this.slice(1)

# Handles a mis-named Pokémon, suggesting a correction if there is a similar name in the map.
nameError = (name) ->
  relevance = Object.keys(pokemon).sort (a, b) -> levenshteinDistance(name, a) - levenshteinDistance(name, b)
  suggestion = relevance[0].capitalize()
  errorMessage = "#{name.capitalize()} isn't a 1st generation Pokémon."
  if (levenshteinDistance(name, suggestion) <= suggestion.length)
    errorMessage += "  Perhaps you meant #{suggestion}?"

  return errorMessage

# Calculates the levenshtein distance (minimum number of edits to match) between two strings to determine similarity.
levenshteinDistance = (stringA, stringB) ->
  lengthA = stringA.length
  lengthB = stringB.length
  return lengthB if lengthA is 0
  return lengthA if lengthB is 0

  distance = []
  distance[i] = [] for i in [0..lengthA]
  distance[i][0] = i for i in [0..lengthA]
  distance[0][j] = j for j in [0..lengthB]

  for costA, i in stringA
    for costB, j in stringB
      cost = if costA is costB then 0 else 1
      distance[i+1][j+1] = Math.min distance[i][j+1]+1, distance[i+1][j]+1, distance[i][j] + cost

  distance[lengthA][lengthB]

# Mapping of each Pokémon name to ID for the 1st generation 151 supported.
pokemon =
  "bulbasaur": 1
  "ivysaur": 2
  "venusaur": 3
  "charmander": 4
  "charmeleon": 5
  "charizard": 6
  "squirtle": 7
  "wartortle": 8
  "blastoise": 9
  "caterpie": 10
  "metapod": 11
  "butterfree": 12
  "weedle": 13
  "kakuna": 14
  "beedrill": 15
  "pidgey": 16
  "pidgeotto": 17
  "pidgeot": 18
  "rattata": 19
  "raticate": 20
  "spearow": 21
  "fearow": 22
  "ekans": 23
  "arbok": 24
  "pikachu": 25
  "raichu": 26
  "sandshrew": 27
  "sandslash": 28
  "nidoran(f)": 29
  "nidorina": 30
  "nidoqueen": 31
  "nidoran(m)": 32
  "nidorino": 33
  "nidoking": 34
  "clefairy": 35
  "clefable": 36
  "vulpix": 37
  "ninetales": 38
  "jigglypuff": 39
  "wigglytuff": 40
  "zubat": 41
  "golbat": 42
  "oddish": 43
  "gloom": 44
  "vileplume": 45
  "paras": 46
  "parasect": 47
  "venonat": 48
  "venomoth": 49
  "diglett": 50
  "dugtrio": 51
  "meowth": 52
  "persian": 53
  "psyduck": 54
  "golduck": 55
  "mankey": 56
  "primeape": 57
  "growlithe": 58
  "arcanine": 59
  "poliwag": 60
  "poliwhirl": 61
  "poliwrath": 62
  "abra": 63
  "kadabra": 64
  "alakazam": 65
  "machop": 66
  "machoke": 67
  "machamp": 68
  "bellsprout": 69
  "weepinbell": 70
  "victreebel": 71
  "tentacool": 72
  "tentacruel": 73
  "geodude": 74
  "graveler": 75
  "golem": 76
  "ponyta": 77
  "rapidash": 78
  "slowpoke": 79
  "slowbro": 80
  "magnemite": 81
  "magneton": 82
  "farfetchd": 83
  "doduo": 84
  "dodrio": 85
  "seel": 86
  "dewgong": 87
  "grimer": 88
  "muk": 89
  "shellder": 90
  "cloyster": 91
  "gastly": 92
  "haunter": 93
  "gengar": 94
  "onix": 95
  "drowzee": 96
  "hypno": 97
  "krabby": 98
  "kingler": 99
  "voltorb": 100
  "electrode": 101
  "exeggcute": 102
  "exeggutor": 103
  "cubone": 104
  "marowak": 105
  "hitmonlee": 106
  "hitmonchan": 107
  "lickitung": 108
  "koffing": 109
  "weezing": 110
  "rhyhorn": 111
  "rhydon": 112
  "chansey": 113
  "tangela": 114
  "kangaskhan": 115
  "horsea": 116
  "seadra": 117
  "goldeen": 118
  "seaking": 119
  "staryu": 120
  "starmie": 121
  "mr. mime": 122
  "scyther": 123
  "jynx": 124
  "electabuzz": 125
  "magmar": 126
  "pinsir": 127
  "tauros": 128
  "magikarp": 129
  "gyarados": 130
  "lapras": 131
  "ditto": 132
  "eevee": 133
  "vaporeon": 134
  "jolteon": 135
  "flareon": 136
  "porygon": 137
  "omanyte": 138
  "omastar": 139
  "kabuto": 140
  "kabutops": 141
  "aerodactyl": 142
  "snorlax": 143
  "articuno": 144
  "zapdos": 145
  "moltres": 146
  "dratini": 147
  "dragonair": 148
  "dragonite": 149
  "mewtwo": 150
  "mew": 151