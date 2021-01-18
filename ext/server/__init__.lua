local Util = class('Util')
local Point = require('Point')

-- given 2 midpoints and the width of a rectangle,
-- calculate coordinates of the corners
function Util:GetCoordinatesOfRectangle(p, q, width)

  -- calc slop of side
  local slope = (p.x - q.x) / (q.y - p.y)

  -- calc displacement along axes
  local dx = width / ( math.sqrt( 1 + ( slope * slope ) ) * 0.5 )
  local dy = slope * dx

  local coordinates = {
    a = Point(p.x - dx, p.y - dy),
    b = Point(p.x + dx, p.y + dy),
    c = Point(q.x - dx, q.y - dy),
    d = Point(q.x + dx, q.y + dy)
  }

  return coordinates

end

function Util:GetDistanceBetweenPoints(p, q)
  local a = p.x - q.x
  local b = p.y - q.y
  return math.sqrt( a * a + b * b )
end
