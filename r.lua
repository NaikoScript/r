-- Data Logging Naiko Service --

-- the others will go open source soon since they arent as popular as this one

--- KEY INFO ---
-- This data is not used maliciously its only used to take feedback and to know how popular the script is (prob going to make it send less data in the future)
-- It will not be used as proof to get you banned on roblox or anything like that
-- Dont like it still? you can opt out with the tutorail(s) below
-- Trying to abuse the data being sent will get you banned from the system fully (its automatic)
-- If you have used it while being opted in and want out then join my discord server and make a ticket (yes even if it doesn't say its used for that) and provide the your information so it can be fully deleted
----------------

--[[ How to opt out from Naiko Service:
    1. Use this loadstring instead if you are not already using: 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Plus/main/Script"))()
    Thats it you've done it lol, stay secret mr agent 🕵️‍♂️
]]

local LocalPlayer = game.Players.LocalPlayer
local TradeBanned = false
local UserType = LocalPlayer:WaitForChild("NaikoUserType").Value or 0
local ScriptOrigin = "BP"
local Url = "https://naikoservice.naikomails.workers.dev/"
if LocalPlayer:FindFirstChild("tradebanned") and LocalPlayer.tradebanned.Value == true then
	TradeBanned = true
end
if UserType == 1 then
    UserMessage = "CompleteNewUser"
elseif UserType == 2 then
    UserMessage = "NewScriptUser"
elseif UserType == 3 then
    UserMessage = "NaikoScriptsUser"
else
    UserMessage = "Fail"
end

local function SendData(DataTable,Url)
    local request = http_request or request or HttpPost or syn.request
    request({Url = Url, Body = game:GetService("HttpService"):JSONEncode(DataTable), Method = "POST", Headers = {["content-type"] = "application/json"}})
end

local function HideString(str)
    local length = #str
    local num = math.floor(length * 0.40) -- 40% of the string is hidden
    return length > 5 and str:sub(1, length - num) .. string.rep("*", num) or string.rep("*", num) .. str:sub(num + 1)
end

SendData({
    Player = HideString(game.Players.LocalPlayer.Name), -- Name is not fully shown anymore
    GameMode = game.PlaceId,
    TB = TradeBanned,
    UserType = UserType
},
Url..ScriptOrigin)

task.spawn(function() -- funni infinite yield naiko plugin installer 
local function AddNaikoIntoInfiniteYield()
        if isfile("IY_FE.iy") then
            local Data = game:GetService("HttpService"):JSONDecode(readfile("IY_FE.iy"))
            if Data ~= nil and type(Data) == type({}) then
                if table.find(Data.PluginsTable,"NaikoScript/Naiko.iy") then
                    return
                end
                table.insert(Data.PluginsTable,"NaikoScript/Naiko.iy")
                writefile("IY_FE.iy",game:GetService("HttpService"):JSONEncode(Data))
            end
        else
        local currentShade1 = Color3.fromRGB(36, 36, 37)
        local currentShade2 = Color3.fromRGB(46, 46, 47)
        local currentShade3 = Color3.fromRGB(78, 78, 79)
        local currentText1 = Color3.new(1, 1, 1)
        local currentText2 = Color3.new(0, 0, 0)
        local currentScroll = Color3.fromRGB(78,78,79)
        local defaultsettings = {
                prefix = ';';
                StayOpen = false;
                espTransparency = 0.3;
                keepIY = true;
                logsEnabled = false;
                jLogsEnabled = false;
                aliases = {};
                binds = {};
                WayPoints = {};
                PluginsTable = {"NaikoScript/Naiko.iy"};
                currentShade1 = {currentShade1.R,currentShade1.G,currentShade1.B};
                currentShade2 = {currentShade2.R,currentShade2.G,currentShade2.B};
                currentShade3 = {currentShade3.R,currentShade3.G,currentShade3.B};
                currentText1 = {currentText1.R,currentText1.G,currentText1.B};
                currentText2 = {currentText2.R,currentText2.G,currentText2.B};
                currentScroll = {currentScroll.R,currentScroll.G,currentScroll.B};
                eventBinds = {OnExecute = "",OnSpawn = "",OnDied = "",OnDamage = "",OnKilled = "",OnJoin = "",OnLeave = "",OnChatted = ""}
            }
            local defaults = game:GetService("HttpService"):JSONEncode(defaultsettings)
            writefile("IY_FE.iy",defaults)
        end
    end
    if isfolder("NaikoScript") then
        writefile("NaikoScript/Naiko.iy",tostring(game:HttpGet('https://raw.githubusercontent.com/NaikoScript/r/main/InfiniteYield/Naiko.iy')))
        AddNaikoIntoInfiniteYield()
    else
        makefolder("NaikoScript")
        writefile("NaikoScript/Naiko.iy",tostring(game:HttpGet('https://raw.githubusercontent.com/NaikoScript/r/main/InfiniteYield/Naiko.iy')))
        AddNaikoIntoInfiniteYield()
    end
end)