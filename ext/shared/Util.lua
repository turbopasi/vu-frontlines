local Util = class("Util")

function Util:__init()
end 

-- given 2 points
-- calculate the distance between
function Util:GetDistanceBetweenPoints(p, q)
  local a = p.x - q.x
  local b = p.y - q.y
  return math.sqrt( a * a + b * b )
end

-- given 2 points
-- calculate the slope of the connecting line
function Util:GetSlopeOfLine(p, q)
  return (q.y - p.y) / (q.x - p.x)
end

-- given 2 midpoints and the width of a rectangle,
-- calculate coordinates of the corners
function Util:GetCoordinatesOfRectangle(p, q, width)

  -- calc slop of side
  -- local slope = (p.x - q.x) / (q.y - p.y)
  local slope = self:GetSlopeOfLine(p, q)

  print("slope " .. slope)

  -- calc displacement along axes
  local dx = width / ( math.sqrt( 1 + ( slope * slope ) ) * 0.5 )
  local dy = slope * dx

  local coordinates = {
    a = { x = q.x - dx, y = q.y - dy },
    b = { x = q.x + dx, y = q.y + dy },
    c = { x = p.x + dx, y = p.y + dy },
    d = { x = p.x - dx, y = p.y - dy }
  }

  return coordinates

end

-- given 2 points and a length, get a 3 point on the line
function Util:GetPointOnLine(p, q, distanceToNewPoint)
  
  local distanceBetweenPoints = Util:GetDistanceBetweenPoints(p, q)
  local ratio = distanceToNewPoint / distanceBetweenPoints
  local x = ((1 - ratio) * p.x + ratio * q.x)
  local y = ((1 - ratio) * p.y + ratio * q.y)
   
  return {
    x = x,
    y = y
  }

end

return Util()



