--rat clickers script made by pedroca2010

local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
 
local PhantomForcesWindow = Library:NewWindow("Rat Clickers UGC")
 
local KillingCheats = PhantomForcesWindow:NewSection("Main")
 
KillingCheats:CreateToggle("Auto Click", function(value)
while wait(0.001) do
game:GetService("ReplicatedStorage"):WaitForChild("ClickEvent"):FireServer()
end
end)

KillingCheats:CreateToggle("Auto Spin Wheel", function(value)
while wait(3) do
game:GetService("ReplicatedStorage").Events.SpinWheel:InvokeServer()
end
end)

KillingCheats:CreateToggle("Auto Upgrade level", function(value)
while wait(2) do
game:GetService("ReplicatedStorage").TransferRatsEvent:FireServer()
end
end)

KillingCheats:CreateButton("Anti AFK", function()
while not game:IsLoaded() do wait() end
repeat wait() until game.Players.LocalPlayer.Character
Players = game:GetService("Players")
local GC = getconnections or get_signal_cons
if GC then
	for i,v in pairs(GC(Players.LocalPlayer.Idled)) do
		if v["Disable"] then v["Disable"](v)
		elseif v["Disconnect"] then v["Disconnect"](v)
		end
	end
else
  Players.LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
  end)
end
game.StarterGui:SetCore('SendNotification', { Title = 'Stop Exploiting'; Text = 'Anti-AFK activated!'; })
end)

KillingCheats:CreateButton("Join Small server", function()
    local Http = game:GetService("HttpService")
    local TPS = game:GetService("TeleportService")
    local Api = "https://games.roblox.com/v1/games/"
    
    local _place = game.PlaceId
    local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
    function ListServers(cursor)
       local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
       return Http:JSONDecode(Raw)
    end
    
    local Server, Next; repeat
       local Servers = ListServers(Next)
       Server = Servers.data[1]
       Next = Servers.nextPageCursor
    until Server
    
    TPS:TeleportToPlaceInstance(_place,Server.id,game:GetService('Players').LocalPlayer)
end)

local KillingCheats = PhantomForcesWindow:NewSection("Ban Risk⚠️")

KillingCheats:CreateToggle("Auto Collect Cheese", function(value)
    _G.Loop = true
while _G.Loop and task.wait(5) do
    local player = game.Players.LocalPlayer
    local character = player.Character
    
    local parts = game.Workspace:GetDescendants()
    for _, part in ipairs(parts) do
        if part:IsA("BasePart") and part.Name == "RespawningCoin" then 
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            part.CFrame = CFrame.new(humanoidRootPart.Position)
        end
    end
end
end)

KillingCheats:CreateButton("Auto Obby", function()
    local function teleportToNamedPart(partName)
        local parts = game.Workspace:GetDescendants()
        for _, part in ipairs(parts) do
            if part:IsA("Part") and part.Name == partName then
                game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(part.CFrame)
            end
        end
    end
    
    teleportToNamedPart("End")
end)

KillingCheats:CreateButton("Collect Daily Chest", function()
game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(29.6415043, 65.554512, -188.470978, 0.994126976, -1.38925482e-09, -0.108219825, -4.23240692e-10, 1, -1.67253074e-08, 0.108219825, 1.66728817e-08, 0.994126976)
end)

KillingCheats:CreateButton("Collect Group Chest", function()
game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-56.4583168, 42.7114105, -90.834343, 0.90288341, -3.62789763e-08, 0.429885507, 1.43301948e-08, 1, 5.42946417e-08, -0.429885507, -4.28613873e-08, 0.90288341)
end)

local KillingCheats = PhantomForcesWindow:NewSection("Credits")

KillingCheats:CreateButton("Made by Pedroga7008", function()
print("love God because he love you")
end)
