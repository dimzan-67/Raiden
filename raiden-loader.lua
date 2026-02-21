-- Hook loadstring (MOST IMPORTANT)
local oldLoadstring
oldLoadstring = hookfunction(loadstring, function(source, ...)
    writefile("dumped_script.lua", source)
    print("[DUMPED via loadstring]")
    return oldLoadstring(source, ...)
end)

-- Hook HttpGet (backup method)
local oldHttpGet
oldHttpGet = hookfunction(game.HttpGet, function(self, url, ...)
    local result = oldHttpGet(self, url, ...)

    if typeof(url) == "string" and string.find(url, "pandadevelopment.net") then
        writefile("dumped_httpget.lua", result)
        print("[DUMPED via HttpGet]", url)
    end

    return result
end)

print("[Hooks installed]")

getgenv().Configuration = {
    Username    = "JvkeflaRL",
    Rank        = "Archnemesis",
    Keys        = 14531,
    Level       = 1149,
    WinStreak   = 24023,
    Premium     = true,
    Verified    = true,
    Platform    = "MouseKeyboard",
    Headless    = false,
    Status      = "Contraband",
    DisplayName = "RLSub2Jvekfla",
    Discord     = "https://dsc.gg/luafanclub"
}

loadstring(game:HttpGet("https://vss.pandadevelopment.net/virtual/file/ccab872993744fde"))()
