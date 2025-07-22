-- 🎨 VISUELS ULTRA DIEU MODE 💎
local function createDrawings()
    if not CONFIG.VISUALS_ENABLED then return end
    
    pcall(function()
        if Drawing and Drawing.new then
            -- 🌟 Cercle FOV ULTRA STYLÉ
            State.drawings.fovCircle = Drawing.new("Circle")
            State.drawings.fovCircle.Thickness = 2
            State.drawings.fovCircle.NumSides = 120 -- Ultra smooth
            State.drawings.fovCircle.Radius = CONFIG.RADIUS
            State.drawings.fovCircle.Color = Color3.fromHSV(tick() % 1, 0.8, 1) -- Couleur qui change
            State.drawings.fovCircle.Filled = false
            State.drawings.fovCircle.Visible = false
            State.drawings.fovCircle.Transparency = 0.4
            
            -- ⚡ Traceur ULTRA STYLÉ
            State.drawings.tracer = Drawing.new("Line")
            State.drawings.tracer.Thickness = 2.5
            State.drawings.tracer.Color = Color3.fromRGB(255, 50, 50)
            State.drawings.tracer.Visible = false
            State.drawings.tracer.Transparency = 0.6
            
            -- 🎯 Point central DIEU
            State.drawings.centerDot = Drawing.new("Circle")
            State.drawings.centerDot.Thickness = 2
            State.drawings.centerDot.NumSides = 16
            State.drawings.centerDot.Radius = 2.5
            State.drawings.centerDot.Color = Color3.fromRGB(0, 255, 100)
            State.drawings.centerDot.Filled = true
            State.drawings.centerDot.Visible = false
            
            -- 💀 Indicateur de cible ULTRA MORTEL
            State.drawings.targetIndicator = Drawing.new("Circle")
            State.drawings.targetIndicator.Thickness = 3
            State.drawings.targetIndicator.NumSides = 24
            State.drawings.targetIndicator.Radius = 20
            State.drawings.targetIndicator.Color = Color3.fromRGB(255, 0, 100)
            State.drawings.targetIndicator.Filled = false
            State.drawings.targetIndicator.Visible = false
            
            -- 🎪 NOUVEAUX VISUELS ULTRA FOUS
            
            -- 📍 Indicateur de distance
            State.drawings.distanceText = Drawing.new("Text")
            State.drawings.distanceText.Text = ""
            State.drawings.distanceText.Size = 16
            State.drawings.distanceText.Color = Color3.fromRGB(255, 255, 255)
            State.drawings.distanceText.Center = true
            State.drawings.distanceText.Outline = true
            -- Script d'assistance amélioré avec corrections d'erreurs

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer

-- ⏳ Attendre le chargement complet avec timeout
local function waitForPlayer()
    local attempts = 0
    repeat 
        wait(0.1)
        attempts = attempts + 1
        if attempts > 100 then -- 10 secondes timeout
            warn("Timeout: Joueur non chargé")
            return false
        end
    until LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
    return true
end

if not waitForPlayer() then
    return -- Arrêter le script si le joueur n'est pas chargé
end

-- ⚙️ CONFIGURATION ULTRA DIEU MODE 🔥
local CONFIG = {
    RADIUS = 180,                -- FOV élargi pour plus de cibles
    AIM_ASSIST_STRENGTH = 0.85,  -- ULTRA PUISSANT mais toujours naturel
    SILENT_AIM_ENABLED = true,
    AIM_ASSIST_ENABLED = true,
    VISUALS_ENABLED = true,
    PREDICTION = 0.18,           -- Prédiction DIEU MODE
    SMOOTHNESS = 8,              -- Plus réactif
    MAX_DISTANCE = 400,          -- Distance SNIPER
    MIN_HEALTH = 1,
    TARGET_PARTS = {"Head", "UpperTorso", "HumanoidRootPart", "Torso", "LowerTorso"}, -- TOUTES LES PARTIES
    UPDATE_RATE = 120,           -- 120 FPS = ULTRA SMOOTH
    
    -- 🚀 NOUVEAUX PARAMÈTRES DE FOU
    HEADSHOT_PRIORITY = true,     -- Priorité absolue à la tête
    WALL_DETECTION = true,        -- Détection des murs
    TEAM_CHECK = true,            -- Ne pas viser les alliés
    JUMP_PREDICTION = true,       -- Prédiction des sauts
    CROUCH_COMPENSATION = true,   -- Compensation accroupi
    RAGE_MODE = false,            -- Mode rage (très agressif)
    LEGIT_MODE = true,            -- Mode légit (plus humain)
    ADAPTIVE_FOV = true,          -- FOV qui s'adapte à la distance
    FLICK_ASSIST = true,          -- Assistance pour les flicks rapides
    MICRO_MOVEMENTS = true        -- Micro-mouvements ultra précis
}

-- 🔘 Variables d'état améliorées
local State = {
    isAiming = false,
    currentTarget = nil,
    targetPlayer = nil,
    targetPart = nil,
    drawings = {},
    connections = {},
    hookedEvents = {},
    lastUpdate = 0,
    frameCount = 0,
    isDestroyed = false
}

-- 🧹 Fonction de nettoyage
local function cleanup()
    State.isDestroyed = true
    
    -- Nettoyer les dessins
    for _, drawing in pairs(State.drawings) do
        if drawing and drawing.Remove then
            pcall(function() drawing:Remove() end)
        end
    end
    
    -- Nettoyer les connexions
    for _, connection in pairs(State.connections) do
        if connection and connection.Disconnect then
            pcall(function() connection:Disconnect() end)
        end
    end
    
    State.drawings = {}
    State.connections = {}
end

-- 🎨 Création des visuels améliorée
local function createDrawings()
    if not CONFIG.VISUALS_ENABLED then return end
    
    pcall(function()
        -- Cercle FOV avec vérification
        if Drawing and Drawing.new then
            State.drawings.fovCircle = Drawing.new("Circle")
            State.drawings.fovCircle.Thickness = 1.5
            State.drawings.fovCircle.NumSides = 64
            State.drawings.fovCircle.Radius = CONFIG.RADIUS
            State.drawings.fovCircle.Color = Color3.fromRGB(255, 255, 255)
            State.drawings.fovCircle.Filled = false
            State.drawings.fovCircle.Visible = false
            State.drawings.fovCircle.Transparency = 0.7
            
            -- Traceur
            State.drawings.tracer = Drawing.new("Line")
            State.drawings.tracer.Thickness = 1.5
            State.drawings.tracer.Color = Color3.fromRGB(255, 100, 100)
            State.drawings.tracer.Visible = false
            State.drawings.tracer.Transparency = 0.8
            
            -- Point central
            State.drawings.centerDot = Drawing.new("Circle")
            State.drawings.centerDot.Thickness = 1
            State.drawings.centerDot.NumSides = 12
            State.drawings.centerDot.Radius = 1.5
            State.drawings.centerDot.Color = Color3.fromRGB(0, 255, 0)
            State.drawings.centerDot.Filled = true
            State.drawings.centerDot.Visible = false
            
            -- Indicateur de cible
            State.drawings.targetIndicator = Drawing.new("Circle")
            State.drawings.targetIndicator.Thickness = 2
            State.drawings.targetIndicator.NumSides = 16
            State.drawings.targetIndicator.Radius = 12
            State.drawings.targetIndicator.Color = Color3.fromRGB(255, 0, 0)
            State.drawings.targetIndicator.Filled = false
            State.drawings.targetIndicator.Visible = false
        end
    end)
end

-- 📍 Centre de l'écran avec vérification
local function getScreenCenter()
    if not Camera or not Camera.ViewportSize then
        return Vector2.new(0, 0)
    end
    return Camera.ViewportSize * 0.5
end

-- 🎯 PRÉDICTION QUANTIQUE ULTRA DIEU 🚀
local function getPredictedPosition(targetPart)
    if not targetPart or not targetPart.Parent then 
        return targetPart and targetPart.Position or Vector3.new(0, 0, 0)
    end
    
    local character = targetPart.Parent
    local humanoid = character:FindFirstChild("Humanoid")
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    
    if not humanoidRootPart then return targetPart.Position end
    
    local velocity = humanoidRootPart.AssemblyLinearVelocity or humanoidRootPart.Velocity or Vector3.new(0,0,0)
    local speed = velocity.Magnitude
    
    -- 🧠 PRÉDICTION ULTRA AVANCÉE
    local basePrediction = CONFIG.PREDICTION
    local finalPrediction = basePrediction
    
    -- 🏃 COMPENSATION DE VITESSE QUANTIQUE
    if speed > 16 then
        -- Cible qui court = plus de prédiction
        finalPrediction = basePrediction * (1 + speed / 30)
    elseif speed < 4 then
        -- Cible lente/statique = moins de prédiction
        finalPrediction = basePrediction * 0.5
    end
    
    -- 🦘 DÉTECTION DE SAUT ULTRA PRO
    if CONFIG.JUMP_PREDICTION and humanoid then
        local jumpState = humanoid:GetState()
        if jumpState == Enum.HumanoidStateType.Freefall or 
           jumpState == Enum.HumanoidStateType.Flying or 
           jumpState == Enum.HumanoidStateType.Jumping then
            -- En l'air = prédiction de gravité
            finalPrediction = finalPrediction * 1.3
            local gravityCompensation = Vector3.new(0, -workspace.Gravity * finalPrediction * 0.1, 0)
            return targetPart.Position + (velocity * finalPrediction) + gravityCompensation
        end
    end
    
    -- 🦆 COMPENSATION ACCROUPI
    if CONFIG.CROUCH_COMPENSATION and humanoid and humanoid.Sit then
        finalPrediction = finalPrediction * 0.7 -- Moins de mouvement accroupi
    end
    
    -- 🎯 PRÉDICTION SELON LA PARTIE DU CORPS
    local bodyPartMultiplier = 1.0
    if targetPart.Name == "Head" then
        bodyPartMultiplier = 0.9 -- Tête bouge moins
    elseif targetPart.Name == "HumanoidRootPart" then
        bodyPartMultiplier = 1.1 -- Centre de masse plus prévisible
    end
    
    finalPrediction = finalPrediction * bodyPartMultiplier
    
    return targetPart.Position + (velocity * finalPrediction)
end

-- 🏥 Vérifier la santé du joueur
local function isPlayerAlive(player)
    if not player or not player.Character then return false end
    
    local humanoid = player.Character:FindFirstChild("Humanoid")
    return humanoid and humanoid.Health >= CONFIG.MIN_HEALTH
end

-- 🔍 SYSTÈME DE CIBLAGE ULTRA INTELLIGENT 🎯
local function getBestTarget()
    if State.isDestroyed then return nil, nil, nil end
    
    local bestTarget = nil
    local bestPlayer = nil
    local bestPart = nil
    local bestScore = math.huge -- Plus petit score = meilleure cible
    local screenCenter = getScreenCenter()
    
    -- Vérifier si nous avons un personnage valide
    if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        return nil, nil, nil
    end
    
    local myPosition = LocalPlayer.Character.HumanoidRootPart.Position
    local myTeam = LocalPlayer.Team
    
    -- 🎯 FOV ADAPTATIF ULTRA INTELLIGENT
    local adaptiveFOV = CONFIG.RADIUS
    if CONFIG.ADAPTIVE_FOV then
        local targetCount = 0
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and isPlayerAlive(player) then
                targetCount = targetCount + 1
            end
        end
        
        -- Plus il y a de cibles, plus le FOV est grand
        adaptiveFOV = CONFIG.RADIUS + (targetCount * 10)
        adaptiveFOV = math.min(adaptiveFOV, 300) -- Maximum 300
    end
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and isPlayerAlive(player) then
            -- 👥 VÉRIFICATION D'ÉQUIPE
            if CONFIG.TEAM_CHECK and myTeam and player.Team == myTeam then
                continue -- Skip les alliés
            end
            
            local character = player.Character
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            local humanoid = character:FindFirstChild("Humanoid")
            
            if humanoidRootPart and humanoid then
                -- 📏 VÉRIFICATION DE DISTANCE 3D
                local distance3D = (humanoidRootPart.Position - myPosition).Magnitude
                if distance3D > CONFIG.MAX_DISTANCE then continue end
                
                -- 🏃 ANALYSE DE MOUVEMENT
                local velocity = humanoidRootPart.AssemblyLinearVelocity or humanoidRootPart.Velocity or Vector3.new(0,0,0)
                local speed = velocity.Magnitude
                
                -- Essayer différentes parties du corps avec système de score
                for priority, partName in ipairs(CONFIG.TARGET_PARTS) do
                    local targetPart = character:FindFirstChild(partName)
                    if targetPart then
                        -- 🎯 PRÉDICTION ULTRA AVANCÉE
                        local predictedPos = getPredictedPosition(targetPart)
                        local screenPoint, onScreen = Camera:WorldToViewportPoint(predictedPos)
                        
                        if onScreen and screenPoint.Z > 0 then
                            local targetScreenPos = Vector2.new(screenPoint.X, screenPoint.Y)
                            local distanceFromCenter = (targetScreenPos - screenCenter).Magnitude
                            
                            -- Vérifier si dans le FOV adaptatif
                            if distanceFromCenter <= adaptiveFOV then
                                -- 🧮 CALCUL DE SCORE ULTRA INTELLIGENT
                                local score = distanceFromCenter
                                
                                -- 🎯 PRIORITÉ DES PARTIES DU CORPS
                                local partPriority = {
                                    Head = 0.6,           -- HEADSHOT PRIORITÉ ABSOLUE
                                    UpperTorso = 0.8,     -- Bon compromis
                                    Torso = 0.85,         -- Centre de masse
                                    HumanoidRootPart = 0.9,
                                    LowerTorso = 0.95
                                }
                                score = score * (partPriority[partName] or 1.0)
                                
                                -- 📏 BONUS DISTANCE 3D (plus proche = mieux)
                                score = score * (1 + distance3D / 1000)
                                
                                -- 🏃 BONUS/MALUS VITESSE
                                if speed < 5 then
                                    score = score * 0.8 -- Cible statique = plus facile
                                elseif speed > 20 then
                                    score = score * 1.3 -- Cible rapide = plus difficile
                                end
                                
                                -- 🎯 BONUS HEADSHOT MODE
                                if CONFIG.HEADSHOT_PRIORITY and partName == "Head" then
                                    score = score * 0.4 -- ULTRA PRIORITÉ TÊTE
                                end
                                
                                -- 💔 BONUS SANTÉ BASSE
                                if humanoid.Health <= 30 then
                                    score = score * 0.7 -- Cible blessée = priorité
                                end
                                
                                -- 🧱 VÉRIFICATION MUR (si activée)
                                if CONFIG.WALL_DETECTION then
                                    local raycast = workspace:Raycast(myPosition, predictedPos - myPosition)
                                    if raycast and raycast.Instance then
                                        local hitPart = raycast.Instance
                                        -- Si on touche autre chose que le joueur cible
                                        if not hitPart:IsDescendantOf(character) then
                                            score = score * 2.0 -- Pénalité mur
                                        end
                                    end
                                end
                                
                                -- 🏆 MEILLEURE CIBLE TROUVÉE
                                if score < bestScore then
                                    bestScore = score
                                    bestTarget = targetPart
                                    bestPlayer = player
                                    bestPart = partName
                                end
                                
                                break -- Prendre la première partie valide trouvée pour ce joueur
                            end
                        end
                    end
                end
            end
        end
    end
    
    -- 📊 STATS DE DÉBOGAGE (optionnel)
    if bestTarget then
        State.targetStats = {
            player = bestPlayer.Name,
            part = bestPart,
            score = bestScore,
            distance = (bestTarget.Position - myPosition).Magnitude
        }
    end
    
    return bestTarget, bestPlayer, bestPart
end

-- 🎮 AIM ASSIST ULTRA-DÉMENT DE FOU MALADE 🔥🔥🔥
local function performAimAssist()
    if State.isDestroyed or not CONFIG.AIM_ASSIST_ENABLED or not State.isAiming or not State.currentTarget then
        return
    end
    
    -- Limiter la fréquence de mise à jour HYPER OPTIMISÉE
    local currentTime = tick()
    if currentTime - State.lastUpdate < 1/CONFIG.UPDATE_RATE then
        return
    end
    State.lastUpdate = currentTime
    
    -- 🎯 PRÉDICTION QUANTIQUE ULTRA AVANCÉE
    local predictedPos = getPredictedPosition(State.currentTarget)
    local screenPoint, onScreen = Camera:WorldToViewportPoint(predictedPos)
    
    if not onScreen or screenPoint.Z <= 0 then return end
    
    local screenCenter = getScreenCenter()
    local targetScreenPos = Vector2.new(screenPoint.X, screenPoint.Y)
    local deltaVector = targetScreenPos - screenCenter
    local distance = deltaVector.Magnitude
    
    -- Ne pas bouger si déjà LOCK sur la cible
    if distance < 3 then return end
    
    -- 🧠 CALCUL D'IA NEURAL ULTRA AVANCÉ
    local baseStrength = CONFIG.AIM_ASSIST_STRENGTH
    local baseSmoothness = CONFIG.SMOOTHNESS
    
    -- 💎 ALGORITHME DE DISTANCE QUANTIQUE
    local distanceMultiplier = 1.0
    local smoothnessMultiplier = 1.0
    local accelerationFactor = 1.0
    
    if distance > 150 then
        -- CIBLE ULTRA LOIN = MODE SNIPER
        distanceMultiplier = 1.8
        smoothnessMultiplier = 0.4
        accelerationFactor = 2.2
    elseif distance > 100 then
        -- CIBLE LOIN = MODE ASSAULT
        distanceMultiplier = 1.5
        smoothnessMultiplier = 0.6
        accelerationFactor = 1.8
    elseif distance > 50 then
        -- CIBLE MOYENNE = MODE NORMAL
        distanceMultiplier = 1.2
        smoothnessMultiplier = 0.8
        accelerationFactor = 1.4
    elseif distance > 20 then
        -- CIBLE PROCHE = MODE PRECISION
        distanceMultiplier = 0.9
        smoothnessMultiplier = 1.3
        accelerationFactor = 1.1
    else
        -- CIBLE TRÈS PROCHE = MODE MICRO-AJUSTEMENT
        distanceMultiplier = 0.4
        smoothnessMultiplier = 2.5
        accelerationFactor = 0.6
    end
    
    -- 🚀 CALCUL DE VÉLOCITÉ DE LA CIBLE POUR PRÉDICTION DIEU
    local targetVelocity = Vector2.new(0, 0)
    if State.currentTarget and State.currentTarget.Parent then
        local humanoidRootPart = State.currentTarget.Parent:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            local velocity3D = humanoidRootPart.AssemblyLinearVelocity or humanoidRootPart.Velocity or Vector3.new(0,0,0)
            local velocityScreen, _ = Camera:WorldToViewportPoint(humanoidRootPart.Position + velocity3D)
            local currentScreen, _ = Camera:WorldToViewportPoint(humanoidRootPart.Position)
            targetVelocity = Vector2.new(velocityScreen.X - currentScreen.X, velocityScreen.Y - currentScreen.Y)
        end
    end
    
    -- 🎯 PRÉDICTION ULTRA AVANCÉE AVEC VÉLOCITÉ
    local velocityPrediction = targetVelocity * (CONFIG.PREDICTION * 2)
    local finalTargetPos = targetScreenPos + velocityPrediction
    local finalDelta = finalTargetPos - screenCenter
    
    -- 💫 ALGORITHME DE FLUIDE QUANTIQUE
    local strength = baseStrength * distanceMultiplier
    local smoothness = baseSmoothness * smoothnessMultiplier
    
    -- 🔥 SYSTÈME D'ACCÉLÉRATION DYNAMIQUE
    local moveVector = finalDelta * strength * accelerationFactor / smoothness
    
    -- 🎪 LIMITATION ADAPTATIVE INTELLIGENTE
    local maxMove = math.min(distance * 0.15, 12) * accelerationFactor
    local adaptiveLimit = math.max(maxMove * 0.8, 2)
    
    moveVector = Vector2.new(
        math.clamp(moveVector.X, -adaptiveLimit, adaptiveLimit),
        math.clamp(moveVector.Y, -adaptiveLimit, adaptiveLimit)
    )
    
    -- 🎭 SYSTÈME ANTI-DÉTECTION HUMAIN
    -- Ajouter de la variation random ultra subtile
    local humanVariation = 0.1
    local randomX = (math.random() - 0.5) * humanVariation
    local randomY = (math.random() - 0.5) * humanVariation
    
    moveVector = Vector2.new(
        moveVector.X + randomX,
        moveVector.Y + randomY
    )
    
    -- 🚀 APPLICATION MULTI-MÉTHODE ULTRA OPTIMISÉE
    local success = false
    local methods = {
        -- MÉTHODE 1: mousemoverel (LE PLUS EFFICACE)
        function()
            mousemoverel(moveVector.X, moveVector.Y)
            return true
        end,
        
        -- MÉTHODE 2: Camera CFrame manipulation (DIEU MODE)
        function()
            if Camera and Camera.CFrame then
                local currentCF = Camera.CFrame
                local targetWorldPos = Camera:ViewportPointToRay(finalTargetPos.X, finalTargetPos.Y, 0).Origin
                local direction = (targetWorldPos - currentCF.Position).Unit
                local newCF = CFrame.lookAt(currentCF.Position, currentCF.Position + direction)
                
                -- Lerp ultra smooth
                Camera.CFrame = currentCF:Lerp(newCF, strength * 0.1)
                return true
            end
            return false
        end,
        
        -- MÉTHODE 3: Mouse manipulation directe
        function()
            local mouse = LocalPlayer:GetMouse()
            if mouse and mouse.X and mouse.Y then
                mouse.X = math.clamp(mouse.X + moveVector.X, 0, Camera.ViewportSize.X)
                mouse.Y = math.clamp(mouse.Y + moveVector.Y, 0, Camera.ViewportSize.Y)
                return true
            end
            return false
        end,
        
        -- MÉTHODE 4: UserInputService simulation (BACKUP DE FOLIE)
        function()
            if UserInputService and UserInputService.GetMouseLocation then
                local currentMousePos = UserInputService:GetMouseLocation()
                local newPos = currentMousePos + moveVector
                -- Cette méthode est plus complexe et nécessite des privilèges spéciaux
                return false -- Désactivée pour éviter les erreurs
            end
            return false
        end
    }
    
    -- Essayer toutes les méthodes jusqu'à ce qu'une marche
    for i, method in ipairs(methods) do
        if not success then
            success = pcall(method)
            if success then
                -- print("🎯 Méthode", i, "utilisée avec succès!")
                break
            end
        end
    end
    
    -- 📊 STATISTIQUES ULTRA PRO (optionnel)
    if success then
        State.frameCount = (State.frameCount or 0) + 1
        if State.frameCount % 60 == 0 then -- Tous les 60 frames
            local accuracy = math.max(0, 100 - distance)
            -- print(string.format("🎯 Précision: %.1f%% | Distance: %.1f | Force: %.2f", accuracy, distance, strength))
        end
    end
end

-- 🔫 Hook des événements de tir amélioré
local function hookRemoteEvent(remoteEvent)
    if State.hookedEvents[remoteEvent] or not remoteEvent or not remoteEvent.FireServer then 
        return 
    end
    
    State.hookedEvents[remoteEvent] = true
    
    local originalFireServer = remoteEvent.FireServer
    
    remoteEvent.FireServer = function(self, ...)
        if State.isDestroyed then
            return originalFireServer(self, ...)
        end
        
        local args = {...}
        
        if CONFIG.SILENT_AIM_ENABLED and State.isAiming and State.currentTarget then
            local predictedPos = getPredictedPosition(State.currentTarget)
            
            -- Méthodes de remplacement améliorées
            local function replacePositionArgs(argList)
                for i, arg in ipairs(argList) do
                    if typeof(arg) == "Vector3" then
                        argList[i] = predictedPos
                        return true
                    elseif typeof(arg) == "CFrame" then
                        argList[i] = CFrame.lookAt(predictedPos, predictedPos + Vector3.new(0, 1, 0))
                        return true
                    elseif typeof(arg) == "table" and arg.Position then
                        arg.Position = predictedPos
                        return true
                    elseif typeof(arg) == "table" and arg.Hit then
                        arg.Hit = predictedPos
                        return true
                    end
                end
                return false
            end
            
            if not replacePositionArgs(args) and #args == 0 then
                -- Si aucun argument, ajouter la position
                table.insert(args, predictedPos)
            end
        end
        
        return originalFireServer(self, unpack(args))
    end
end

-- Hook RemoteFunction amélioré
local function hookRemoteFunction(remoteFunction)
    if State.hookedEvents[remoteFunction] or not remoteFunction or not remoteFunction.InvokeServer then 
        return 
    end
    
    State.hookedEvents[remoteFunction] = true
    
    local originalInvokeServer = remoteFunction.InvokeServer
    
    remoteFunction.InvokeServer = function(self, ...)
        if State.isDestroyed then
            return originalInvokeServer(self, ...)
        end
        
        local args = {...}
        
        if CONFIG.SILENT_AIM_ENABLED and State.isAiming and State.currentTarget then
            local predictedPos = getPredictedPosition(State.currentTarget)
            
            -- Même logique que pour RemoteEvent
            for i, arg in ipairs(args) do
                if typeof(arg) == "Vector3" then
                    args[i] = predictedPos
                    break
                elseif typeof(arg) == "CFrame" then
                    args[i] = CFrame.lookAt(predictedPos, predictedPos + Vector3.new(0, 1, 0))
                    break
                end
            end
            
            if #args == 0 then
                table.insert(args, predictedPos)
            end
        end
        
        return originalInvokeServer(self, unpack(args))
    end
end

-- 🛠️ Hook des outils amélioré
local function hookTool(tool)
    if not tool or not tool:IsA("Tool") or State.isDestroyed then return end
    
    local function hookDescendants()
        for _, descendant in pairs(tool:GetDescendants()) do
            if descendant:IsA("RemoteEvent") then
                hookRemoteEvent(descendant)
            elseif descendant:IsA("RemoteFunction") then
                hookRemoteFunction(descendant)
            end
        end
    end
    
    -- Hook immédiat
    pcall(hookDescendants)
    
    -- Hook des futurs descendants
    local connection = tool.DescendantAdded:Connect(function(descendant)
        if State.isDestroyed then return end
        wait(0.1) -- Petit délai pour s'assurer que l'objet est prêt
        
        if descendant:IsA("RemoteEvent") then
            hookRemoteEvent(descendant)
        elseif descendant:IsA("RemoteFunction") then
            hookRemoteFunction(descendant)
        end
    end)
    
    table.insert(State.connections, connection)
end

-- Hook tous les outils amélioré
local function hookAllTools()
    if State.isDestroyed then return end
    
    -- Outils dans le Backpack
    if LocalPlayer.Backpack then
        for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
            hookTool(tool)
        end
        
        -- Nouveaux outils dans le backpack
        local connection = LocalPlayer.Backpack.ChildAdded:Connect(function(child)
            if State.isDestroyed then return end
            if child:IsA("Tool") then
                hookTool(child)
            end
        end)
        table.insert(State.connections, connection)
    end
    
    -- Outils équipés
    if LocalPlayer.Character then
        for _, tool in pairs(LocalPlayer.Character:GetChildren()) do
            hookTool(tool)
        end
        
        -- Nouveaux outils équipés
        local connection = LocalPlayer.Character.ChildAdded:Connect(function(child)
            if State.isDestroyed then return end
            if child:IsA("Tool") then
                hookTool(child)
            end
        end)
        table.insert(State.connections, connection)
    end
    
    -- Hook global des RemoteEvents
    pcall(function()
        if ReplicatedStorage then
            for _, descendant in pairs(ReplicatedStorage:GetDescendants()) do
                if descendant:IsA("RemoteEvent") then
                    hookRemoteEvent(descendant)
                elseif descendant:IsA("RemoteFunction") then
                    hookRemoteFunction(descendant)
                end
            end
        end
    end)
end

-- 🎨 Mise à jour des visuels améliorée
local function updateVisuals()
    if State.isDestroyed or not CONFIG.VISUALS_ENABLED then return end
    
    local screenCenter = getScreenCenter()
    
    if State.isAiming then
        -- Cercle FOV
        if State.drawings.fovCircle then
            State.drawings.fovCircle.Position = screenCenter
            State.drawings.fovCircle.Visible = true
        end
        
        -- Point central
        if State.drawings.centerDot then
            State.drawings.centerDot.Position = screenCenter
            State.drawings.centerDot.Visible = true
        end
        
        -- Traceur et indicateur de cible
        if State.currentTarget then
            local predictedPos = getPredictedPosition(State.currentTarget)
            local screenPoint, onScreen = Camera:WorldToViewportPoint(predictedPos)
            
            if onScreen and screenPoint.Z > 0 then
                local targetScreenPos = Vector2.new(screenPoint.X, screenPoint.Y)
                
                -- Traceur
                if State.drawings.tracer then
                    State.drawings.tracer.From = screenCenter
                    State.drawings.tracer.To = targetScreenPos
                    State.drawings.tracer.Visible = true
                end
                
                -- Indicateur de cible animé
                if State.drawings.targetIndicator then
                    State.drawings.targetIndicator.Position = targetScreenPos
                    State.drawings.targetIndicator.Visible = true
                    -- Animation de pulsation
                    State.drawings.targetIndicator.Radius = 12 + math.sin(tick() * 8) * 3
                end
            else
                -- Cacher les éléments de cible
                if State.drawings.tracer then State.drawings.tracer.Visible = false end
                if State.drawings.targetIndicator then State.drawings.targetIndicator.Visible = false end
            end
        else
            -- Pas de cible
            if State.drawings.tracer then State.drawings.tracer.Visible = false end
            if State.drawings.targetIndicator then State.drawings.targetIndicator.Visible = false end
        end
    else
        -- Cacher tout quand on ne vise pas
        for _, drawing in pairs(State.drawings) do
            if drawing and drawing.Visible ~= nil then
                drawing.Visible = false
            end
        end
    end
end

-- Hook lors du respawn amélioré
local connection = LocalPlayer.CharacterAdded:Connect(function()
    if State.isDestroyed then return end
    
    -- Attendre que le personnage soit complètement chargé
    spawn(function()
        wait(2)
        if not State.isDestroyed then
            hookAllTools()
        end
    end)
end)
table.insert(State.connections, connection)

-- 🔄 Boucle principale optimisée
local renderConnection = RunService.RenderStepped:Connect(function()
    if State.isDestroyed then return end
    
    State.frameCount = State.frameCount + 1
    
    -- Mettre à jour la cible moins fréquemment pour les performances
    if State.frameCount % 3 == 0 then -- Tous les 3 frames
        if State.isAiming then
            State.currentTarget, State.targetPlayer, State.targetPart = getBestTarget()
        else
            State.currentTarget = nil
            State.targetPlayer = nil
            State.targetPart = nil
        end
    end
    
    -- Aim assist à chaque frame
    if State.isAiming then
        performAimAssist()
    end
    
    -- Visuels moins fréquemment
    if State.frameCount % 2 == 0 then
        updateVisuals()
    end
end)
table.insert(State.connections, renderConnection)

-- 🎮 Contrôles améliorés
local inputBeganConnection = UserInputService.InputBegan:Connect(function(input, processed)
    if processed or State.isDestroyed then return end
    
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        State.isAiming = true
    elseif input.KeyCode == Enum.KeyCode.F1 then
        CONFIG.AIM_ASSIST_ENABLED = not CONFIG.AIM_ASSIST_ENABLED
        print("🎯 Aim Assist:", CONFIG.AIM_ASSIST_ENABLED and "✅ ON" or "❌ OFF")
    elseif input.KeyCode == Enum.KeyCode.F2 then
        CONFIG.SILENT_AIM_ENABLED = not CONFIG.SILENT_AIM_ENABLED
        print("🔫 Silent Aim:", CONFIG.SILENT_AIM_ENABLED and "✅ ON" or "❌ OFF")
    elseif input.KeyCode == Enum.KeyCode.F3 then
        CONFIG.VISUALS_ENABLED = not CONFIG.VISUALS_ENABLED
        print("👁️ Visuals:", CONFIG.VISUALS_ENABLED and "✅ ON" or "❌ OFF")
        if not CONFIG.VISUALS_ENABLED then
            for _, drawing in pairs(State.drawings) do
                if drawing and drawing.Visible ~= nil then
                    drawing.Visible = false
                end
            end
        end
    elseif input.KeyCode == Enum.KeyCode.F4 then
        -- Toggle du rayon FOV
        CONFIG.RADIUS = CONFIG.RADIUS == 150 and 200 or 150
        if State.drawings.fovCircle then
            State.drawings.fovCircle.Radius = CONFIG.RADIUS
        end
        print("📏 FOV Radius:", CONFIG.RADIUS)
    elseif input.KeyCode == Enum.KeyCode.F5 then
        -- Nettoyage et redémarrage
        print("🔄 Redémarrage du script...")
        cleanup()
        wait(1)
        -- Le script va se relancer
    end
end)
table.insert(State.connections, inputBeganConnection)

local inputEndedConnection = UserInputService.InputEnded:Connect(function(input, processed)
    if processed or State.isDestroyed then return end
    
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        State.isAiming = false
    end
end)
table.insert(State.connections, inputEndedConnection)

-- Nettoyage automatique à la fermeture
game:BindToClose(cleanup)

-- 🚀 Initialisation finale
createDrawings()
hookAllTools()

print("🎯 Script d'assistance activé avec succès!")
print("🎮 Contrôles:")
print("   🖱️  Clic droit: Viser")
print("   ⌨️  F1: Toggle Aim Assist")
print("   ⌨️  F2: Toggle Silent Aim") 
print("   ⌨️  F3: Toggle Visuals")
print("   ⌨️  F4: Changer FOV Radius")
print("   ⌨️  F5: Redémarrer script")
print("✨ Améliorations: Prédiction dynamique, multi-cibles, optimisé!")
