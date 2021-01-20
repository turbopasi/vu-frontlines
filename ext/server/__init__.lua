-- so we have 2 midpoints (starting area)
-- based on this we can calculate : 
  -- distance 
  -- slope 

  local UtilClass = require('__shared/Util')
  local Area = require('__shared/Area')

  local pointStart = {x = 1, y = 2}
  local pointEnd   = {x = 3, y = 9}
  local width      = 6

  local distance = Util:GetDistanceBetweenPoints(pointStart, pointEnd)
  local distanceStep = distance / 6

  -- find points along the line
  local pointOnLine1 = Util:GetPointOnLine(pointStart, pointEnd, distanceStep)
  local pointOnLine2 = Util:GetPointOnLine(pointOnLine1, pointEnd, distanceStep)
  local pointOnLine3 = Util:GetPointOnLine(pointOnLine2, pointEnd, distanceStep)
  local pointOnLine4 = Util:GetPointOnLine(pointOnLine3, pointEnd, distanceStep)
  local pointOnLine5 = Util:GetPointOnLine(pointOnLine4, pointEnd, distanceStep)

  -- corner points of first area
  local coords1 = Util:GetCoordinatesOfRectangle(pointStart, pointOnLine1, width)

  print(coords1)

  local area1 = Area(coords1.a, coords1.b, coords1.c, coords1.d)

  print(area1.width)
  print(area1.height)
  print(area1.area)
