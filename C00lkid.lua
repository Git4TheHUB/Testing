
writefile("C00L.mp3", game:HttpGet("https://github.com/ian49972/smth/raw/refs/heads/main/C00L.mp3"))
writefile("Walkspeed1.mp3", game:HttpGet("https://github.com/ian49972/smth/raw/refs/heads/main/Walkspeed1.mp3"))
writefile("Walkspeed2.mp3", game:HttpGet("https://github.com/ian49972/smth/raw/refs/heads/main/Walkspeed2.mp3"))
writefile("Walkmiss.mp3", game:HttpGet("https://github.com/ian49972/smth/raw/refs/heads/main/Walkmiss.mp3"))
writefile("WalkspeedHit.mp3", game:HttpGet("https://github.com/ian49972/smth/raw/refs/heads/main/WalkspeedHit.mp3"))
writefile("kill1.mp3", game:HttpGet("https://github.com/ian49972/smth/raw/refs/heads/main/kill1.mp3"))
writefile("kill2.mp3", game:HttpGet("https://github.com/ian49972/smth/raw/refs/heads/main/kill2.mp3"))
writefile("kill3.mp3", game:HttpGet("https://github.com/ian49972/smth/raw/refs/heads/main/kill3.mp3"))
writefile("kill4.mp3", game:HttpGet("https://github.com/ian49972/smth/raw/refs/heads/main/kill4.mp3"))
writefile("kill5.mp3", game:HttpGet("https://github.com/ian49972/smth/raw/refs/heads/main/kill5.mp3"))
writefile("kill6.mp3", game:HttpGet("https://github.com/ian49972/smth/raw/refs/heads/main/kill6.mp3"))
writefile("kill7.mp3", game:HttpGet("https://github.com/ian49972/smth/raw/refs/heads/main/kill7.mp3"))
writefile("kill8.mp3", game:HttpGet("https://github.com/ian49972/smth/raw/refs/heads/main/kill8.mp3"))
writefile("Corrupt.mp3", game:HttpGet("https://github.com/ian49972/smth/raw/refs/heads/main/Corrupt.mp3"))
writefile("Corrupt2.mp3", game:HttpGet("https://github.com/ian49972/smth/raw/refs/heads/main/Corrupt2.mp3"))
writefile("Delivery.mp3", game:HttpGet("https://github.com/ian49972/smth/raw/refs/heads/main/Delivery.mp3"))
writefile("idle1.mp3", game:HttpGet("https://github.com/ian49972/smth/raw/refs/heads/main/idle1.mp3"))
writefile("idle2.mp3", game:HttpGet("https://github.com/ian49972/smth/raw/refs/heads/main/idle2.mp3"))
writefile("idle3.mp3", game:HttpGet("https://github.com/ian49972/smth/raw/refs/heads/main/idle3.mp3"))

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local PlayerGui = player:WaitForChild("PlayerGui")
local selectGui = Instance.new("ScreenGui")
selectGui.Name = "SelectAvatarGui"
selectGui.ResetOnSpawn = false
selectGui.Parent = PlayerGui

local background = Instance.new("ImageLabel")
background.Size = UDim2.new(0.4, 0, 0.3, 0)
background.Position = UDim2.new(0.3, 0, 0.35, 0)
background.BackgroundTransparency = 1
background.Image = "rbxassetid://0"
background.Parent = selectGui

local chooseLabel = Instance.new("TextLabel")
chooseLabel.Size = UDim2.new(1, 0, 0.3, 0)
chooseLabel.Position = UDim2.new(0, 0, 0, 0)
chooseLabel.BackgroundTransparency = 1
chooseLabel.Text = "Choose"
chooseLabel.TextColor3 = Color3.new(1, 1, 1)
chooseLabel.TextScaled = true
chooseLabel.Font = Enum.Font.GothamBold
chooseLabel.Parent = background

local rigButton = Instance.new("ImageButton")
rigButton.Size = UDim2.new(0.45, 0, 0.6, 0)
rigButton.Position = UDim2.new(0.05, 0, 0.35, 0)
rigButton.BackgroundTransparency = 1
rigButton.Image = "rbxassetid://73924447759790"
rigButton.Parent = background

local normalButton = Instance.new("ImageButton")
normalButton.Size = UDim2.new(0.45, 0, 0.6, 0)
normalButton.Position = UDim2.new(0.5, 0, 0.35, 0)
normalButton.BackgroundTransparency = 1
normalButton.Image = "rbxassetid://122940089678550"
normalButton.Parent = background

local useRig = nil
local connection1, connection2
connection1 = rigButton.MouseButton1Click:Connect(function()
    useRig = true
    selectGui:Destroy()
    connection1:Disconnect()
    connection2:Disconnect()
end)
connection2 = normalButton.MouseButton1Click:Connect(function()
    useRig = false
    selectGui:Destroy()
    connection1:Disconnect()
    connection2:Disconnect()
end)

while useRig == nil do
    task.wait()
end

local subtitlesGui = Instance.new("ScreenGui")
subtitlesGui.Name = "SubtitlesGui"
subtitlesGui.ResetOnSpawn = false
subtitlesGui.Parent = PlayerGui

local subtitlesFrame = Instance.new("Frame")
subtitlesFrame.Size = UDim2.new(0.6, 0, 0.15, 0)
subtitlesFrame.Position = UDim2.new(0.2, 0, 0.65, 0)
subtitlesFrame.BackgroundTransparency = 0.5
subtitlesFrame.BackgroundColor3 = Color3.new(0, 0, 0)
subtitlesFrame.Parent = subtitlesGui

local headImage = Instance.new("ImageLabel")
headImage.Size = UDim2.new(0.1, 0, 0.5, 0)
headImage.Position = UDim2.new(0.45, 0, -0.5, 0)
headImage.BackgroundTransparency = 1
headImage.Image = useRig and "rbxassetid://98247433040220" or "rbxassetid://7361452666"
headImage.Parent = subtitlesFrame

local subtitlesLabel = Instance.new("TextLabel")
subtitlesLabel.Size = UDim2.new(1, 0, 0.8, 0)
subtitlesLabel.Position = UDim2.new(0, 0, 0.1, 0)
subtitlesLabel.BackgroundTransparency = 1
subtitlesLabel.Text = ""
subtitlesLabel.TextColor3 = Color3.new(1, 1, 1)
subtitlesLabel.TextScaled = true
subtitlesLabel.Font = Enum.Font.GothamBold
subtitlesLabel.RichText = false -- Disable rich text to avoid formatting issues
subtitlesLabel.Parent = subtitlesFrame

local function showSubtitles(text)
    subtitlesLabel.Text = ""
    local displayText = ""

    for i = 1, #text do
        displayText = displayText .. text:sub(i, i)
        subtitlesLabel.Text = displayText
        task.wait(0.05)
    end

    task.wait(2)
    subtitlesLabel.Text = ""
end

local gui = Instance.new("ScreenGui")        
gui.Name = "SimpleFadeGui"        
gui.ResetOnSpawn = false        
gui.Parent = PlayerGui        

local textLabel = Instance.new("TextLabel")        
textLabel.Size = UDim2.new(0.4, 0, 0.1, 0)        
textLabel.Position = UDim2.new(0.3, 0, 0.45, 0)        
textLabel.BackgroundTransparency = 1        
textLabel.TextScaled = true        
textLabel.Font = Enum.Font.GothamBold        
textLabel.TextColor3 = Color3.new(1, 1, 1)        
textLabel.Text = "Made by ban_thid or just Rob_SB4"        
textLabel.Parent = gui        

for i = 1, 30 do        
    textLabel.TextTransparency = i / 30        
    textLabel.TextStrokeTransparency = i / 30        
    wait(0.1)        
end        
wait(0.2)        
gui:Destroy()

local animateScript = character:FindFirstChild("Animate")
if animateScript then animateScript:Destroy() end

local voicelineSubtitles = {
    ["Corrupt.mp3"] = "You're NEVER getting away!",
    ["Corrupt2.mp3"] = "HAHAHAHA!",
    ["Walkspeed1.mp3"] = "FOUND YOU!",
    ["Walkspeed2.mp3"] = "HERE I COME!",
    ["Walkmiss.mp3"] = "You're only delaying the inevitable. HAHAHA... HAAAAAAAA!!!",
    ["Delivery.mp3"] = "They think they can HIDE from me! Hahahaha",
    ["kill1.mp3"] = "You're nobody special, you'll burn alive just like the rest of them! HAHAHAHAAAA!",
    ["kill2.mp3"] = "Hardly even worth my time.",
    ["kill3.mp3"] = "You're NOTHING to me!",
    ["kill4.mp3"] = "NOTHING but FILTH!",
    ["kill5.mp3"] = "Your strength may be adaquate, but your withs are LACKING. *giggle*",
    ["kill6.mp3"] = "We should play sometime! *giggle*",
    ["kill7.mp3"] = "You'll always be face to face WITH ME! HAHAHAHAHAAAA!",
    ["kill8.mp3"] = "Look at where GLUTTONY gets YOU. HAHAHAHAHAHAHAAAAA!!!",
    ["WalkspeedHit.mp3"] = "NO ESCAPE!! HAHAHAHAHAAAA!!!",
    ["idle1.mp3"] = "Placeholder",
    ["idle2.mp3"] = "Placeholder",
    ["idle3.mp3"] = "Placeholder"
}

local function playVoiceline(soundNames)
    local soundName
    if type(soundNames) == "table" then
        soundName = soundNames[math.random(1, #soundNames)]
    else
        soundName = soundNames
    end
    local sound = Instance.new("Sound")
    sound.SoundId = getcustomasset(soundName)
    sound.Volume = 10
    sound.Parent = workspace
    sound:Play()
    task.spawn(function()
        showSubtitles(voicelineSubtitles[soundName] or "")
    end)
    sound.Ended:Connect(function()
        sound:Destroy()
    end)
end

local idleVoicelineConnection
local function startIdleVoicelineLoop()
    if idleVoicelineConnection then
        idleVoicelineConnection:Disconnect()
    end
    idleVoicelineConnection = RunService.Heartbeat:Connect(function()
        if character and character.Parent and (currentState == "Idle" or currentState == "Walk") then
            if math.random() < 0.01 then -- Roughly every 5-15 seconds at 60 FPS
                playVoiceline({"idle1.mp3", "idle2.mp3", "idle3.mp3"})
            end
        end
    end)
end

function CloneMe(char)
    char.Archivable = true
    local clone = char:Clone()
    char.Archivable = false
    return clone
end

local function createBot()
    local bot = Players:CreateHumanoidModelFromUserId(8466354939)
    bot.Name = "Minion"
    bot.Parent = workspace
    if not bot:FindFirstChild("HumanoidRootPart") then
        local hrp = Instance.new("Part")
        hrp.Name = "HumanoidRootPart"
        hrp.Size = Vector3.new(2, 2, 1)
        hrp.Anchored = false
        hrp.CanCollide = true
        hrp.Transparency = 1
        hrp.Parent = bot
        bot:PivotTo(CFrame.new(0, 5, 0))
    end
    return bot
end

local npcModelAsset = game:GetObjects("rbxassetid://109884809281708")[1]
local fluidForceSensor = npcModelAsset:FindFirstChild("FluidForceSensor")
local mainModule = fluidForceSensor and fluidForceSensor:FindFirstChild("MainModule")
local rig = mainModule and mainModule:FindFirstChild("c00lkidd")
local model = rig and rig:FindFirstChild("Model")
local npcModel = model or npcModelAsset
npcModel:PivotTo(character:GetPivot())

local limbMap = {
    ["RightArm"] = "Right Arm",
    ["LeftArm"] = "Left Arm",
    ["RightLeg"] = "Right Leg",
    ["LeftLeg"] = "Left Leg",
    ["Torso"] = "Torso",
    ["Head"] = "Head"
}

local function weldPartToLimb(limb, partToWeld, originalParentPart)
    partToWeld.Anchored = false
    partToWeld.CanCollide = false
    partToWeld.Massless = true
    local relativeCFrame = originalParentPart.CFrame:ToObjectSpace(partToWeld.CFrame)
    local limbName = partToWeld.Name
    local offset
    if limbName == "Head" then
        offset = CFrame.new(0, 0.2, 0)
    elseif limbName == "Torso" then
        offset = CFrame.new(0, 0, 0)
    elseif limbName == "RightArm" or limbName == "LeftArm" then
        offset = CFrame.new(0, 0, 0.3)
    else
        offset = CFrame.new(0, 0, 0.2)
    end
    partToWeld.Parent = limb
    partToWeld.CFrame = limb.CFrame * relativeCFrame * offset
    local weld = Instance.new("WeldConstraint")
    weld.Part0 = limb
    weld.Part1 = partToWeld
    weld.Parent = partToWeld
end

if useRig then
    for _, limb in pairs(character:GetChildren()) do
        if limb:IsA("BasePart") and limb.Name ~= "HumanoidRootPart" then
            limb.Transparency = 1
        elseif limb:IsA("Accessory") then
            limb:Destroy()
        end
    end

    for _, customPart in pairs(npcModel:GetChildren()) do
        if customPart:IsA("BasePart") or customPart:IsA("MeshPart") then
            local limbName = customPart.Name
            local playerLimbName = limbMap[limbName]
            if playerLimbName then
                local playerLimb = character:FindFirstChild(playerLimbName)
                if playerLimb then
                    if playerLimbName == "Head" then
                        local faceDecal = playerLimb:FindFirstChild("face")
                        if faceDecal then faceDecal:Destroy() end
                    end
                    weldPartToLimb(playerLimb, customPart, customPart)
                end
            end
        end
    end
end
npcModel:Destroy()

local animModel = game:GetObjects("rbxassetid://102046170699445")[1]
animModel.Parent = workspace
animModel:PivotTo(character:GetPivot())

local animRig = animModel:FindFirstChild("RigCOOLKID")
if not animRig then
    warn("RigCOOLKID not found!")
    animModel:Destroy()
    return
end

local animsaves = animRig:FindFirstChild("AnimSaves")
if not animsaves then
    warn("AnimSaves not found in RigCOOLKID!")
    animModel:Destroy()
    return
end

local executeAnims = rig:FindFirstChild("AnimSaves")
if not executeAnims then
    warn("Execute AnimSaves not found!")
    npcModelAsset:Destroy()
    return
end

local safe = Instance.new("Folder")
safe.Name = "SafeKeyframes"
safe.Parent = player:WaitForChild("PlayerGui")

local function cloneAnim(name, source)
    local anim = source:FindFirstChild(name)
    if anim then
        local clone = anim:Clone()
        clone.Parent = safe
        return clone
    else
        warn("Failed to load: " .. name)
        return nil
    end
end

local idleKF = cloneAnim("idle", animsaves)
local walkKF = cloneAnim("walk", animsaves)
local attackKF = cloneAnim("attack", animsaves)
local killKF = cloneAnim("Execute_KillerRig", executeAnims)
local killvictimKF = cloneAnim("Execute_PlayerRig", executeAnims)
local wostartKF = cloneAnim("wostart", animsaves)
local woloopKF = cloneAnim("woloop", animsaves)
local woconnectedKF = cloneAnim("woconnected", animsaves)
local corruptnatureKF = cloneAnim("corruptnature", animsaves)
local deliverysummonedCOOLKF = cloneAnim("deliverysummonedCOOL", animsaves)
local deliverysummonedKF = cloneAnim("deliverysummoned", animsaves)
local deliverywalkKF = cloneAnim("deliverywalk", animsaves)
local deliveryhitKF = cloneAnim("deliveryhit", animsaves)

animModel:Destroy()
npcModelAsset:Destroy()

if not (idleKF and walkKF and killKF and killvictimKF) then
    warn("Critical animations missing!")
    return
end

local tStyle = {
    [Enum.PoseEasingStyle.Linear] = Enum.EasingStyle.Linear,
    [Enum.PoseEasingStyle.Bounce] = Enum.EasingStyle.Bounce,
    [Enum.PoseEasingStyle.Cubic] = Enum.EasingStyle.Cubic,
    [Enum.PoseEasingStyle.Elastic] = Enum.EasingStyle.Elastic,
    [Enum.PoseEasingStyle.Constant] = Enum.EasingStyle.Linear,
}
local tDirection = {
    [Enum.PoseEasingDirection.In] = Enum.EasingDirection.In,
    [Enum.PoseEasingDirection.Out] = Enum.EasingDirection.Out,
    [Enum.PoseEasingDirection.InOut] = Enum.EasingDirection.InOut,
}

local function BuildTweens(Model, KeyFrameSequence)
    local frames = {}
    local keyframes = KeyFrameSequence:GetKeyframes()
    if not keyframes then
        warn("No keyframes found in: " .. KeyFrameSequence.Name)
        return {}, {}, {}
    end

    for i, kf in ipairs(keyframes) do
        if kf and kf:IsA("Keyframe") and type(kf.Time) == "number" then
            table.insert(frames, {Time = kf.Time, Keyframe = kf})
        else
            warn("Invalid keyframe at index " .. i .. " in " .. KeyFrameSequence.Name)
        end
    end

    if #frames == 0 then
        warn("No valid keyframes in: " .. KeyFrameSequence.Name)
        return {}, {}, {}
    end

    table.sort(frames, function(a, b) return a.Time < b.Time end)

    local tweens, motors, values, keyPoses = {}, {}, {}, {}
    local function GetMotorFromPose(pose)
        for _, v in pairs(Model:GetDescendants()) do
            if v:IsA("Motor6D") and v.Part1 and v.Part0 and v.Part1.Name == pose.Name and v.Part0.Name == pose.Parent.Name then
                return v
            end
        end
    end

    for i, frame in ipairs(frames) do
        keyPoses[i] = {Time = frame.Time, Poses = {}}
        for _, pose in ipairs(frame.Keyframe:GetDescendants()) do
            if pose:IsA("Pose") and pose.Weight > 0 then
                local motor = GetMotorFromPose(pose)
                if motor then
                    if not motors[pose.Name] then
                        motors[pose.Name] = motor
                        local cv = Instance.new("CFrameValue")
                        cv.Value = motor.Transform
                        cv.Parent = motor
                        values[pose.Name] = cv
                    end
                    keyPoses[i].Poses[pose.Name] = {Motor = motor, Pose = pose}
                end
            end
        end
    end

    if #keyPoses > 1 then
        for i = 1, #keyPoses - 1 do
            local k1, k2 = keyPoses[i], keyPoses[i + 1]
            local dur = k2.Time - k1.Time
            if dur > 0 then
                tweens[i] = {Time = dur, Tweens = {}}
                for poseName, d in pairs(k2.Poses) do
                    if k1.Poses[poseName] then
                        local info = TweenInfo.new(
                            dur,
                            tStyle[k1.Poses[poseName].Pose.EasingStyle],
                            tDirection[k1.Poses[poseName].Pose.EasingDirection]
                        )
                        tweens[i].Tweens[poseName] = TweenService:Create(values[poseName], info, {Value = d.Pose.CFrame})
                    end
                end
            end
        end
    end

    return tweens, motors, values
end

local function PlayKeyframeSequence(Model, KeyFrameSequence, looped, onFinished, preTweens, preMotors, preValues)
    local tweens, motors, values
    if preTweens then
        tweens, motors, values = preTweens, preMotors, preValues
    else
        tweens, motors, values = BuildTweens(Model, KeyFrameSequence)
    end
    if #tweens == 0 then
        warn("Failed to build tweens for: " .. (KeyFrameSequence and KeyFrameSequence.Name or "unknown"))
        if onFinished then onFinished() end
        return function() end
    end

    local stopped = false
    local hb
    hb = RunService.Heartbeat:Connect(function()
        if stopped or not Model.Parent then
            hb:Disconnect()
            for _, v in pairs(values) do
                if v then v:Destroy() end
            end
            return
        end
        for n, motor in pairs(motors) do
            if motor and motor.Parent then
                motor.Transform = values[n].Value
            end
        end
    end)

    local function loop()
        for _, segment in ipairs(tweens) do
            for _, tw in pairs(segment.Tweens) do
                if tw then tw:Play() end
            end
            task.wait(segment.Time)
            if stopped or not Model.Parent then break end
        end
        if not looped and not stopped then
            stopped = true
            if onFinished then onFinished() end
        elseif looped and not stopped then
            task.spawn(loop)
        end
    end

    task.spawn(loop)

    return function()
        stopped = true
        for _, segment in ipairs(tweens) do
            for _, tw in pairs(segment.Tweens) do
                if tw then tw:Cancel() end
            end
        end
        if hb then hb:Disconnect() end
    end
end

local idleTweens, idleMotors, idleValues = BuildTweens(character, idleKF)
local walkTweens, walkMotors, walkValues = BuildTweens(character, walkKF)

local currentStopper
local currentAnim
local currentState = "Idle"
local animator = humanoid:FindFirstChildOfClass("Animator")
if animator then animator.Parent = nil end

local function playAnim(model, anim, looped, onFinished)
    if not anim then
        warn("Cannot play nil animation")
        return
    end
    if currentAnim == anim then return end
    if currentStopper then
        currentStopper()
        currentStopper = nil
    end
    currentAnim = anim
    local preT, preM, preV
    if anim == idleKF then
        preT, preM, preV = idleTweens, idleMotors, idleValues
    elseif anim == walkKF then
        preT, preM, preV = walkTweens, walkMotors, walkValues
    end
    currentStopper = PlayKeyframeSequence(model, anim, looped, function()
        if onFinished then onFinished() end
        currentAnim = nil
        updateMovementAnimations()
    end, preT, preM, preV)
end

local function updateMovementAnimations()
    if currentState == "Action" then return end
    local moving = humanoid.MoveDirection.Magnitude > 0
    if moving and currentState ~= "Walk" then
        currentState = "Walk"
        playAnim(character, walkKF, true)
    elseif not moving and currentState ~= "Idle" then
        currentState = "Idle"
        playAnim(character, idleKF, true)
    end
end

humanoid.WalkSpeed = 16

local lastUpdate = 0
local updateInterval = 0.1
RunService.RenderStepped:Connect(function()
    if tick() - lastUpdate < updateInterval then return end
    lastUpdate = tick()
    updateMovementAnimations()
end)

startIdleVoicelineLoop()

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AbilityUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

local cooldowns = {}
local isWalkspeedActive = false
local isKilling = false

local function isOnCooldown(name)
    return cooldowns[name] and tick() < cooldowns[name]
end

local function setCooldown(name, duration)
    cooldowns[name] = tick() + duration
end

local function makeAbilityButton(name, pos, color, func, cd)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Size = UDim2.new(0, 120, 0, 40)
    btn.Position = pos
    btn.BackgroundColor3 = color
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.Text = name
    btn.Parent = screenGui
    btn.MouseButton1Click:Connect(function()
        if isOnCooldown(name) then return end
        setCooldown(name, cd)
        currentState = "Action"
        func()
        task.spawn(function()
            while isOnCooldown(name) do
                btn.Text = math.ceil(cooldowns[name] - tick()) .. "s"
                task.wait(1)
            end
            btn.Text = name
        end)
    end)
end

makeAbilityButton("Corrupt Nature", UDim2.new(0, 20, 1, -50), Color3.fromRGB(50, 150, 255), function()
    playVoiceline({"Corrupt.mp3", "Corrupt2.mp3"})
    playAnim(character, corruptnatureKF, false, function()
        currentState = "Idle"
    end)
    local cam = workspace.CurrentCamera
    local direction = cam.CFrame.LookVector
    local part = Instance.new("Part")
    part.Size = Vector3.new(1, 1, 1)
    part.Anchored = false
    part.CanCollide = false
    part.Position = character.Head.Position + direction * 2
    part.Parent = workspace
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Velocity = direction * 100
    bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bodyVelocity.Parent = part
    task.delay(8, function() if part then part:Destroy() end end)
    local conn
    conn = part.Touched:Connect(function(hit)
        local targetChar = hit:FindFirstAncestorOfClass("Model")
        if targetChar and targetChar ~= character then
            local targetHum = targetChar:FindFirstChild("Humanoid")
            if targetHum then
                local dmg = 15
                local isLastHit = (targetHum.Health - dmg <= 0)
                targetHum:TakeDamage(dmg)
                if isLastHit then targetHum.Health = targetHum.MaxHealth end
                local highlight = Instance.new("Highlight")
                highlight.FillColor = Color3.fromRGB(255, 165, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 165, 0)
                highlight.Parent = targetChar
                task.delay(5, function() if highlight then highlight:Destroy() end end)
                conn:Disconnect()
                part:Destroy()
            end
        end
    end)
end, 7)

makeAbilityButton("Walkspeed", UDim2.new(0, 150, 1, -50), Color3.fromRGB(150, 50, 255), function()
    playVoiceline({"Walkspeed1.mp3", "Walkspeed2.mp3"})
    isWalkspeedActive = true
    playAnim(character, wostartKF, false, function()
        playAnim(character, woloopKF, true)
        local direction = character.HumanoidRootPart.CFrame.LookVector
        local speed = 45
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Velocity = direction * speed
        bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bodyVelocity.Parent = character.HumanoidRootPart
        local hitbox = Instance.new("Part")
        hitbox.Size = Vector3.new(3, 3, 5)
        hitbox.Transparency = 1
        hitbox.CanCollide = false
        hitbox.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3)
        hitbox.Parent = workspace
        local weld = Instance.new("WeldConstraint")
        weld.Part0 = character.HumanoidRootPart
        weld.Part1 = hitbox
        weld.Parent = hitbox
        local hitRegistered = false
        local touchConn
        touchConn = hitbox.Touched:Connect(function(hit)
            if not isWalkspeedActive then return end
            if not hit:IsDescendantOf(character) then
                local targetChar = hit:FindFirstAncestorOfClass("Model")
                if targetChar then
                    local targetHum = targetChar:FindFirstChild("Humanoid")
                    if targetHum then
                        hitRegistered = true
                        playVoiceline("WalkspeedHit.mp3")
                        local dmg = 45
                        local isLastHit = (targetHum.Health - dmg <= 0)
                        targetHum:TakeDamage(dmg)
                        if isLastHit then targetHum.Health = targetHum.MaxHealth end
                        if bodyVelocity then bodyVelocity:Destroy() end
                        if hitbox then hitbox:Destroy() end
                        touchConn:Disconnect()
                        isWalkspeedActive = false
                        playAnim(character, woconnectedKF, false, function()
                            currentState = "Idle"
                        end)
                    end
                end
            end
        end)
        task.delay(2.5, function()
            if isWalkspeedActive then
                if not hitRegistered then
                    playVoiceline("Walkmiss.mp3")
                end
                if bodyVelocity then bodyVelocity:Destroy() end
                if hitbox then hitbox:Destroy() end
                if touchConn then touchConn:Disconnect() end
                isWalkspeedActive = false
                currentState = "Idle"
            end
        end)
    end)
end, 10)

makeAbilityButton("M1", UDim2.new(0, 280, 1, -50), Color3.fromRGB(255, 150, 50), function()
    playAnim(character, attackKF, false, function()
        if hitbox then hitbox:Destroy() end
        currentState = "Idle"
    end)
    local hitbox = Instance.new("Part")
    hitbox.Size = Vector3.new(3, 3, 5)
    hitbox.Transparency = 1
    hitbox.CanCollide = false
    hitbox.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3)
    hitbox.Parent = workspace
    local weld = Instance.new("WeldConstraint")
    weld.Part0 = character.HumanoidRootPart
    weld.Part1 = hitbox
    weld.Parent = hitbox
    local connection
    connection = hitbox.Touched:Connect(function(hit)
        if isKilling then return end
        if not hit:IsDescendantOf(character) then
            local targetChar = hit:FindFirstAncestorOfClass("Model")
            if targetChar then
                local targetHum = targetChar:FindFirstChild("Humanoid")
                if targetHum then
                    local targetPlayer = Players:GetPlayerFromCharacter(targetChar)
                    if targetPlayer then
                        local dmg = 20
                        local isLastHit = (targetHum.Health - dmg <= 0)
                        if isLastHit then
                            targetHum.Health = 1
                            isKilling = true
                            playVoiceline({"kill1.mp3", "kill2.mp3", "kill3.mp3", "kill4.mp3", "kill5.mp3", "kill6.mp3", "kill7.mp3", "kill8.mp3"})
                            local charClone = CloneMe(targetChar)
                            charClone.Parent = workspace
                            local cloneHRP = charClone:WaitForChild("HumanoidRootPart")
                            cloneHRP.CFrame = character.HumanoidRootPart.CFrame
                            local cloneWeld = Instance.new("WeldConstraint")
                            cloneWeld.Part0 = character.HumanoidRootPart
                            cloneWeld.Part1 = cloneHRP
                            cloneWeld.Parent = cloneHRP
                            playAnim(character, killKF, false, function()
                                if charClone then charClone:Destroy() end
                                currentState = "Idle"
                                isKilling = false
                            end)
                            PlayKeyframeSequence(charClone, killvictimKF, false, function()
                                if charClone then charClone:Destroy() end
                            end)
                            targetHum:TakeDamage(dmg)
                            targetHum.Health = targetHum.MaxHealth
                            connection:Disconnect()
                            hitbox:Destroy()
                        else
                            targetHum:TakeDamage(dmg)
                            connection:Disconnect()
                            hitbox:Destroy()
                        end
                    end
                end
            end
        end
    end)
end, 2)

makeAbilityButton("Delivery", UDim2.new(0, 410, 1, -50), Color3.fromRGB(50, 255, 50), function()
    playVoiceline("Delivery.mp3")
    playAnim(character, deliverysummonedCOOLKF, false, function()
        currentState = "Idle"
    end)
    for i = 1, 2 do
        local offset = (i == 1 and -3 or 3)
        local npc = createBot()
        npc:PivotTo(character.HumanoidRootPart.CFrame * CFrame.new(offset, 0, 0))
        PlayKeyframeSequence(npc, deliverysummonedKF, false, function()
            local hum = npc:FindFirstChild("Humanoid")
            if not hum then return end
            local minionStopper = PlayKeyframeSequence(npc, deliverywalkKF, true)
            task.spawn(function()
                local startTime = tick()
                while npc and npc.Parent and tick() - startTime < 10 do
                    local nearest, dist = nil, math.huge
                    for _, p in pairs(Players:GetPlayers()) do
                        if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                            local d = (p.Character.HumanoidRootPart.Position - npc.HumanoidRootPart.Position).Magnitude
                            if d < dist then
                                dist = d
                                nearest = p.Character
                            end
                        end
                    end
                    if nearest then
                        hum:MoveTo(nearest.HumanoidRootPart.Position)
                        if dist < 3 then
                            minionStopper()
                            PlayKeyframeSequence(npc, deliveryhitKF, false, function()
                                if npc then npc:Destroy() end
                            end)
                            local targetHum = nearest:FindFirstChild("Humanoid")
                            if targetHum then
                                local dmg = 20
                                local isLastHit = (targetHum.Health - dmg <= 0)
                                targetHum:TakeDamage(dmg)
                                if isLastHit then targetHum.Health = targetHum.MaxHealth end
                            end
                            return
                        end
                    else
                        minionStopper()
                        if npc then npc:Destroy() end
                        return
                    end
                    task.wait(0.1)
                end
                minionStopper()
                if npc then npc:Destroy() end
            end)
        end)
    end
end, 15)

local backgroundMusic
local function playBackgroundMusic()
    if not backgroundMusic then
        backgroundMusic = Instance.new("Sound")
        backgroundMusic.Name = "CompassSound"
        backgroundMusic.SoundId = getcustomasset("C00L.mp3")
        backgroundMusic.Volume = 1
        backgroundMusic.Looped = true
        backgroundMusic.Parent = workspace
        backgroundMusic:Play()
    end
end
playBackgroundMusic()

humanoid.Died:Connect(function()
    if backgroundMusic then
        backgroundMusic:Stop()
        backgroundMusic:Destroy()
        backgroundMusic = nil
    end
    if idleVoicelineConnection then
        idleVoicelineConnection:Disconnect()
        idleVoicelineConnection = nil
    end
    if currentStopper then
        currentStopper()
    end
    if screenGui then
        screenGui:Destroy()
    end
    if subtitlesGui then
        subtitlesGui:Destroy()
    end
    local animator = humanoid:FindFirstChildOfClass("Animator")
    if animator and not animator.Parent then
        animator.Parent = humanoid
    end
end)

player.CharacterAdded:Connect(function(newChar)
    character = newChar
    humanoid = character:WaitForChild("Humanoid")
    humanoid.WalkSpeed = 16
    currentState = "Idle"
    if currentStopper then
        currentStopper()
    end
    currentAnim = nil
    updateMovementAnimations()
    startIdleVoicelineLoop()
end)
