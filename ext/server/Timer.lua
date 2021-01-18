local Timer = class("Timer")

function Timer:__init(timeInSeconds, callback)

  self.callback = callback
  self.object = object
  self.maxTime = timeInSeconds

  self.elapsedTime = 0
  self.event = nil

end

function Timer:OnUpdate(deltaTime, simulationDeltaTime)
  self.elapsedTime = self.elapsedTime + deltaTime
  if self.elapsedTime >= self.maxTime then
    self.callback()
    self.elapsedTime = 0
  end
end

function Timer:Stop()
  self.event:Unsubscribe()
  self.event = nil
end

function Timer:Start()
  self.event = Events:Subscribe('Engine:Update', self, self.OnUpdate)
end

return Timer

-- HOW TO USE

-- local Timer = require('Timer')
-- local myTimer = Timer(2, function ()
--   print("TIMER !")
-- end)
-- myTimer:Start()