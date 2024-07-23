#!/usr/bin/lua

local function pick_color()
    local colors = {
        "String",
        "Keyword",
        "Number",
        "NeovimDashboardLogo1",
        "NeovimDashboardLogo2",
        "NeovimDashboardLogo3",
        "NeovimDashboardLogo4",
        "NeovimDashboardLogo5",
        "NeovimDashboardLogo6",
        "NeovimDashboardLogo7",
        "Type",
        "Function",
        "DevIconVim"
    }

    -- Seed the random number generator
    math.randomseed(os.time() + math.random() * 1000)

    return colors[math.random(#colors)]
end

local chosen_color = pick_color()
print("Picked color group: " .. pick_color())
print("Picked color group: " .. pick_color())
print("Picked color group: " .. pick_color())
print(math.random() * 100)