-- This comment enforces unit-test coverage for this file:
-- coverage: 0

local http = require 'summit.http'
local menu = require 'summit.menu'
local speech = require 'summit.speech'
local json = require 'json'
 
 
channel.answer()

channel.dial('2679746326', {destinationType='outbound'})
 
channel.hangup()