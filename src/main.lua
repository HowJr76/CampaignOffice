-- This comment enforces unit-test coverage for this file:
-- coverage: 0

local http = require 'summit.http'
local menu = require 'summit.menu'
local speech = require 'summit.speech'
local json = require 'json'
 
 
channel.answer()
 
local my_ivr = menu()
 
function the_temperature()
    channel.say("It is currently really fucking cold")
end
function the_conditions()
    channel.say("The conditions are really fucking cold")
end
function invalid_response()
    channel.say("Please press either 1 or 2.")
end
 
my_ivr.add('1', "Press 1 to hear the temperature.", the_temperature)
my_ivr.add('2', "Press 2 to hear the conditions.", the_conditions )
my_ivr.default(invalid_response)
 
my_ivr.run()
 
channel.hangup()