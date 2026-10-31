local old=game:GetService("CoreGui"):FindFirstChild("TSB_Advanced_Booster") or game:GetService("Players").LocalPlayer:FindFirstChildOfClass("PlayerGui"):FindFirstChild("TSB_Advanced_Booster")
if old then old:Destroy() end
local UIS,TS,Players=game:GetService("UserInputService"),game:GetService("TweenService"),game:GetService("Players")
local LP,VIM=Players.LocalPlayer,game:GetService("VirtualInputManager")
_G.Toggles={SideDash=false,DownSlam=false,Ragdoll=false,Oreo=false,King=false,Supa=false,AutoClear=false,AutoTrails=false,LowRender=false,CustomFog=false,CamLock=false,MobileShift=false,EspToggle=false,Disable3D=false,ExtremeFPS=false}
_G.CamKey,_G.IsBind,guiEx=Enum.KeyCode.CapsLock,false,true
local SG=Instance.new("ScreenGui")SG.Name="TSB_Advanced_Booster"SG.ResetOnSpawn=false
pcall(function()SG.Parent=game:GetService("CoreGui")end)if not SG.Parent then SG.Parent=LP:WaitForChild("PlayerGui")end
local MF=Instance.new("Frame")MF.Name="MainFrame"MF.Parent=SG;MF.BackgroundColor3=Color3.fromRGB(12,12,14)MF.BorderColor3=Color3.fromRGB(138,43,226)MF.BorderSizePixel=1;MF.Position=UDim2.new(0.05,0,0.25,0)MF.Size=UDim2.new(0,680,0,420)MF.Active=true;MF.ClipsDescendants=true;MF.Visible=false
local function rnd(o,r)local c=Instance.new("UICorner")c.CornerRadius=UDim.new(0,r)c.Parent=o end
rnd(MF,10)local Nav=Instance.new("ScrollingFrame")Nav.Name="Navigation"Nav.Parent=MF;Nav.BackgroundColor3=Color3.fromRGB(18,18,22)Nav.Position=UDim2.new(0,5,0,40)Nav.Size=UDim2.new(0,180,0,350)Nav.CanvasSize=UDim2.new(0,0,0,460)Nav.ScrollBarThickness=3;Nav.BorderSizePixel=0;rnd(Nav,6)
local NL=Instance.new("UIListLayout")NL.Parent=Nav;NL.Padding=UDim.new(0,4)NL.HorizontalAlignment=Enum.HorizontalAlignment.Center
local CF=Instance.new("Frame")CF.Name="ContentFrame"CF.Parent=MF;CF.BackgroundTransparency=1;CF.Position=UDim2.new(0,195,0,40)CF.Size=UDim2.new(0,475,0,350)
_G.tabs,_G.Nav,_G.CF,_G.rnd,_G.SG,_G.MF={},Nav,CF,rnd,SG,MF
local UIS,TS=game:GetService("UserInputService"),game:GetService("TweenService")
local SG,MF,CF,Nav,rnd,tabs=_G.SG,_G.MF,_G.CF,_G.Nav,_G.rnd,_G.tabs
local MT=Instance.new("TextLabel")MT.Parent=MF;MT.BackgroundTransparency=1;MT.Position=UDim2.new(0,15,0,5)MT.Size=UDim2.new(0,350,0,30)MT.Font=Enum.Font.SourceSansBold;MT.Text="⚡ ameba optimizer v7.0 (X3 HARD FPS BOOST)"
MT.TextColor3=Color3.fromRGB(180,100,255)MT.TextSize=16;MT.TextXAlignment=Enum.TextXAlignment.Left
local BI=Instance.new("TextLabel")BI.Parent=MF;BI.BackgroundTransparency=1;BI.Position=UDim2.new(0,500,0,395)BI.Size=UDim2.new(0,170,0,20)BI.Font=Enum.Font.SourceSansItalic;BI.Text="[ Нажмите K для скрытия ]"
BI.TextColor3=Color3.fromRGB(130,130,150)BI.TextSize=12;BI.TextXAlignment=Enum.TextXAlignment.Right
local WF=Instance.new("Frame")WF.Parent=SG;WF.BackgroundColor3=Color3.fromRGB(12,12,14)WF.Position=UDim2.new(0.5,-175,0.5,-50)WF.Size=UDim2.new(0,350,0,100)rnd(WF,10)
local WS=Instance.new("UIStroke")WS.Thickness=1.5;WS.Color=Color3.fromRGB(150,0,255)WS.Parent=WF
local WT=Instance.new("TextLabel")WT.Parent=WF;WT.BackgroundTransparency=1;WT.Size=UDim2.new(1,0,1,0)WT.Font=Enum.Font.SourceSansBold;WT.Text="ameba optimizer HARDCORE X3 ACTIVE"
WT.TextColor3=Color3.fromRGB(180,100,255)WT.TextSize=16
task.spawn(function()task.wait(1.2)TS:Create(WF,TweenInfo.new(0.4),{BackgroundTransparency=1}):Play()TS:Create(WT,TweenInfo.new(0.4),{TextTransparency=1}):Play()TS:Create(WS,TweenInfo.new(0.4),{Transparency=1}):Play()task.wait(0.4)WF:Destroy()MF.Visible=true end)
local drg,di,ds,sp
MF.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then drg=true;ds=i.Position;sp=MF.Position;i.Changed:Connect(function()if i.UserInputState==Enum.UserInputState.End then drg=false end end)end end)
MF.InputChanged:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch then di=i end end)
UIS.InputChanged:Connect(function(i)if i==di and drg then local d=i.Position-ds;MF.Position=UDim2.new(sp.X.Scale,sp.X.Offset+d.X,sp.Y.Scale,sp.Y.Offset+d.Y)end end)
_G.TglGui=function()guiEx=not guiEx;MF.Visible=guiEx end
UIS.InputBegan:Connect(function(i,g)if not g and i.KeyCode==Enum.KeyCode.K then _G.TglGui() end end)
_G.CTab=function(n,id)local P=Instance.new("Frame")P.Name=id.."Page"P.Parent=CF;P.BackgroundTransparency=1;P.Size=UDim2.new(1,0,1,0)P.Visible=false
local T=Instance.new("TextLabel")T.Parent=P;T.BackgroundTransparency=1;T.Size=UDim2.new(1,0,0,30)T.Font=Enum.Font.SourceSansBold;T.Text="СТОЛБЕЦ: "..n:upper()
T.TextColor3=Color3.fromRGB(200,150,255)T.TextSize=15;local B=Instance.new("TextButton")B.Parent=Nav;B.BackgroundColor3=Color3.fromRGB(26,26,32)B.Size=UDim2.new(0,165,0,38)B.Font=Enum.Font.SourceSansBold;B.Text=n;B.TextColor3=Color3.fromRGB(200,200,220)B.TextSize=11;rnd(B,4)local s=Instance.new("UIStroke")s.Thickness=1;s.Color=Color3.fromRGB(45,45,55)s.Parent=B
B.MouseButton1Click:Connect(function()for _,t in pairs(tabs)do t.P.Visible=false;t.B.BackgroundColor3=Color3.fromRGB(26,26,32)t.B.TextColor3=Color3.fromRGB(200,200,220)end;P.Visible=true;B.BackgroundColor3=Color3.fromRGB(100,30,180)B.TextColor3=Color3.fromRGB(255,255,255)end)tabs[id]={P=P,B=B}return P end
_G.CBtn=function(p,t,pos,cb)local B=Instance.new("TextButton")B.Parent=p;B.BackgroundColor3=Color3.fromRGB(22,18,30)B.Position=pos;B.Size=UDim2.new(0,230,0,45)B.Font=Enum.Font.SourceSansBold;B.Text=t;B.TextColor3=Color3.fromRGB(230,220,255)B.TextSize=13;rnd(B,6)local s=Instance.new("UIStroke")s.Thickness=1;s.Color=Color3.fromRGB(80,40,120)s.Parent=B;B.MouseButton1Click:Connect(function()cb(B)end)return B end
_G.upBtn=function(b,s,on,off)b.BackgroundColor3=s and Color3.fromRGB(100,30,180) or Color3.fromRGB(22,18,30)b.Text=s and on or off end
local Toggles,CTab,CBtn,upBtn=_G.Toggles,_G.CTab,_G.CBtn,_G.upBtn
local c1,c2,c3,c4,c5,c6,c7=_G.CTab("1. ХАРДКОР ОПТИМИЗАЦИЯ","col1"),_G.CTab("2. Ультра Графика","col2"),_G.CTab("3. Очистка Мусора","col3"),_G.CTab("4. Атмосфера","col4"),_G.CTab("5. Шлейфы","col5"),_G.CTab("6. Движок","col6"),_G.CTab("7. Базовые Течи","col7")
CBtn(c1,"🔥 Экстремальный Буст FPS x3",UDim2.new(0,0,0,45),function(b)Toggles.ExtremeFPS=not Toggles.ExtremeFPS;upBtn(b,Toggles.ExtremeFPS,"🔥 Буст x3: АКТИВИРОВАН ✔","🔥 Экстремальный Буст FPS x3")task.spawn(function()while Toggles.ExtremeFPS do pcall(function()gcinfo()settings().Rendering.QualityLevel=Enum.QualityLevel.Level01 end)task.wait(1)end end)end)
CBtn(c1,"💀 Вырезать Освещение и Небо",UDim2.new(0,0,0,100),function(b)pcall(function()game:GetService("Lighting").GlobalShadows=false;game:GetService("Lighting").EnvironmentSpecularScale=0;game:GetService("Lighting").EnvironmentDiffuseScale=0;local s=game:GetService("Lighting"):FindFirstChildOfClass("Sky")if s then s:Destroy() end;b.BackgroundColor3=Color3.fromRGB(100,30,180)b.Text="Небо и Свет Удалены! ✔"end)end)
CBtn(c1,"🚫 Отключить 3D Рендер (AFK)",UDim2.new(0,0,0,155),function(b)Toggles.Disable3D=not Toggles.Disable3D;upBtn(b,Toggles.Disable3D,"🚫 3D Рендер: ВЫКЛЮЧЕН ✔","🚫 Отключить 3D Рендер (AFK)")game:GetService("RunService"):Set3DRenderingEnabled(not Toggles.Disable3D)end)
CBtn(c2,"👑 Максимальная Графика RT",UDim2.new(0,0,0,45),function(b)task.spawn(function()settings().Rendering.QualityLevel=Enum.QualityLevel.Level21;game:GetService("Lighting").GlobalShadows=true;for _,e in pairs(game:GetService("Lighting"):GetChildren()) do if e:IsA("PostEffect") or e:IsA("BloomEffect") or e:IsA("BlurEffect") or e:IsA("SunRaysEffect") then e.Enabled=true end end;local t=workspace:FindFirstChildOfClass("Terrain")if t then t.WaterWaveSize=1;t.WaterWaveSpeed=1;t.Decoration=true end;b.BackgroundColor3=Color3.fromRGB(100,30,180)b.Text="Графика: Кинематографичная! 👑"end)end)
CBtn(c2,"🚀 Разблокировать FPS (999)",UDim2.new(0,0,0,100),function(b)if setfpscap then setfpscap(999)b.BackgroundColor3=Color3.fromRGB(100,30,180)b.Text="FPS Кап снят! ✔"else b.Text="Не поддерживается читом ❌"end end)
CBtn(c3,"Пост-Очистка Мусора: OFF",UDim2.new(0,0,0,45),function(b)Toggles.AutoClear=not Toggles.AutoClear;upBtn(b,Toggles.AutoClear,"Пост-Очистка Мусора: ON ✔","Пост-Очистка Мусора: OFF")if Toggles.AutoClear then task.spawn(function()for _,v in ipairs(workspace:GetDescendants()) do if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Sparkles") then pcall(function()v:Destroy()end)end end end)end end)
CBtn(c4,"🔮 Фиолетовый Туман",UDim2.new(0,0,0,45),function(b)Toggles.CustomFog=not Toggles.CustomFog;upBtn(b,Toggles.CustomFog,"🔮 Туман: ON ✔","🔮 Фиолетовый Туман")if Toggles.CustomFog then game:GetService("Lighting").FogStart=30;game:GetService("Lighting").FogEnd=120;game:GetService("Lighting").FogColor=Color3.fromRGB(12,12,14)else game:GetService("Lighting").FogStart=0;game:GetService("Lighting").FogEnd=999999 end end)
local hidT={}
CBtn(c5,"✨ Вырезать Шлейфы",UDim2.new(0,0,0,45),function(b)Toggles.AutoTrails=not Toggles.AutoTrails;upBtn(b,Toggles.AutoTrails,"✨ Шлейфы: ВЫРЕЗАНЫ ✔","✨ Вырезать Шлейфы")if Toggles.AutoTrails then for _,v in pairs(workspace:GetDescendants()) do if v:IsA("Beam") or v:IsA("Trail") then if v.Enabled then table.insert(hidT,v)v.Enabled=false end end end else for _,v in pairs(hidT) do if v and v.Parent then v.Enabled=true end end;table.clear(hidT)end end)
CBtn(c6,"⚙️ Движок на Предпочтение",UDim2.new(0,0,0,45),function(b)Toggles.LowRender=not Toggles.LowRender;upBtn(b,Toggles.LowRender,"⚙️ Лоу-Режим: АКТИВЕН ✔","⚙️ Движок на Минимум")settings().Rendering.QualityLevel=Toggles.LowRender and Enum.QualityLevel.Level01 or Enum.QualityLevel.Automatic end)
CBtn(c7,"Side Dash [T]: OFF",UDim2.new(0,0,0,45),function(b)Toggles.SideDash=not Toggles.SideDash;upBtn(b,Toggles.SideDash,"Side Dash [T]: ON ✔","Side Dash [T]: OFF")end)
CBtn(c7,"Down Slam [G]: OFF",UDim2.new(0,0,0,100),function(b)Toggles.DownSlam=not Toggles.DownSlam;upBtn(b,Toggles.DownSlam,"Down Slam [G]: ON ✔","Down Slam [G]: OFF")end)
CBtn(c7,"Ragdoll Cancel [V]: OFF",UDim2.new(0,0,0,155),function(b)Toggles.Ragdoll=not Toggles.Ragdoll;upBtn(b,Toggles.Ragdoll,"Ragdoll Cancel [V]: ON ✔","Ragdoll Cancel [V]: OFF")end)
local UIS,Players,LP=game:GetService("UserInputService"),game:GetService("Players"),game:GetService("Players").LocalPlayer
local Toggles,upBtn,press,tapM1,CLB,BCLB=_G.Toggles,_G.upBtn,_G.press,_G.tapM1,_G.CLB,_G.BCLB
local function getCls()local c,d=nil,math.huge;for _,p in ipairs(Players:GetPlayers()) do if p~=LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then local dist=(p.Character.HumanoidRootPart.Position-LP.Character.HumanoidRootPart.Position).Magnitude;if dist<d and dist<150 then c=p.Character.HumanoidRootPart;d=dist end end end;return c end
game:GetService("RunService").RenderStepped:Connect(function()if Toggles.CamLock then local t=getCls()if t then workspace.CurrentCamera.CFrame=CFrame.new(workspace.CurrentCamera.CFrame.Position,t.Position)end end end)
UIS.InputBegan:Connect(function(i,g)if _G.IsBind then if i.KeyCode~=Enum.KeyCode.Unknown and i.KeyCode~=Enum.KeyCode.K then _G.CamKey=i.KeyCode;_G.IsBind=false;BCLB.Text="🎹 Бинд CamLock: [ "..i.KeyCode.Name.." ]"BCLB.BackgroundColor3=Color3.fromRGB(22,18,30)end;return end;if g then return end
if i.KeyCode==_G.CamKey then Toggles.CamLock=not Toggles.CamLock;upBtn(CLB,Toggles.CamLock,"🎯 Плавный CamLock: ON ✔","🎯 Плавный CamLock: OFF")
elseif i.KeyCode==Enum.KeyCode.T and Toggles.SideDash then press(Enum.KeyCode.Q)press(Enum.KeyCode.A)
elseif i.KeyCode==Enum.KeyCode.G and Toggles.DownSlam then press(Enum.KeyCode.Space)task.wait(0.18)tapM1()
elseif i.KeyCode==Enum.KeyCode.V and Toggles.Ragdoll then for x=1,3 do press(Enum.KeyCode.Space)task.wait(0.05)end
elseif i.KeyCode==Enum.KeyCode.Z and Toggles.Oreo then tapM1()task.wait(0.1)press(Enum.KeyCode.Q)task.wait(0.1)press(Enum.KeyCode.One)
elseif i.KeyCode==Enum.KeyCode.X and Toggles.King then for x=1,3 do tapM1()task.wait(0.2)end;press(Enum.KeyCode.Two)
elseif i.KeyCode==Enum.KeyCode.C and Toggles.Supa then press(Enum.KeyCode.Q)task.wait(0.05)press(Enum.KeyCode.Three)end end)
workspace.DescendantAdded:Connect(function(d)if Toggles.AutoClear and (d:IsA("ParticleEmitter") or d:IsA("Smoke") or d:IsA("Sparkles")) then task.wait(0.05)pcall(function()if d and d.Parent then d:Destroy()end end)end;if Toggles.AutoTrails and (d:IsA("Beam") or d:IsA("Trail")) then pcall(function()d.Enabled=false end)end end)
Players.PlayerAdded:Connect(function(p)p.CharacterAdded:Connect(function(c)if Toggles.EspToggle then task.wait(0.5)local h=Instance.new("Highlight",c)h.FillColor=Color3.fromRGB(150,0,255)end end)end)
local SG=game:GetService("CoreGui"):FindFirstChild("TSB_Advanced_Booster") or LP:WaitForChild("PlayerGui"):FindFirstChild("TSB_Advanced_Booster")
local MTB=Instance.new("TextButton")MTB.Name="MobileToggle"local uS=Instance.new("UIStroke",MTB)uS.Thickness=1.5;uS.Color=Color3.fromRGB(138,43,226)MTB.Parent=SG;MTB.Position=UDim2.new(0.02,0,0.15,0)MTB.Size=UDim2.new(0,45,0,45)MTB.BackgroundColor3=Color3.fromRGB(12,12,14)MTB.Text="⚙️"MTB.TextSize=20;MTB.TextColor3=Color3.fromRGB(180,100,255)_G.rnd(MTB,22)MTB.MouseButton1Click:Connect(_G.TglGui)
_G.tabs["col1"].B.BackgroundColor3=Color3.fromRGB(100,30,180)_G.tabs["col1"].B.TextColor3=Color3.fromRGB(255,255,255)_G.tabs["col1"].P.Visible=true
