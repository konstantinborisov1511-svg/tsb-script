local old_gui = game:GetService("CoreGui"):FindFirstChild("TSB_Advanced_Booster") or game:GetService("Players").LocalPlayer:FindFirstChildOfClass("PlayerGui"):FindFirstChild("TSB_Advanced_Booster")
if old_gui then old_gui:Destroy() end

local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local Players = game:GetService("Players")
local LP = Players.LocalPlayer

local Toggles = {
    SideDash = false, DownSlam = false, Ragdoll = false,
    Oreo = false, King = false, Supa = false
}
local GuiVisible = true

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TSB_Advanced_Booster"
ScreenGui.ResetOnSpawn = false
pcall(function() ScreenGui.Parent = game:GetService("CoreGui") end)
if not ScreenGui.Parent then ScreenGui.Parent = LP:WaitForChild("PlayerGui") end

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
MainFrame.BorderColor3 = Color3.fromRGB(138, 43, 226)
MainFrame.BorderSizePixel = 1
MainFrame.Position = UDim2.new(0.05, 0, 0.25, 0)
MainFrame.Size = UDim2.new(0, 630, 0, 260)
MainFrame.Active = true
MainFrame.ClipsDescendants = true

local function round(obj, r)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, r)
    c.Parent = obj
end
round(MainFrame, 10)

local mainStroke = Instance.new("UIStroke")
mainStroke.Thickness = 1.5
mainStroke.Color = Color3.fromRGB(150, 0, 255)
mainStroke.Parent = MainFrame

local BindInfo = Instance.new("TextLabel")
BindInfo.Parent = MainFrame
BindInfo.BackgroundTransparency = 1
BindInfo.Position = UDim2.new(0, 450, 0, 235)
BindInfo.Size = UDim2.new(0, 170, 0, 20)
BindInfo.Font = Enum.Font.SourceSansItalic
BindInfo.Text = "[ Нажмите K для скрытия ]"
BindInfo.TextColor3 = Color3.fromRGB(130, 130, 150)
BindInfo.TextSize = 12
BindInfo.TextXAlignment = Enum.TextXAlignment.Right

local dragging, dragInput, dragStart, startPos
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)
UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

local function ToggleGui()
    GuiVisible = not GuiVisible
    local targetSize = GuiVisible and UDim2.new(0, 630, 0, 260) or UDim2.new(0, 630, 0, 0)
    TS:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = targetSize}):Play()
end
UIS.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.K then ToggleGui() end
end)
local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 0, 0, 5)
Title.Size = UDim2.new(0, 200, 0, 35)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "⚡ FPS ОПТИМИЗАЦИЯ"
Title.TextColor3 = Color3.fromRGB(180, 100, 255)
Title.TextSize = 14

local GroundBtn = Instance.new("TextButton")
GroundBtn.Parent = MainFrame
GroundBtn.BackgroundColor3 = Color3.fromRGB(22, 18, 30)
GroundBtn.Position = UDim2.new(0, 10, 0, 45)
GroundBtn.Size = UDim2.new(0, 190, 0, 45)
GroundBtn.Font = Enum.Font.SourceSansBold
GroundBtn.Text = "Сжать Землю и Текстуры"
GroundBtn.TextColor3 = Color3.fromRGB(230, 220, 255)
GroundBtn.TextSize = 13
round(GroundBtn, 6)

local EffectsBtn = Instance.new("TextButton")
EffectsBtn.Parent = MainFrame
EffectsBtn.BackgroundColor3 = Color3.fromRGB(22, 18, 30)
EffectsBtn.Position = UDim2.new(0, 10, 0, 100)
EffectsBtn.Size = UDim2.new(0, 190, 0, 45)
EffectsBtn.Font = Enum.Font.SourceSansBold
EffectsBtn.Text = "Вырубить Эффекты"
EffectsBtn.TextColor3 = Color3.fromRGB(230, 220, 255)
EffectsBtn.TextSize = 13
round(EffectsBtn, 6)

local ClearBtn = Instance.new("TextButton")
ClearBtn.Parent = MainFrame
ClearBtn.BackgroundColor3 = Color3.fromRGB(22, 18, 30)
ClearBtn.Position = UDim2.new(0, 10, 0, 155)
ClearBtn.Size = UDim2.new(0, 190, 0, 45)
ClearBtn.Font = Enum.Font.SourceSansBold
ClearBtn.Text = "Очистить карту от Хлама"
ClearBtn.TextColor3 = Color3.fromRGB(230, 220, 255)
ClearBtn.TextSize = 13
round(ClearBtn, 6)

local MacroTitle = Instance.new("TextLabel")
MacroTitle.Parent = MainFrame
MacroTitle.BackgroundTransparency = 1
MacroTitle.Position = UDim2.new(0, 210, 0, 5)
MacroTitle.Size = UDim2.new(0, 200, 0, 35)
MacroTitle.Font = Enum.Font.SourceSansBold
MacroTitle.Text = "🔮 ТЕЧИ И МАКРОСЫ"
MacroTitle.TextColor3 = Color3.fromRGB(200, 120, 255)
MacroTitle.TextSize = 15

local SideDashBtn = Instance.new("TextButton")
SideDashBtn.Parent = MainFrame
SideDashBtn.BackgroundColor3 = Color3.fromRGB(22, 18, 30)
SideDashBtn.Position = UDim2.new(0, 215, 0, 45)
SideDashBtn.Size = UDim2.new(0, 195, 0, 45)
SideDashBtn.Font = Enum.Font.SourceSansBold
SideDashBtn.Text = "Side Dash [T]: OFF"
SideDashBtn.TextColor3 = Color3.fromRGB(230, 220, 255)
SideDashBtn.TextSize = 13
round(SideDashBtn, 6)

local DownSlamBtn = Instance.new("TextButton")
DownSlamBtn.Parent = MainFrame
DownSlamBtn.BackgroundColor3 = Color3.fromRGB(22, 18, 30)
DownSlamBtn.Position = UDim2.new(0, 215, 0, 100)
DownSlamBtn.Size = UDim2.new(0, 195, 0, 45)
DownSlamBtn.Font = Enum.Font.SourceSansBold
DownSlamBtn.Text = "Down Slam [G]: OFF"
DownSlamBtn.TextColor3 = Color3.fromRGB(230, 220, 255)
DownSlamBtn.TextSize = 13
round(DownSlamBtn, 6)

local RagdollBtn = Instance.new("TextButton")
RagdollBtn.Parent = MainFrame
RagdollBtn.BackgroundColor3 = Color3.fromRGB(22, 18, 30)
RagdollBtn.Position = UDim2.new(0, 215, 0, 155)
RagdollBtn.Size = UDim2.new(0, 195, 0, 45)
RagdollBtn.Font = Enum.Font.SourceSansBold
RagdollBtn.Text = "Ragdoll Cancel [V]: OFF"
RagdollBtn.TextColor3 = Color3.fromRGB(230, 220, 255)
RagdollBtn.TextSize = 13
round(RagdollBtn, 6)

local ProTitle = Instance.new("TextLabel")
ProTitle.Parent = MainFrame
ProTitle.BackgroundTransparency = 1
ProTitle.Position = UDim2.new(0, 420, 0, 5)
ProTitle.Size = UDim2.new(0, 200, 0, 35)
ProTitle.Font = Enum.Font.SourceSansBold
ProTitle.Text = "👑 PRO-ТЕЧИ (АВТО)"
ProTitle.TextColor3 = Color3.fromRGB(220, 150, 255)
ProTitle.TextSize = 15

local OreoBtn = Instance.new("TextButton")
OreoBtn.Parent = MainFrame
OreoBtn.BackgroundColor3 = Color3.fromRGB(22, 18, 30)
OreoBtn.Position = UDim2.new(0, 425, 0, 45)
OreoBtn.Size = UDim2.new(0, 195, 0, 45)
OreoBtn.Font = Enum.Font.SourceSansBold
OreoBtn.Text = "Auto Oreo [Z]: OFF"
OreoBtn.TextColor3 = Color3.fromRGB(230, 220, 255)
OreoBtn.TextSize = 13
round(OreoBtn, 6)

local KingBtn = Instance.new("TextButton")
KingBtn.Parent = MainFrame
KingBtn.BackgroundColor3 = Color3.fromRGB(22, 18, 30)
KingBtn.Position = UDim2.new(0, 425, 0, 100)
KingBtn.Size = UDim2.new(0, 195, 0, 45)
KingBtn.Font = Enum.Font.SourceSansBold
KingBtn.Text = "Auto King [X]: OFF"
KingBtn.TextColor3 = Color3.fromRGB(230, 220, 255)
KingBtn.TextSize = 13
round(KingBtn, 6)

local SupaBtn = Instance.new("TextButton")
SupaBtn.Parent = MainFrame
SupaBtn.BackgroundColor3 = Color3.fromRGB(22, 18, 30)
SupaBtn.Position = UDim2.new(0, 425, 0, 155)
SupaBtn.Size = UDim2.new(0, 195, 0, 45)
SupaBtn.Font = Enum.Font.SourceSansBold
SupaBtn.Text = "Auto Supa [C]: OFF"
SupaBtn.TextColor3 = Color3.fromRGB(230, 220, 255)
SupaBtn.TextSize = 13
round(SupaBtn, 6)

for _, b in pairs({GroundBtn, EffectsBtn, ClearBtn, SideDashBtn, DownSlamBtn, RagdollBtn, OreoBtn, KingBtn, SupaBtn}) do
    local s = Instance.new("UIStroke")
    s.Thickness = 1
    s.Color = Color3.fromRGB(80, 40, 120)
    s.Parent = b
end

local function updateButtonState(btn, state, activeText, inactiveText)
    local targetColor = state and Color3.fromRGB(90, 30, 160) or Color3.fromRGB(22, 18, 30)
    TS:Create(btn, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = targetColor}):Play()
    btn.Text = state and activeText or inactiveText
end
local function useSkill(slotNumber)
    local character = LP.Character
    local backpack = LP:FindFirstChild("Backpack")
    if character then
        local tool = backpack and backpack:GetChildren()[slotNumber] or (character:GetChildren()[slotNumber] and character:GetChildren()[slotNumber]:IsA("Tool") and character:GetChildren()[slotNumber])
        if tool then tool.Parent = character tool:Activate() end
    end
end

local function runDash()
    local combatEE = game:GetService("ReplicatedStorage"):FindFirstChild("CombatEE", true)
    if combatEE and combatEE:IsA("RemoteEvent") then combatEE:FireServer(Enum.KeyCode.Q) end
end

local function runSideDash() if Toggles.SideDash then runDash() end end

local function runDownSlam()
    if not Toggles.DownSlam then return end
    local hum = LP.Character and LP.Character:FindFirstChild("Humanoid")
    if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) task.wait(0.08) runDash() end
end

local function runRagdollCancel()
    if not Toggles.Ragdoll then return end
    local hum = LP.Character and LP.Character:FindFirstChild("Humanoid")
    if hum then for i = 1, 4 do hum:ChangeState(Enum.HumanoidStateType.Jumping) runDash() task.wait(0.02) end end
end

local function runOreoTech() if Toggles.Oreo then runDash() task.wait(0.04) useSkill(1) end end
local function runKingTech() if Toggles.King then useSkill(2) end end
local function runSupaTech() if Toggles.Supa then runDash() task.wait(0.02) useSkill(3) end end

SideDashBtn.MouseButton1Click:Connect(function() Toggles.SideDash = not Toggles.SideDash updateButtonState(SideDashBtn, Toggles.SideDash, "Side Dash [T]: ON ✔", "Side Dash [T]: OFF") end)
DownSlamBtn.MouseButton1Click:Connect(function() Toggles.DownSlam = not Toggles.DownSlam updateButtonState(DownSlamBtn, Toggles.DownSlam, "Down Slam [G]: ON ✔", "Down Slam [G]: OFF") end)
RagdollBtn.MouseButton1Click:Connect(function() Toggles.Ragdoll = not Toggles.Ragdoll updateButtonState(RagdollBtn, Toggles.Ragdoll, "Ragdoll Cancel [V]: ON ✔", "Ragdoll Cancel [V]: OFF") end)
OreoBtn.MouseButton1Click:Connect(function() Toggles.Oreo = not Toggles.Oreo updateButtonState(OreoBtn, Toggles.Oreo, "Auto Oreo [Z]: ON ✔", "Auto Oreo [Z]: OFF") end)
KingBtn.MouseButton1Click:Connect(function() Toggles.King = not Toggles.King updateButtonState(KingBtn, Toggles.King, "Auto King [X]: ON ✔", "Auto King [X]: OFF") end)
SupaBtn.MouseButton1Click:Connect(function() Toggles.Supa = not Toggles.Supa updateButtonState(SupaBtn, Toggles.Supa, "Auto Supa [C]: ON ✔", "Auto Supa [C]: OFF") end)

UIS.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.T then runSideDash()
    elseif input.KeyCode == Enum.KeyCode.G then runDownSlam()
    elseif input.KeyCode == Enum.KeyCode.V then runRagdollCancel()
    elseif input.KeyCode == Enum.KeyCode.Z then runOreoTech()
    elseif input.KeyCode == Enum.KeyCode.X then runKingTech()
    elseif input.KeyCode == Enum.KeyCode.C then runSupaTech()
    end
end)
local function OptimizePart(v)
    if v:IsA("BasePart") then
        v.Material = Enum.Material.SmoothPlastic
        v.Reflectance = 0
        v.CastShadow = false
    elseif v:IsA("Texture") or v:IsA("Decal") then
        v:Destroy()
    elseif v:IsA("MeshPart") then
        v.RenderFidelity = Enum.RenderFidelity.Performance
        v.CollisionFidelity = Enum.CollisionFidelity.Box
        v.Material = Enum.Material.SmoothPlastic
    end
end

GroundBtn.MouseButton1Click:Connect(function()
    GroundBtn.Text = "Сжатие (85% Soft)... ⏳"
    task.spawn(function()
        local desc = workspace:GetDescendants()
        for i, v in ipairs(desc) do
            OptimizePart(v)
            if i % 150 == 0 then task.wait() end
        end
        local terrain = workspace:FindFirstChildOfClass("Terrain")
        if terrain then terrain.WaterWaveSize = 0 terrain.WaterWaveSpeed = 0 terrain.Decoration = false end
        GroundBtn.BackgroundColor3 = Color3.fromRGB(100, 30, 180)
        GroundBtn.Text = "Софт Текстуры 85%! ✔"
    end)
end)

EffectsBtn.MouseButton1Click:Connect(function()
    task.spawn(function()
        for _, effect in pairs(game:GetService("Lighting"):GetChildren()) do
            if effect:IsA("PostEffect") or effect:IsA("BloomEffect") or effect:IsA("BlurEffect") or effect:IsA("SunRaysEffect") then effect.Enabled = false end
        end
        game:GetService("Lighting").GlobalShadows = false
        EffectsBtn.BackgroundColor3 = Color3.fromRGB(100, 30, 180)
        EffectsBtn.Text = "Эффекты Выключены! ✔"
    end)
end)

ClearBtn.MouseButton1Click:Connect(function()
    task.spawn(function()
        local desc = workspace:GetDescendants()
        for i, v in ipairs(desc) do
            if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") then v:Destroy() end
            if i % 200 == 0 then task.wait() end
        end
        ClearBtn.Text = "Карта Очищена! ✔"
        task.wait(1)
        ClearBtn.Text = "Очистить карту от Хлама"
    end)
end)
