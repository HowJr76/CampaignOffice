-- This comment enforces unit-test coverage for this file:
-- coverage: 0

local http = require 'summit.http'
local menu = require 'summit.menu'
local speech = require 'summit.speech'
local json = require 'json'
 
 
channel.answer()

local menu = require 'summit.menu'
 
local my_ivr = menu()
 
function call_Howard()
    channel.say("Calling Howard.")
	channel.dial('2679746326', {destinationType='outbound'})
end
function invalid_response()
    channel.say("That number is not a valid response.")
end
 
 
my_ivr.add('1', "To reach Howard, press 1.", call_Howard)
my_ivr.default(invalid_response)
 
my_ivr.run()
channel.hangup()