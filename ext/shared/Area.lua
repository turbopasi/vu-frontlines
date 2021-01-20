local Util  = require('__shared/Util')

local Area = class('Area')

function Area:__init(pointA, pointB, pointC, pointD)

  self.coords = {
    a = pointA,
    b = pointB,
    c = pointC,
    d = pointD
  }

  self.width  = Util:GetDistanceBetweenPoints(pointA, pointB)
  self.height = Util:GetDistanceBetweenPoints(pointB, pointC)
  self.area   = self.width * self.height

end

return Area