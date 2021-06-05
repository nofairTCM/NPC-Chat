local module = {};

-- UI 엘리맨트 애니메이팅 담당 코드

-- init 에서 콜해서 lib 랑 ui 부분 받아와서
-- 에니메이터 만든 후 패키징 해서 클래스로
-- 다시 반환함

-- *이걸 분석하겠다면 meta table 은 필수 지식*

local animationMT = {};
animationMT.__index = animationMT

local upPos = UDim2.new(0.5,0,1,-14)
local downPos = UDim2.new(0.5,0,1,300)
local rot = -17

function animationMT:popup()
    self.AdvancedTween:StopTween(self.ui)
    self.ui.MsgBox.Rotation = rot
    self.ui.MsgBox.Position = downPos

    self.AdvancedTween:RunTween(self.ui.MsgBox,{
        Time = 0.62;
        Easing = self.AdvancedTween.EasingFunctions.Exp2;
        Direction = self.AdvancedTween.EasingDirection.Out;
    },{
        Rotation = 0;
        Position = upPos;
    })
end

function animationMT:close()
    self.AdvancedTween:StopTween(self.ui)
    self.ui.MsgBox.Rotation = 0
    self.ui.MsgBox.Position = upPos

    self.AdvancedTween:RunTween(self.ui.MsgBox,{
        Time = 0.62;
        Easing = self.AdvancedTween.EasingFunctions.Exp2;
        Direction = self.AdvancedTween.EasingDirection.Out;
    },{
        Rotation = rot;
        Position = downPos;
    })
end

function module:init(data)
    local new = {}

    new.ui = data.ui -- ui 부분을 arg 에서 가져옴
    new.AdvancedTween = data.AdvancedTween -- 라이브러리 (애니메이터) 를 arg 에서 가져옴

    setmetatable(new,animationMT)
    return new
end

return module