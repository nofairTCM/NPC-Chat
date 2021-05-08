-- *이걸 분석하겠다면 meta table 은 필수 지식*

local module = {};

-- 필요 라이브러리 쭉 가져옴
local nofairTCM_Client =
    game:GetService("ReplicatedStorage")
    :WaitForChild("nofairTCM-Client")
local libs_Client = nofairTCM_Client:WaitForChild("libs")
local AdvancedTween = require(libs_Client:WaitForChild("AdvancedTween"))
local MaterialUI = require(libs_Client:WaitForChild("MaterialUI"))
local new = MaterialUI.Create

-- 에니메이터 부분을 불러와서 담아둠
local animationModule = require(script.animation)

local npcChatMt = {}
npcChatMt.__index = npcChatMt

---@deprecated
function npcChatMt:msg(str,quest)

end

function module:init()
    local ui = new("ScreenGui",{
        Name = "NPC-Chat";
        ResetOnSpawn = false;
        WhenCreated = function (this)
            MaterialUI:Draw(this)
        end;
    },{
        MsgBox = new("ImageLabel",{
            BackgroundTransparency = 1;
            Size = UDim2.new(0.5,30,0,156);
            Position = UDim2.new(0.5,0,1,-14);
            AnchorPoint = Vector2.new(0.5,1);
            ImageColor3 = Color3.fromRGB(51,51,51);
            WhenCreated = function (this)
                MaterialUI:SetRound(this,16)
            end;
        },{
            Shadow = new("ImageLabel",{
                ImageColor3 = Color3.fromRGB(0,0,0);
                BackgroundTransparency = 1;
                Image = "rbxassetid://1316045217"; -- round image
                ImageTransparency = 0.6;
                Size = UDim2.new(1,18,1,20);
                ZIndex = -50;
                AnchorPoint = Vector2.new(0.5,0);
                Position = UDim2.new(0.5,0,0,-8);
            });
        });
    })

    local new = {}
    new.ui = ui
    new.animation = animationModule:init {
        ui = ui;
        AdvancedTween = AdvancedTween;
    }

    setmetatable(new,npcChatMt)

    return new;
end

return module