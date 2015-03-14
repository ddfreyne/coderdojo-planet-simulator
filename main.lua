local bigX = love.window.getWidth()/2
local bigY = love.window.getHeight()/2
local bigVelX = 0
local bigVelY = 0
local bigAccelX = 0
local bigAccelY = 0
local bigMass = 2000

local smallX = 600
local smallY = 300
local smallVelX = 0
local smallVelY = 0
local smallAccelX = 0
local smallAccelY = 0
local smallMass = 100

function love.draw()
	love.graphics.setColor(255, 0, 0)
	love.graphics.circle('fill', bigX, bigY, 100, 50)

	love.graphics.setColor(0, 255, 0)
	love.graphics.circle('fill', smallX, smallY, 10, 50)
end

function love.update(delta)
	smallY = smallY + smallVelY * delta
	smallX = smallX + smallVelX * delta
	smallVelX = smallVelX + smallAccelX*delta
	smallVelY = smallVelY + smallAccelY*delta
end
