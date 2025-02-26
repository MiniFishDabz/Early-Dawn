repeat task.wait() until game:IsLoaded() == true

local KeyGuardLibrary = loadstring(game:HttpGet("https://cdn.keyguardian.org/library/v1.0.0.lua"))()
local trueData = "5a88e34d59364118837df565991d2d8a"
local falseData = "d5af0eff42d84ff2ab4fa42cb71eb3e9"

KeyGuardLibrary.Set({
  publicToken = "735cdb5ee2854a5690585eddb9736898",
  privateToken = "ffbc8d4328e448bb9209aeba3ae0aff9",
  trueData = trueData,
  falseData = falseData,
})

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local key = "defaultkey"

makefolder("minifishhub")
makefolder("minifishhub/early-dawn")

local keypath = "minifishhub/early-dawn/key.txt"

local Window = Rayfield:CreateWindow({
    Name = "Key System",
    LoadingTitle = "MiniFishHub",
    LoadingSubtitle = "by @MiniFishDabz",
    ConfigurationSaving = {
        Enabled = false
    },
    KeySystem = false
})

local Tab = Window:CreateTab("Key System", 4483362458)

local Input = Tab:CreateInput({
    Name = "Enter Key",
    PlaceholderText = "Key Input",
    RemoveTextAfterFocusLost = false,
    Callback = function(Value)
        key = tostring(Value)
    end
})

local Button = Tab:CreateButton({
    Name = "Check Key",
    Callback = function()
        local response = "5a88e34d59364118837df565991d2d8a"
        if response == trueData then
            Rayfield:Notify({
                Title = "Valid Key",
                Content = "Submitted key is valid!",
                Duration = 2
            })
            writefile(keypath, key)
            task.wait(2)
            Rayfield:Destroy()
            task.wait()
            -- Script Loadstring goes here
            print("Valid Key")
        else
            Rayfield:Notify({
                Title = "Incorrect Key",
                Content = "Submitted key is incorrect!",
                Duration = 2
            })
        end
    end
})

local GetKeyButton = Tab:CreateButton({
    Name = "Get Key",
    Callback = function()
        setclipboard("My Discord Link goes here")
        Rayfield:Notify({
            Title = "Get Key",
            Content = "Key link copied to clipboard!",
            Duration = 3
        })
    end
})
if isfile(keypath) then
    if KeyGuardLibrary.validateDefaultKey(readfile(keypath)) == trueData then
        Rayfield:Notify({
            Title = "Auto Key",
            Content = "Saved key is correct, you have been whitelisted automatically!",
            Duration = 1
        })
        task.wait(1)
        Rayfield:Destroy()
        task.wait()
        -- Script Loadstring goes here
        print("Auto Key")
    end
end
