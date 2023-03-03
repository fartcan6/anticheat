function onCharacterAdded(character)
    -- Check if player is in the air
    if character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
        -- Display message in chat
        local message = "caught ya lackin. you have been kicked for flying xd."

        local player = game.Players:GetPlayerFromCharacter(character)
        if player then
            player:Kick(message)
            print(message)
        end
    end
end

game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(onCharacterAdded)
end)

