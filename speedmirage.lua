local Players = game:GetService("Players")
local player = Players.LocalPlayer
local chr = player.Character or player.CharacterAdded:Wait()
local hrp = chr:WaitForChild("HumanoidRootPart")

local running = false

local function getpos()
    return hrp.CFrame
end

local function mirage()
    while running do
        local pos = getpos()

        -- Move right
        hrp.CFrame = pos + (pos.RightVector * 5)
        task.wait()

        -- Move back to center
        hrp.CFrame = pos
        task.wait()

        -- Move left
        hrp.CFrame = pos + (pos.RightVector * -5)
        task.wait()

        -- Move back to center
        hrp.CFrame = pos
        task.wait()
    end
end

-- UI part
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3"))()

local w = library:CreateWindow("Speed Mirage")
local b = w:CreateFolder("Speed")

b:Toggle("Toggle Speed Mirage", function(v)
    running = v
    if running then
        task.spawn(mirage)
    end
end)
