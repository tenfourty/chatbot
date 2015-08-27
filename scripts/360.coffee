# Description:
#   Messing around with apigee 360
#
# Commands:
#   hubot 360 case me <case number>
module.exports = (robot) ->
  robot.hear /(360 case)( me)? (.*)/i, (msg) ->
    c = msg.match[3]
    q = expand: true, apikey: process.env.apikey360
    msg.http("http://amer-demo6-prod.apigee.net/360/cases/" + c)
      .query(q)
      .get() (err, res, body) ->
        ticket = JSON.parse(body)
        ticket = ticket.data[0]
        u = "https://na5.salesforce.com/" + ticket.id
        msg.send("*Subject*: #{ticket.subject}\n*account*: #{ticket.account_name}\n*status*: #{ticket.status}\n*link*: #{u}\n")
