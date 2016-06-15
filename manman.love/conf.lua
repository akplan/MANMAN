-- ===========================================
-- MANMAN: conf.lua
--
-- Configuration files necessary for the game.
--
-- Author: Alyssa Plan
-- Created: 06/14/2016
-- ===========================================


function love.conf(t)
    -- Set the window title.
    t.window.title = "MANMAN: DLC Pack #2"
    
    -- Disable unnecessary modules for optimization.
    t.modules.joystick = false
    t.modules.physics = false
end
