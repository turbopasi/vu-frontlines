
local pointP = {
  x = -115,
  y = -182
}

local pointQ = {
  x = -63,
  y = -11
}

local rectWidth = 50

function printCorners(p, q, length)

  -- calc slop of side
  local slope = (p.x - q.x) / (q.y - p.y)

  -- calc displacement along axes
  local dx = length / ( math.sqrt( 1 + ( slope * slope ) ) * 0.5 )
  local dy = slope * dx

  print("A")
  print(p.x - dx)
  print(p.y - dy)

  print("B")
  print(p.x + dx)
  print(p.y + dy)

  print("C")
  print(q.x - dx)
  print(q.y - dy)

  print("D")
  print(q.x + dx)
  print(q.y + dy)

end

function printDistance(p, q)
  local a = p.x - q.x
  local b = p.y - q.y
  print("Distance")
  print(math.sqrt( a * a + b * b ))
end

printCorners(pointP, pointQ, rectWidth)
printDistance(pointP, pointQ)