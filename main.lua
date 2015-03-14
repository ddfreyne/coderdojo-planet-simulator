local planets = {}

function distance(a, b)
	return math.sqrt((a.x - b.x) * (a.x - b.x) + (a.y - b.y) * (a.y - b.y))
end

function unitVector(a, b)
	local d = distance(a, b)
	return {
		x = (a.x - b.x) / d,
		y = (a.y - b.y) / d
	}
end

function love.load()
	table.insert(planets, {
		pos    = { x = 600, y = 300 },
		radius = 10,
		vel    = { x = 0, y = -120 },
		accel  = { x = 0, y = 0 },
		Mass   = 10,
		Color  = {0, 255, 0}
	})
	table.insert(planets, {
		pos    = { x = 200, y = 310 },
		radius = 10,
		vel    = { x = 0, y = 120 },
		accel  = { x = 0, y = 0 },
		Mass   = 10,
		Color  = {0, 0, 255}
	})
	table.insert(planets, {
		pos    = { x = 400, y = 300 },
		radius = 40,
		vel    = { x = 0, y = 0 },
		accel  = { x = 0, y = 0 },
		Mass   = 4000,
		Color  = {255, 0, 0}
	})
end

function love.draw()
	for _, planet in ipairs(planets) do
		love.graphics.setColor(planet.Color[1], planet.Color[2], planet.Color[3])
		love.graphics.circle('fill', planet.pos.x, planet.pos.y, planet.radius, 50)
	end
end

function love.update(delta)
	for indexA, planetA in ipairs(planets) do
		for indexB, planetB in ipairs(planets) do
			if indexA ~= indexB then
				local d = distance(planetA.pos, planetB.pos)
				local unit = unitVector(planetA.pos, planetB.pos)
				planetA.accel.x = - 1200 * planetB.Mass / (d * d) * unit.x
				planetA.accel.y = - 1200 * planetB.Mass / (d * d) * unit.y
			end
		end
	end

	for _, planet in ipairs(planets) do
		planet.vel.x = planet.vel.x + planet.accel.x * delta
		planet.vel.y = planet.vel.y + planet.accel.y * delta
		planet.pos.x = planet.pos.x + planet.vel.x * delta
		planet.pos.y = planet.pos.y + planet.vel.y * delta
	end
end
