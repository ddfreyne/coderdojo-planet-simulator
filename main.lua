local planets = {}

function distance(x1, y1, x2 ,y2)
	return math.sqrt((x1-x2) * (x1-x2) + (y1-y2) * (y1-y2))
end

function love.load()
	table.insert(planets, {
		X      = 600,
		Y      = 300,
		Radius = 10,
		VelX   = 0,
		VelY   = -120,
		AccelX = 0,
		AccelY = 0,
		Mass   = 100,
		Color  = {0, 255, 0}
	})
	table.insert(planets, {
		X      = 400,
		Y      = 290,
		Radius = 100,
		VelX   = 0,
		VelY   = 0,
		AccelX = 0,
		AccelY = 0,
		Mass   = 2000,
		Color  = {255, 0, 0}
	})
end

function love.draw()
	for _, planet in ipairs(planets) do
		love.graphics.setColor(planet.Color[1], planet.Color[2], planet.Color[3])
		love.graphics.circle('fill', planet.X, planet.Y, planet.Radius, 50)
	end
end

function love.update(delta)
	for indexA, planetA in ipairs(planets) do
		for indexB, planetB in ipairs(planets) do
			if indexA ~= indexB then
				local d = distance(planetA.X, planetA.Y, planetB.X, planetB.Y)
				local unitX = (planetA.X - planetB.X) / math.abs(planetA.X - planetB.X)
				local unitY = (planetA.Y - planetB.Y) / math.abs(planetA.Y - planetB.Y)
				planetA.AccelX = - 1200 * planetB.Mass / (d * d) * unitX
				planetA.AccelY = - 1200 * planetB.Mass / (d * d) * unitY
			end
		end
	end

	for _, planet in ipairs(planets) do
		planet.VelX = planet.VelX + planet.AccelX * delta
		planet.VelY = planet.VelY + planet.AccelY * delta
		planet.Y = planet.Y + planet.VelY * delta
		planet.X = planet.X + planet.VelX * delta
	end
end
