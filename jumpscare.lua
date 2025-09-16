--// XModder Premium GUI Script
--// Design & Developed by XModder

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- Color scheme
local accent1 = Color3.fromRGB(100, 180, 255)
local accent2 = Color3.fromRGB(255, 120, 200)
local bgColor = Color3.fromRGB(15, 15, 25)

-- Main ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "XModderPremiumGUI"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Gradient background
local bgFrame = Instance.new("Frame")
bgFrame.Size = UDim2.new(1, 0, 1, 0)
bgFrame.BackgroundColor3 = bgColor
bgFrame.Parent = gui

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 40)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 20))
})
gradient.Rotation = 45
gradient.Parent = bgFrame

-- Decorative corner accents
local function createCorner(xPos, yPos, rot)
    local corner = Instance.new("Frame")
    corner.Size = UDim2.new(0.15, 0, 0.15, 0)
    corner.Position = UDim2.new(xPos, 0, yPos, 0)
    corner.BackgroundColor3 = accent1
    corner.BackgroundTransparency = 0.8
    corner.Rotation = rot
    corner.Parent = bgFrame
    local uicorner = Instance.new("UICorner")
    uicorner.CornerRadius = UDim.new(1,0)
    uicorner.Parent = corner
    return corner
end

createCorner(0,0,-45)
createCorner(1,0,45)
createCorner(0,1,45)
createCorner(1,1,-45)

-- Animated particles
local particles = Instance.new("Frame")
particles.Size = UDim2.new(1,0,1,0)
particles.BackgroundTransparency = 1
particles.Parent = bgFrame

for i=1,25 do
    local dot = Instance.new("Frame")
    dot.Size = UDim2.new(0, math.random(3,6), 0, math.random(3,6))
    dot.Position = UDim2.new(math.random(),0,math.random(),0)
    dot.BackgroundColor3 = Color3.fromRGB(200,200,255)
    dot.BackgroundTransparency = 0.7
    dot.Parent = particles
    local uicorner = Instance.new("UICorner")
    uicorner.CornerRadius = UDim.new(1,0)
    uicorner.Parent = dot

    spawn(function()
        while true do
            local goal = {Position = UDim2.new(math.random(),0,math.random(),0)}
            TweenService:Create(dot,TweenInfo.new(math.random(5,15),Enum.EasingStyle.Linear),goal):Play()
            wait(math.random(5,15))
        end
    end)
end

-- Main frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.35,0,0.45,0)
mainFrame.Position = UDim2.new(0.325,0,0.275,0)
mainFrame.BackgroundColor3 = Color3.fromRGB(20,20,30)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = gui

local uicorner = Instance.new("UICorner")
uicorner.CornerRadius = UDim.new(0.1,0)
uicorner.Parent = mainFrame

local border = Instance.new("UIStroke")
border.Thickness = 2
border.Color = accent1
border.Parent = mainFrame

-- Header
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0.2,0)
title.BackgroundTransparency = 1
title.Text = "XModder Premium Access"
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.TextColor3 = Color3.new(1,1,1)
title.Parent = mainFrame

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1,0,0.1,0)
subtitle.Position = UDim2.new(0,0,0.15,0)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Unlock Premium Features"
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 16
subtitle.TextColor3 = Color3.fromRGB(200,200,200)
subtitle.Parent = mainFrame

-- Input field
local inputBox = Instance.new("TextBox")
inputBox.Size = UDim2.new(0.8,0,0.15,0)
inputBox.Position = UDim2.new(0.1,0,0.35,0)
inputBox.PlaceholderText = "Enter Premium Access Key..."
inputBox.Text = ""
inputBox.BackgroundColor3 = Color3.fromRGB(30,30,45)
inputBox.TextColor3 = Color3.new(1,1,1)
inputBox.Font = Enum.Font.SourceSans
inputBox.TextSize = 18
inputBox.Parent = mainFrame

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0.2,0)
inputCorner.Parent = inputBox

-- Buttons
local submitButton = Instance.new("TextButton")
submitButton.Size = UDim2.new(0.35,0,0.15,0)
submitButton.Position = UDim2.new(0.1,0,0.6,0)
submitButton.BackgroundColor3 = accent1
submitButton.Text = "Activate Premium"
submitButton.Font = Enum.Font.SourceSansBold
submitButton.TextSize = 20
submitButton.TextColor3 = Color3.new(1,1,1)
submitButton.Parent = mainFrame

local submitCorner = Instance.new("UICorner")
submitCorner.CornerRadius = UDim.new(0.2,0)
submitCorner.Parent = submitButton

local supportButton = Instance.new("TextButton")
supportButton.Size = UDim2.new(0.35,0,0.15,0)
supportButton.Position = UDim2.new(0.55,0,0.6,0)
supportButton.BackgroundColor3 = accent2
supportButton.Text = "Support"
supportButton.Font = Enum.Font.SourceSansBold
supportButton.TextSize = 20
supportButton.TextColor3 = Color3.new(1,1,1)
supportButton.Parent = mainFrame

local supportCorner = Instance.new("UICorner")
supportCorner.CornerRadius = UDim.new(0.2,0)
supportCorner.Parent = supportButton

-- Get Key ボタン
local getKeyButton = Instance.new("TextButton")
getKeyButton.Size = UDim2.new(0.4,0,0.12,0)
getKeyButton.Position = UDim2.new(0.3,0,0.8,0)
getKeyButton.BackgroundColor3 = accent2
getKeyButton.Text = "Get Key"
getKeyButton.Font = Enum.Font.SourceSansBold
getKeyButton.TextSize = 20
getKeyButton.TextColor3 = Color3.new(1,1,1)
getKeyButton.Parent = mainFrame

local getKeyCorner = Instance.new("UICorner")
getKeyCorner.CornerRadius = UDim.new(0.2,0)
getKeyCorner.Parent = getKeyButton

-- Hover animations
local function hoverEffect(button,color1,color2)
    button.MouseEnter:Connect(function()
        TweenService:Create(button,TweenInfo.new(0.2),{BackgroundColor3 = color2}):Play()
    end)
    button.MouseLeave:Connect(function()
        TweenService:Create(button,TweenInfo.new(0.2),{BackgroundColor3 = color1}):Play()
    end)
end

hoverEffect(submitButton,accent1,Color3.fromRGB(150,200,255))
hoverEffect(supportButton,accent2,Color3.fromRGB(255,150,220))
hoverEffect(getKeyButton,accent2,Color3.fromRGB(255,150,220))

-- 🔹ここを修正（リンク差し替え済み）
getKeyButton.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://www.roblox.com/share?code=1b900ebd419b9544918dc23ef8ed4139&type=Server")
        notify("Link copied to clipboard!")
    else
        notify("Clipboard function not available!")
    end
end)

-- Notification system
function notify(msg)
    local note = Instance.new("TextLabel")
    note.Size = UDim2.new(0.8,0,0.1,0)
    note.Position = UDim2.new(0.1,0,-0.12,0)
    note.BackgroundColor3 = Color3.fromRGB(25,25,40)
    note.Text = msg
    note.TextColor3 = Color3.new(1,1,1)
    note.Font = Enum.Font.SourceSansBold
    note.TextSize = 18
    note.Parent = mainFrame
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0.2,0)
    corner.Parent = note
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 1.5
    stroke.Color = accent1
    stroke.Parent = note
    spawn(function()
        wait(2.5)
        note:Destroy()
    end)
end

-- Button functions
submitButton.MouseButton1Click:Connect(function()
    local key = inputBox.Text
    if key == "" or string.find(key," ") then
        notify("Invalid Key!")
        return
    end
    notify("Verifying key...")
    wait(2)
    notify("Key invalid or expired.")
end)

supportButton.MouseButton1Click:Connect(function()
    notify("For support, contact XModder#1234")
end)

-- Frame animations
mainFrame.Size = UDim2.new(0,0,0,0)
TweenService:Create(mainFrame,TweenInfo.new(0.6,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
    {Size = UDim2.new(0.35,0,0.45,0)}):Play()

print("XModder Premium GUI loaded.")
