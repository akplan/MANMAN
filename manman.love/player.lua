-- ========================
-- MANMAN: player.lua
--
-- Contains all necessary
-- functions for the player
-- character. Am I doing
-- documentation correctly?
--
-- Author: Alyssa Plan
-- Created 06/14/2016
-- ========================

anim8 = require "anim8"

spritesheet = love.graphics.newImage("lib/manman.png")
grid = anim8.newGrid(32,32,spritesheet:getWidth(),spritesheet:getHeight())

local frame_speed = 0.1
-- Our player table.
player = {
    -- Player's initial position.
    x = 0,
    y = 0,

    -- speed of the player.
    speed = 100,

    -- Required for player sprite animation.
    
    -- Table of all possible player animations.
    
    animations = {
        up    = anim8.newAnimation(grid('3-4',4),frame_speed),
        down  = anim8.newAnimation(grid('3-4',2),frame_speed),
        left  = anim8.newAnimation(grid('2-4',3, 1,4),frame_speed),
        right = anim8.newAnimation(grid('2-4',1, 1,2),frame_speed),
        -- Idle defaults to facing forward.
        idle  = anim8.newAnimation(grid(2,2),frame_speed)
    },
    -- Player's current animation.
    animation = idle,
    animation_name = "idle"
}

-- Sets the direction of the player's idle stance.
function player.setidle()
        if player.animation_name == "up" then
           -- print "got here"
            player.animations.idle = anim8.newAnimation(grid(2,4),frame_speed)
        elseif player.animation_name == "down" then
            player.animations.idle = anim8.newAnimation(grid(2,2),frame_speed)
        elseif player.animation_name == "left" then
             player.animations.idle = anim8.newAnimation(grid(1,3),frame_speed)
        elseif player.animation_name == "right" then
            player.animations.idle = anim8.newAnimation(grid(1,1),frame_speed)
        else
            player.animations.idle = anim8.newAnimation(grid(2,2),frame_speed)
        end
end

-- Updates player throughout the board.
function player.update(dt)
    -- Player movement. Moves the player in a certain direction,
    -- then sets the idle pose accordingly.
    
    -- Up
    if love.keyboard.isDown("w") then
        player.y = player.y - player.speed * dt
        player.animation = player.animations.up
        player.animation_name = "up"
        player.setidle()
    -- Down
    elseif love.keyboard.isDown("s") then
        player.y = player.y + player.speed * dt
        player.animation = player.animations.down
        player.animation_name = "down"
        player.setidle()
    -- Left
    elseif love.keyboard.isDown("a") then
        player.x = player.x - player.speed * dt
        player.animation = player.animations.left
        player.animation_name = "left"
        player.setidle()
    -- Right
    elseif love.keyboard.isDown("d") then
        player.x = player.x + player.speed * dt
        player.animation = player.animations.right
        player.animation_name = "right"
        player.setidle()
    else
        player.animation = player.animations.idle
        player.animation_name = "idle"
    end
end

-- Draws player with sprite animation.
function player.draw()
    player.animation:draw(spritesheet,player.x,player.y)
end
