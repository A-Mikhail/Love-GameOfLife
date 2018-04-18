local Text = {}
    
function Text:newObject()
    local object = {}
    object.text = "Hello! "

    local greetingStr = ", glad to see you!" 

    function object:sayHello(name)
        print(self.text .. name .. greetingStr)
    end

    function object.increment()
        -- do something, available
        -- only inside the Text object    
    end

    function object:destroy()
        self.text = nil
    end

    return object
end

local sentence = Text:newObject()

sentence:sayHello("Mikhail")
