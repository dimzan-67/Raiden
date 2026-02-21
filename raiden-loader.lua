local old
old = hookfunction(loadstring, function(src, ...)
    if typeof(src) == "string" then
        writefile("FULL_DUMP.lua", src)
        print("[FULL_DUMP.lua written]")
    end
    return old(src, ...)
end)

print("[loadstring hook active]")


-- your script
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
