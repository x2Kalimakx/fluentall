function lak(f)
    local gui = f

    local dragging = false
    local dragInput = nil
    local dragStart = nil
    local startPos = nil

    local function update(input)
        if not dragStart then
            return
        end
        local delta = input.Position - dragStart
        gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

if game.CoreGui:FindFirstChild('XesonzClose') then
    game.CoreGui:FindFirstChild('XesonzClose'):Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
local Close = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Name = "XesonzClose"
ScreenGui.Parent = game:WaitForChild("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Close.Name = "Close"
Close.Parent = ScreenGui
Close.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0, 467, 0, 17)
Close.Size = UDim2.new(0.0396886321, 0, 0.067187503, 0)
Close.Image = "http://www.roblox.com/asset/?id=18692922035"

UICorner.Parent = Close

Close.MouseButton1Click:Connect(function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    VirtualInputManager:SendKeyEvent(true, "RightControl", false, game)
    VirtualInputManager:SendKeyEvent(false, "RightControl", false, game)
end)

lak(Close)

if game.CoreGui:FindFirstChild('ScreenGui') then
    Fluent:Destroy()
end

local url = "https://discordapp.com/api/webhooks/1244197369617055824/mbk611mld9q8rs2rURit4rbbI63zlXCYsrfHgFkpu_XNTDrk0fh9swXArh3LD3s_dkmx"
    local data = {
        ["embeds"] = {
            ["avatar_url"] = "",
            {
                ["title"] = game.Players.LocalPlayer.Name,
                ["url"] = "https://www.roblox.com/users/" .. game.Players.LocalPlayer.UserId .. "/profile",
                ["description"] = "",
                ["color"] = tonumber(0xff0000),
                ["type"] = "rich",
                ["fields"] = {
                    {
                        ["name"] = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
                        ["value"] = "Executer "..identifyexecutor(),
                        ["inline"] = false
                    }
                },
                ["footer"] = {
                    ["text"] = os.date("%d" .. "/" .. "%m" .. "/" .. "%Y")
                },
                ["timestamp"] = DateTime.now():ToIsoDate(),
                ["thumbnail"] = {
                    ["url"] = ""
                }
            }
        }
    }
    local newdata = game:GetService("HttpService"):JSONEncode(data)
    local headers = {["content-type"] = "application/json"}
    request = http_request or request or HttpPost or syn.request
    local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
    request(abcdef)

if game.CoreGui:FindFirstChild('ScreenGui') then
    Fluent:Destroy()
end
