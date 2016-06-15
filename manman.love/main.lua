-- ===========================
-- MANMAN: main.lua
--
-- Contains all main functions
-- necessary to run MANMAN.
-- I'm trying my darndest to 
-- learn how to write better
-- code, Dad.
--
-- Author: Alyssa Plan
-- Created 06/14/2016
-- ===========================
require "player"


function love.load()
end

-- Draws objects on screen.
function love.draw()
    love.graphics.print("hello world", 400, 300)
    player.draw()
end

function love.update(dt)
    player.update(dt)
    player.animation:update(dt)
end
