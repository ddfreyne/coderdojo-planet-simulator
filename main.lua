local planets = {}

function distance(a, b)
	return math.sqrt((a.x - b.x) * (a.x - b.x) + (a.y - b.y) * (a.y - b.y))
end

function love.load()
	table.insert(planets, {
		pos    = { x = 600, y = 300 },
		radius = 10,
		VelX   = 0,
		VelY   = -120,
		AccelX = 0,
		AccelY = 0,
		Mass   = 10,
		Color  = {0, 255, 0}
	})
	table.insert(planets, {
		pos    = { x = 200, y = 310 },
		radius = 10,
		VelX   = 0,
		VelY   = 120,
		AccelX = 0,
		AccelY = 0,
		Mass   = 10,
		Color  = {0, 0, 255}
	})
	table.insert(planets, {
		pos    = { x = 400, y = 300 },
		radius = 40,
		VelX   = 0,
		VelY   = 0,
		AccelX = 0,
		AccelY = 0,
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
				local unitX = (planetA.pos.x - planetB.pos.x) / d
				local unitY = (planetA.pos.y - planetB.pos.y) / d
				planetA.AccelX = - 1200 * planetB.Mass / (d * d) * unitX
				planetA.AccelY = - 1200 * planetB.Mass / (d * d) * unitY
			end
		end
	end

	for _, planet in ipairs(planets) do
		planet.VelX = planet.VelX + planet.AccelX * delta
		planet.VelY = planet.VelY + planet.AccelY * delta
		planet.pos.x = planet.pos.x + planet.VelX * delta
		planet.pos.y = planet.pos.y + planet.VelY * delta
	end
end
