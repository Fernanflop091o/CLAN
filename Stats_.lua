local function cloneNumbersToMenu()
    local function formatNumber(number)
        local suffixes = {"", "K", "M", "B", "T", "QD"}
        local suffix_index = 1

        while math.abs(number) >= 1000 and suffix_index < #suffixes do
            number = number / 1000.0
            suffix_index = suffix_index + 1
        end

        return string.format("%.2f%s", number, suffixes[suffix_index])
    end

    local function updateNumbers()
        local rebirthFrame = game.Players.LocalPlayer.PlayerGui.Main.MainFrame.Frames.Rebirth
        local statsFrame = game.Players.LocalPlayer.PlayerGui.Main.MainFrame.Frames.Stats
        local strengthLabel = statsFrame:FindFirstChild("Strength")

        local strengthValue
        if strengthLabel and strengthLabel:IsA("TextLabel") then
            local strengthText = strengthLabel.Text:match("%d+")
            strengthValue = tonumber(strengthText)
        end

        local menuGui = game.CoreGui.MenuGui

        for _, child in ipairs(menuGui.Background:GetChildren()) do
            child:Destroy()
        end

        local yOffset = -50
        local xOffset = 50

        for _, child in ipairs(rebirthFrame:GetChildren()) do
            if child:IsA("TextLabel") then
                local text = child.Text:match("%d+")
                if text then
                    local number = tonumber(text)
                    if number and strengthValue then
                        local formattedNumber = formatNumber(number)
                        local formattedStrength = formatNumber(strengthValue)
                        local combinedText = formattedNumber .. "/" .. formattedStrength
                        local clonedLabel = Instance.new("TextLabel", menuGui.Background)
                        clonedLabel.Name = "Cloned" .. child.Name
                        clonedLabel.Text = combinedText
                        clonedLabel.Font = child.Font
                        clonedLabel.TextSize = 30
                        clonedLabel.TextColor3 = child.TextColor3
                        clonedLabel.BackgroundTransparency = 1
                        clonedLabel.Position = UDim2.new(0, xOffset, 0, yOffset)
                        clonedLabel.Size = UDim2.new(0, 200, 0, 30)
                        yOffset = yOffset + 40
                    end
                end
            end
        end
    end

    local menuGui = Instance.new("ScreenGui")
    menuGui.Name = "MenuGui"

    local backgroundFrame = Instance.new("Frame")
    backgroundFrame.Name = "Background"
    backgroundFrame.Size = UDim2.new(0, 220, 0, 0)
    backgroundFrame.Position = UDim2.new(0, 30, 0, 20)
    backgroundFrame.BackgroundTransparency = 0.5
    backgroundFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    backgroundFrame.BorderSizePixel = 0
    backgroundFrame.Parent = menuGui

    menuGui.Parent = game.CoreGui

    while true do
        updateNumbers()
        wait(0.1)
    end
end

cloneNumbersToMenu()
