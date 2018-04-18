Text = Object:extend()

function Text:new()
    self.text = "Hello! "
    self.greetingStr = ", glad to see you!"
end

function Text:sayHello(name)
    -- return the string for print in the screen
    return self.text .. name .. self.greetingStr

    -- or comment line above and uncomment below
    -- to print the message to a terminal:
    -- print(self.text .. name .. self.greetingStr)
end

function Text:destroy()
    self.text = nil
    self.greetingStr = nil
end
