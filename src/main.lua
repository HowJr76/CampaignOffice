-- This comment enforces unit-test coverage for this file:
-- coverage: 0

local http = require 'summit.http'
local menu = require 'summit.menu'
local speech = require 'summit.speech'
local json = require 'json'
 
 
channel.answer()
 
local zip = channel.gather({play=speech("Enter your 5-digit zip code to hear current weather conditions"), maxDigits=5, minDigits=5})
 
local params = {q=zip, units="imperial", mode="json"}
 
local res, err = http.get('http://api.openweathermap.org/data/2.5/weather', {data=params})
 
if err then
    channel.say('Unable to contact weather service, goodbye.')
    channel.hangup()
end
 
local res_content = json:decode(res.content)
 
local my_ivr = menu()
 
function the_temperature()
    channel.say("It is currently ".. res_content.main.temp)
end
function the_conditions()
    channel.say(res_content["weather"][1]["description"])
end
function invalid_response()
    channel.say("Please press either 1 or 2.")
end
 
my_ivr.add('1', "Press 1 to hear the temperature.", the_temperature)
my_ivr.add('2', "Press 2 to hear the conditions.", the_conditions )
my_ivr.default(invalid_response)
 
my_ivr.run()
 
channel.hangup()