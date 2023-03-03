# funny anticheat with discord webhook
i got no fucking idea if it works or not

```lua
local webhook = "https://discord.com/api/webhooks/WEBHOOK_ID/WEBHOOK_TOKEN" -- your webhook token thingy majiggy

function detectCheating(player)
  -- if cheating detected kick the player and send message to discord
  game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, player)
  player:Kick("Skill issue")
  sendToDiscord(player.Name .. " got kicked lmao")
end

function sendToDiscord(message)
  local data = {
      ["content"] = message
  }
  local headers = {
      ["Content-Type"] = "application/json"
  }
  local httpRequest = httpService:RequestAsync({
      Url = webhook,
      Method = "POST",
      Headers = headers,
      Body = game:GetService("HttpService"):JSONEncode(data)
  })
end

game.Players.PlayerAdded:Connect(function(player)
  player.CharacterAdded:Connect(function(character)
      detectCheating(player)
  end)
end)
```

