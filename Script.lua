local old_gui = game:GetService("CoreGui"):FindFirstChild("TSB_Advanced_Booster") or game:GetService("Players").LocalPlayer:FindFirstChildOfClass("PlayerGui"):FindFirstChild("TSB_Advanced_Booster")
if old_gui then old_gui:Destroy() end

local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local VIM = game:GetService("VirtualInputManager")

local Toggles = {
    SideDash = false, DownSlam = false, Ragdoll = false,
    Oreo = false, King = false, Supa = false,
    AutoClear = false, AutoTrails = false, LowRender = false, CustomFog = false,
    CamLock = false, MobileShift = false, EspToggle = false, Disable3D = false,
    ExtremeFPS = false
}

local guiExpanded = true
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
MainFrame.Size = UDim2.new(0, 680, 0, 420)
MainFrame.Active = true
MainFrame.ClipsDescendants = true
MainFrame.Visible = false 

local function round(obj, r)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, r)
    c.Parent = obj
end
round(MainFrame, 10)
local Navigation = Instance.new("ScrollingFrame")
Navigation.Name = "Navigation"
Navigation.Parent = MainFrame
Navigation.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
Navigation.Position = UDim2.new(0, 5, 0, 40)
Navigation.Size = UDim2.new(0, 180, 0, 350)
Navigation.CanvasSize = UDim2.new(0, 0, 0, 460)
Navigation.ScrollBarThickness = 3
Navigation.BorderSizePixel = 0
round(Navigation, 6)

local NavLayout = Instance.new("UIListLayout")
NavLayout.Parent = Navigation
NavLayout.Padding = UDim.new(0, 4)
NavLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundTransparency = 1
ContentFrame.Position = UDim2.new(0, 195, 0, 40)
ContentFrame.Size = UDim2.new(0, 475, 0, 350)

local MainTitle = Instance.new("TextLabel")
MainTitle.Parent = MainFrame
MainTitle.BackgroundTransparency = 1
MainTitle.Position = UDim2.new(0, 15, 0, 5)
MainTitle.Size = UDim2.new(0, 350, 0, 30)
MainTitle.Font = Enum.Font.SourceSansBold
MainTitle.Text = "⚡ ameba optimizer v7.0 (X3 HARD FPS BOOST)"
MainTitle.TextColor3 = Color3.fromRGB(180, 100, 255)
MainTitle.TextSize = 16
MainTitle.TextXAlignment = Enum.TextXAlignment.Left

local BindInfo = Instance.new("TextLabel")
BindInfo.Parent = MainFrame
BindInfo.BackgroundTransparency = 1
BindInfo.Position = UDim2.new(0, 500, 0, 395)
BindInfo.Size = UDim2.new(0, 170, 0, 20)
BindInfo.Font = Enum.Font.SourceSansItalic
BindInfo.Text = "[ Нажмите K для скрытия ]"
BindInfo.TextColor3 = Color3.fromRGB(130, 130, 150)
BindInfo.TextSize = 12
BindInfo.TextXAlignment = Enum.TextXAlignment.Right

local WelcomeFrame = Instance.new("Frame")
WelcomeFrame.Parent = ScreenGui
WelcomeFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
WelcomeFrame.Position = UDim2.new(0.5, -175, 0.5, -50)
WelcomeFrame.Size = UDim2.new(0, 350, 0, 100)
round(WelcomeFrame, 10)

local welcomeStroke = Instance.new("UIStroke")
welcomeStroke.Thickness = 1.5
welcomeStroke.Color = Color3.fromRGB(150, 0, 255)
welcomeStroke.Parent = WelcomeFrame

local WelcomeText = Instance.new("TextLabel")
WelcomeText.Parent = WelcomeFrame
WelcomeText.BackgroundTransparency = 1
WelcomeText.Size = UDim2.new(1, 0, 1, 0)
WelcomeText.Font = Enum.Font.SourceSansBold
WelcomeText.Text = "ameba optimizer HARDCORE X3 ACTIVE"
WelcomeText.TextColor3 = Color3.fromRGB(180, 100, 255)
WelcomeText.TextSize = 16

task.spawn(function()
    task.wait(1.2)
    TS:Create(WelcomeFrame, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
    TS:Create(WelcomeText, TweenInfo.new(0.4), {TextTransparency = 1}):Play()
    TS:Create(welcomeStroke, TweenInfo.new(0.4), {Transparency = 1}):Play()
    task.wait(0.4)
    WelcomeFrame:Destroy()
    MainFrame.Visible = true
end)
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
    guiExpanded = not guiExpanded
    MainFrame.Visible = guiExpanded
end

UIS.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.K then ToggleGui() end
end)

local tabs = {}
local function CreateTab(name, id)
    local TabPage = Instance.new("Frame")
    TabPage.Name = id .. "Page"
    TabPage.Parent = ContentFrame
    TabPage.BackgroundTransparency = 1
    TabPage.Size = UDim2.new(1, 0, 1, 0)
    TabPage.Visible = false

    local Title = Instance.new("TextLabel")
    Title.Parent = TabPage
    Title.BackgroundTransparency = 1
    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.Font = Enum.Font.SourceSansBold
    Title.Text = "СТОЛБЕЦ: " .. name:upper()
    Title.TextColor3 = Color3.fromRGB(200, 150, 255)
    Title.TextSize = 15

    local NavBtn = Instance.new("TextButton")
    NavBtn.Parent = Navigation
    NavBtn.BackgroundColor3 = Color3.fromRGB(26, 26, 32)
    NavBtn.Size = UDim2.new(0, 165, 0, 38)
    NavBtn.Font = Enum.Font.SourceSansBold
    NavBtn.Text = name
    NavBtn.TextColor3 = Color3.fromRGB(200, 200, 220)
    NavBtn.TextSize = 11
    round(NavBtn, 4)
    
    local str = Instance.new("UIStroke")
    str.Thickness = 1
    str.Color = Color3.fromRGB(45, 45, 55)
    str.Parent = NavBtn

    NavBtn.MouseButton1Click:Connect(function()
        for _, t in pairs(tabs) do
            t.Page.Visible = false
            t.Btn.BackgroundColor3 = Color3.fromRGB(26, 26, 32)
            t.Btn.TextColor3 = Color3.fromRGB(200, 200, 220)
        end
        TabPage.Visible = true
        NavBtn.BackgroundColor3 = Color3.fromRGB(100, 30, 180)
        NavBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
    tabs[id] = {Page = TabPage, Btn = NavBtn}
    return TabPage
end

local function CreateButton(parent, text, pos, callback)
    local Btn = Instance.new("TextButton")
    Btn.Parent = parent
    Btn.BackgroundColor3 = Color3.fromRGB(22, 18, 30)
    Btn.Position = pos
    Btn.Size = UDim2.new(0, 230, 0, 45)
    Btn.Font = Enum.Font.SourceSansBold
    Btn.Text = text
    Btn.TextColor3 = Color3.fromRGB(230, 220, 255)
    Btn.TextSize = 13
    round(Btn, 6)
    local s = Instance.new("UIStroke")
    s.Thickness = 1
    s.Color = Color3.fromRGB(80, 40, 120)
    s.Parent = Btn
    Btn.MouseButton1Click:Connect(function() callback(Btn) end)
    return Btn
end

local function updateBtnVisual(btn, state, onText, offText)
    btn.BackgroundColor3 = state and Color3.fromRGB(100, 30, 180) or Color3.fromRGB(22, 18, 30)
    btn.Text = state and onText or offText
end

local function clickMouse()
    pcall(function()
        VIM:SendMouseButtonEvent(0, 0, 0, true, game, 0)
        task.wait(0.01)
        VIM:SendMouseButtonEvent(0, 0, 0, false, game, 0)
    end)
end
local Col1 = CreateTab("1. ХАРДКОР ОПТИМИЗАЦИЯ", "col1")
local Col2 = CreateTab("2. Ультра Графика", "col2")
local Col3 = CreateTab("3. Очистка Мусора", "col3")
local Col4 = CreateTab("4. Атмосфера", "col4")
local Col5 = CreateTab("5. Шлейфы", "col5")
local Col6 = CreateTab("6. Движок", "col6")
local Col7 = CreateTab("7. Базовые Течи", "col7")
local Col8 = CreateTab("8. Удары и ESP", "col8")
local Col9 = CreateTab("9. Продвинутые Авто", "col9")
local Col10 = CreateTab("10. Камера и Бой", "col10")

CreateButton(Col1, "🔥 Экстремальный Буст FPS x3", UDim2.new(0, 0, 0, 45), function(btn)
    Toggles.ExtremeFPS = not Toggles.ExtremeFPS
    updateBtnVisual(btn, Toggles.ExtremeFPS, "🔥 Буст x3: АКТИВИРОВАН ✔", "🔥 Экстремальный Буст FPS x3")
    task.spawn(function()
        while Toggles.ExtremeFPS do
            pcall(function()
                gcinfo()
                settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
            end)
            task.wait(1)
        end
    end)
end)

CreateButton(Col1, "💀 Вырезать Освещение и Небо", UDim2.new(0, 0, 0, 100), function(btn)
    pcall(function()
        game:GetService("Lighting").GlobalShadows = false
        game:GetService("Lighting").EnvironmentSpecularScale = 0
        game:GetService("Lighting").EnvironmentDiffuseScale = 0
        local sky = game:GetService("Lighting"):FindFirstChildOfClass("Sky")
        if sky then sky:Destroy() end
        btn.BackgroundColor3 = Color3.fromRGB(100, 30, 180) btn.Text = "Небо и Свет Удалены! ✔"
    end)
end)

CreateButton(Col1, "🚫 Отключить 3D Рендер (AFK)", UDim2.new(0, 0, 0, 155), function(btn)
    Toggles.Disable3D = not Toggles.Disable3D
    updateBtnVisual(btn, Toggles.Disable3D, "🚫 3D Рендер: ВЫКЛЮЧЕН ✔", "🚫 Отключить 3D Рендер (AFK)")
    game:GetService("RunService"):Set3DRenderingEnabled(not Toggles.Disable3D)
end)

CreateButton(Col2, "👑 Максимальная Графика RT", UDim2.new(0, 0, 0, 45), function(btn)
    task.spawn(function()
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level21
        game:GetService("Lighting").GlobalShadows = true
        for _, e in pairs(game:GetService("Lighting"):GetChildren()) do
            if e:IsA("PostEffect") or e:IsA("BloomEffect") or e:IsA("BlurEffect") or e:IsA("SunRaysEffect") then e.Enabled = true end
        end
        local terrain = workspace:FindFirstChildOfClass("Terrain")
        if terrain then terrain.WaterWaveSize = 1 terrain.WaterWaveSpeed = 1 terrain.Decoration = true end
        btn.BackgroundColor3 = Color3.fromRGB(100, 30, 180) btn.Text = "Графика: Кинематографичная! 👑"
    end)
end)

CreateButton(Col2, "🚀 Разблокировать FPS (999)", UDim2.new(0, 0, 0, 100), function(btn)
    if setfpscap then setfpscap(999) btn.BackgroundColor3 = Color3.fromRGB(100, 30, 180) btn.Text = "FPS Кап снят! ✔"
    else btn.Text = "Не поддерживается читом ❌" end
end)

CreateButton(Col3, "Пост-Очистка Мусора: OFF", UDim2.new(0, 0, 0, 45), function(btn)
    Toggles.AutoClear = not Toggles.AutoClear
    updateBtnVisual(btn, Toggles.AutoClear, "Пост-Очистка Мусора: ON ✔", "Пост-Очистка Мусора: OFF")
    if Toggles.AutoClear then
        task.spawn(function()
            for _, v in ipairs(workspace:GetDescendants()) do
                if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Sparkles") then pcall(function() v:Destroy() end) end
            end
        end)
    end
end)

CreateButton(Col4, "🔮 Фиолетовый Туман", UDim2.new(0, 0, 0, 45), function(btn)
    Toggles.CustomFog = not Toggles.CustomFog
    updateBtnVisual(btn, Toggles.CustomFog, "🔮 Туман: ON ✔", "🔮 Фиолетовый Туман")
    if Toggles.CustomFog then
        game:GetService("Lighting").FogStart = 30 game:GetService("Lighting").FogEnd = 120 game:GetService("Lighting").FogColor = Color3.fromRGB(12, 12, 14)
    else
        game:GetService("Lighting").FogStart = 0 game:GetService("Lighting").FogEnd = 999999
    end
end)

local hiddenTrails = {}
CreateButton(Col5, "✨ Вырезать Шлейфы", UDim2.new(0, 0, 0, 45), function(btn)
    Toggles.AutoTrails = not Toggles.AutoTrails
    updateBtnVisual(btn, Toggles.AutoTrails, "✨ Шлейфы: ВЫРЕЗАНЫ ✔", "✨ Вырезать Шлейфы")
    if Toggles.AutoTrails then
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Beam") or v:IsA("Trail") then if v.Enabled then table.insert(hiddenTrails, v) v.Enabled = false end end
        end
    else
        for _, v in pairs(hiddenTrails) do if v and v.Parent then v.Enabled = true end end
        table.clear(hiddenTrails)
    end
end)

CreateButton(Col6, "⚙️ Движок на Предпочтение", UDim2.new(0, 0, 0, 45), function(btn)
    Toggles.LowRender = not Toggles.LowRender
    updateBtnVisual(btn, Toggles.LowRender, "⚙️ Лоу-Режим: АКТИВЕН ✔", "⚙️ Движок на Минимум")
    settings().Rendering.QualityLevel = Toggles.LowRender and Enum.QualityLevel.Level01 or Enum.QualityLevel.Automatic
end)

CreateButton(Col7, "Side Dash [T]: OFF", UDim2.new(0, 0, 0, 45), function(btn) Toggles.SideDash = not Toggles.SideDash updateBtnVisual(btn, Toggles.SideDash, "Side Dash [T]: ON ✔", "Side Dash [T]: OFF") end)
CreateButton(Col7, "Down Slam [G]: OFF", UDim2.new(0, 0, 0, 100), function(btn) Toggles.DownSlam = not Toggles.DownSlam updateBtnVisual(btn, Toggles.DownSlam, "Down Slam [G]: ON ✔", "Down Slam [G]: OFF") end)
CreateButton(Col7, "Ragdoll Cancel [V]: OFF", UDim2.new(0, 0, 0, 155), function(btn) Toggles.Ragdoll = not Toggles.Ragdoll updateBtnVisual(btn, Toggles.Ragdoll, "Ragdoll Cancel [V]: ON ✔", "Ragdoll Cancel [V]: OFF") end)

CreateButton(Col8, "Тест Кликера M1", UDim2.new(0, 0, 0, 45), function(btn) clickMouse() end)
CreateButton(Col8, "👁 Включить Подсветку (ESP): OFF", UDim2.new(0, 0, 0, 100), function(btn)
    Toggles.EspToggle = not Toggles.EspToggle
    updateBtnVisual(btn, Toggles.EspToggle, "👁 Подсветку (ESP): ON ✔", "👁 Включить Подсветку (ESP): OFF")
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP and p.Character then
            local box = p.Character:FindFirstChildOfClass("Highlight")
            if box then box.Enabled = Toggles.EspToggle
            elseif Toggles.EspToggle then
                local h = Instance.new("Highlight", p.Character)
                h.FillColor = Color3.fromRGB(150, 0, 255) h.OutlineColor = Color3.fromRGB(255, 255, 255)
            end
        end
    end
end)

local function runDash()
    local c = game:GetService("ReplicatedStorage"):FindFirstChild("CombatEE", true)
    if c and c:IsA("RemoteEvent") then c:FireServer(Enum.KeyCode.Q) end
end
local function useSkill(slot)
    local char = LP.Character local bp = LP:FindFirstChild("Backpack")
    if char then
        local tool = bp and bp:GetChildren()[slot] or (char:GetChildren()[slot] and char:GetChildren()[slot]:IsA("Tool") and char:GetChildren()[slot])
        if tool then tool.Parent = char tool:Activate() end
    end
end

CreateButton(Col9, "Auto Oreo [Z]: OFF", UDim2.new(0, 0, 0, 45), function(btn) Toggles.Oreo = not Toggles.Oreo updateBtnVisual(btn, Toggles.Oreo, "Auto Oreo [Z]: ON ✔", "Auto Oreo [Z]: OFF") end)
CreateButton(Col9, "Auto King [X]: OFF", UDim2.new(0, 0, 0, 100), function(btn) Toggles.King = not Toggles.King updateBtnVisual(btn, Toggles.King, "Auto King [X]: ON ✔", "Auto King [X]: OFF") end)
CreateButton(Col9, "Auto Supa [C]: OFF", UDim2.new(0, 0, 0, 155), function(btn) Toggles.Supa = not Toggles.Supa updateBtnVisual(btn, Toggles.Supa, "Auto Supa [C]: ON ✔", "Auto Supa [C]: OFF") end)
CreateButton(Col10, "🎯 Плавный CamLock: OFF", UDim2.new(0, 0, 0, 45), function(btn) Toggles.CamLock = not Toggles.CamLock updateBtnVisual(btn, Toggles.CamLock, "🎯 Плавный CamLock: ON ✔", "🎯 Плавный CamLock: OFF") end)
CreateButton(Col10, "🔒 Мобильный ShiftLock: OFF", UDim2.new(0, 0, 0, 100), function(btn) Toggles.MobileShift = not Toggles.MobileShift updateBtnVisual(btn, Toggles.MobileShift, "🔒 Мобильный ShiftLock: ON ✔", "🔒 Мобильный ShiftLock: OFF") LP.DevEnableMouseLock = Toggles.MobileShift end)

local fovs = {70, 95, 120} local fovIdx = 1
CreateButton(Col10, "👁 FOV: Стандартный", UDim2.new(0, 0, 0, 155), function(btn)
    fovIdx = fovIdx + 1 if fovIdx > #fovs then fovIdx = 1 end
    workspace.CurrentCamera.FieldOfView = fovs[fovIdx]
    btn.Text = "👁 FOV: " .. (fovs[fovIdx] == 70 and "Стандартный" or fovs[fovIdx])
    btn.BackgroundColor3 = fovs[fovIdx] > 70 and Color3.fromRGB(100, 30, 180) or Color3.fromRGB(22, 18, 30)
end)

local function getClosestPlayer()
    local closest, dist = nil, math.huge
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
            local d = (p.Character.HumanoidRootPart.Position - LP.Character.HumanoidRootPart.Position).Magnitude
            if d < dist and d < 150 then closest = p.Character.HumanoidRootPart dist = d end
        end
    end
    return closest
end

game:GetService("RunService").RenderStepped:Connect(function()
    if Toggles.CamLock then
        local target = getClosestPlayer()
        if target then workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, target.Position) end
    end
end)

UIS.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.T and Toggles.SideDash then runDash()
    elseif input.KeyCode == Enum.KeyCode.G and Toggles.DownSlam then
        local hum = LP.Character and LP.Character:FindFirstChild("Humanoid")
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) task.wait(0.08) runDash() end
    elseif input.KeyCode == Enum.KeyCode.V and Toggles.Ragdoll then
        local hum = LP.Character and LP.Character:FindFirstChild("Humanoid")
        if hum then for i=1,4 do hum:ChangeState(Enum.HumanoidStateType.Jumping) runDash() task.wait(0.02) end end
    elseif input.KeyCode == Enum.KeyCode.Z and Toggles.Oreo then clickMouse() task.wait(0.22) runDash() task.wait(0.04) useSkill(1)
    elseif input.KeyCode == Enum.KeyCode.X and Toggles.King then clickMouse() task.wait(0.1) useSkill(2)
    elseif input.KeyCode == Enum.KeyCode.C and Toggles.Supa then clickMouse() task.wait(0.1) runDash() task.wait(0.02) useSkill(3)
    end
end)

workspace.DescendantAdded:Connect(function(desc)
    if Toggles.AutoClear and (desc:IsA("ParticleEmitter") or desc:IsA("Smoke") or desc:IsA("Sparkles")) then
        task.wait(0.05) pcall(function() if desc and desc.Parent then desc:Destroy() end end)
    end
    if Toggles.AutoTrails and (desc:IsA("Beam") or desc:IsA("Trail")) then pcall(function() desc.Enabled = false end) end
end)

Players.PlayerAdded:Connect(function(p)
    p.CharacterAdded:Connect(function(char)
        if Toggles.EspToggle then task.wait(0.5) local h = Instance.new("Highlight", char) h.FillColor = Color3.fromRGB(150, 0, 255) end
    end)
end)

local MobileToggleButton = Instance.new("TextButton")
MobileToggleButton.Name = "MobileToggle" 
local uiS = Instance.new("UIStroke", MobileToggleButton) 
uiS.Thickness = 1.5 
uiS.Color = Color3.fromRGB(138, 43, 226)
MobileToggleButton.Parent = ScreenGui 
MobileToggleButton.Position = UDim2.new(0.02, 0, 0.15, 0) 
MobileToggleButton.Size = UDim2.new(0, 45, 0, 45) 
MobileToggleButton.BackgroundColor3 = Color3.fromRGB(12, 12, 14) 
MobileToggleButton.Text = "⚙️" 
MobileToggleButton.TextSize = 20 
MobileToggleButton.TextColor3 = Color3.fromRGB(180, 100, 255) 
round(MobileToggleButton, 22) 
MobileToggleButton.MouseButton1Click:Connect(ToggleGui)

tabs["col1"].Btn.BackgroundColor3 = Color3.fromRGB(100, 30, 180) 
tabs["col1"].Btn.TextColor3 = Color3.fromRGB(255, 255, 255) 
tabs["col1"].Page.Visible = true
