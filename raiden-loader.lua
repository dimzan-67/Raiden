local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Analytics = game:GetService("RbxAnalyticsService")
local TeleportService = game:GetService("TeleportService")

-- integrity checks
if not HttpService or not Players or not Analytics or not TeleportService then
    error("Environment integrity check failed")
end

local player = Players.LocalPlayer

local ALLOWED_GAME_ID = 6035872082
local TARGET_PLACE_ID = 6035872082

-- executor compatibility
local requestFunc =
    (syn and syn.request) or
    (http and http.request) or
    (http_request) or
    (request)

-- teleport queue compatibility
local queueFunc =
    (syn and syn.queue_on_teleport) or
    (queue_on_teleport) or
    (fluxus and fluxus.queue_on_teleport)

-- redirect if wrong game
if game.GameId ~= ALLOWED_GAME_ID then

    if not getgenv().RAIDEN_REDIRECTING then

        getgenv().RAIDEN_REDIRECTING = true

        -- queue loader to run after teleport
        if queueFunc then
            queueFunc([[
                wait(3)
                loadstring(game:HttpGet("https://raw.githubusercontent.com/dimzan-67/Raiden/main/raiden-loader.lua"))()
            ]])
        end

        TeleportService:Teleport(TARGET_PLACE_ID, player)
    end

    return
end

-- require key
local key = getgenv and getgenv().RAIDEN_KEY or nil

if not key or type(key) ~= "string" then
    error("Missing or invalid key")
end

-- get hwid
local hwid = Analytics:GetClientId()

if not requestFunc then
    error("Executor does not support HTTP requests")
end

-- endpoint
local endpoint = "https://raiden.dimzan.xyz/api/payload"

-- request payload
local response = requestFunc({
    Url = endpoint,
    Method = "POST",
    Headers = {
        ["Content-Type"] = "application/json"
    },
    Body = HttpService:JSONEncode({
        key = key,
        hwid = hwid
    })
})

if not response then
    error("No response from server")
end

if response.StatusCode ~= 200 then
    error("Authorization failed: ".. tostring(response.Body))
end

if not response.Body or response.Body == "" then
    error("Empty payload")
end

-- execute payload
local payloadFunc = loadstring(response.Body)

if not payloadFunc then
    error("Payload corrupted")
end

payloadFunc()
