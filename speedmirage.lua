local Players = game:GetService("Players")
local player = Players.LocalPlayer
local chr = player.Character or player.CharacterAdded:Wait()
local hrp = chr:WaitForChild("HumanoidRootPart")

local function getpos()
    return hrp.CFrame
end

local function mirage(state)
    local running = state
    
    while running do
        -- Move right
        hrp.CFrame = getpos() + (getpos().RightVector * 5)
        task.wait(0.05) -- small delay
        
        -- Move left
        hrp.CFrame = getpos() + (getpos().RightVector * -5)
        task.wait(0.05)
    end
end

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()

local w = library:CreateWindow("speed mirage") -- Creates the window

local b = w:CreateFolder("B") -- Creates the folder(U will put here your buttons,etc)

b:Label("speed mirage",{
    TextSize = 25; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
    BgColor = Color3.fromRGB(69,69,69); -- Self Explaining
    
}) 

b:Toggle("Toggle Speed Mirage",function(v)
    shared.toggle = v
    mirage(shared.toggle)
end)
