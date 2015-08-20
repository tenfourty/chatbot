#!/bin/bash

export HUBOT_IRC_SERVER="apigee.irc.slack.com"
export HUBOT_IRC_NICK="chatbot"
export HUBOT_IRC_ROOMS=$(cat channels)
export HUBOT_IRC_USESSL="true"
export HUBOT_IRC_UNFLOOD="false"

bin/hubot -a irc
