# Description:
#   Get a stock price
#   Heavily ripped from "stock.coffee" by eliperkins
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot stock <ticker> - Get a stock price
#
# Author:
#   jamiew
#
# from https://github.com/vhx/spacecat/blob/master/scripts/stock-short.coffee

module.exports = (robot) ->
  robot.respond /(stock|quote) \$?([\w .-_]+)/i, (msg) ->

    ticker = escape(msg.match[2])

    msg.http('http://finance.google.com/finance/info?client=ig&q=' + ticker)
      .get() (err, res, body) ->
        if err or not body
          msg.send "Error fetching stock :( " + err
        else
          result = JSON.parse(body.replace(/\/\/ /, ''))
          msg.send ticker.toUpperCase() + ": $"+result[0].l_cur + " (#{result[0].c})" + ' ' + 'http://finance.yahoo.com/q?s=' + ticker
          msg.send "http://chart.finance.yahoo.com/t?lang=en-US&region=US&width=300&height=180&s=" + ticker + "#.png"
