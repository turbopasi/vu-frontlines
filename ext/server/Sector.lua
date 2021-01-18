local Sector = class("Sector")

function Sector:__init(name, coords, width, height)

  self.name   = name
  self.width  = width
  self.height = height
  self.area   = width * height
  self.coords = {
    a = coords.a,
    b = coords.b,
    c = coords.c,
    d = coords.d
  }

  self.state = 0
  self._onChangeState = nil

end

function Sector:ChangeState(newState)
  local oldState = self.state
  self.state = newState
  if self._onChangeState ~= nil then
    self._onChangeState(oldState, newState)
  end
end

function Sector:AddOnChangeState(callback)
  self._onChangeState = callback
end

function Sector:RemoveOnChangeState()
  self._onChangeState = nil
end

function Sector:IsPlayerInside(player)
end

function Sector:Reset()
  self.state = 0
end


-- local sectorA = Sector("A", {
--   a = Point(0,0),
--   b = Point(0,0),
--   c = Point(0,0),
--   d = Point(0,0)
-- }, 100, 200)