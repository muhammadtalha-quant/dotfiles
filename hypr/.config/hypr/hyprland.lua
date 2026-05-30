require("modules.keybindings")
require("modules.monitors")
require("modules.looknfeel")
require("modules.envvars")

local function start_shell()
	hl.exec_cmd("noctalia")
end

hl.on("hyprland.start", start_shell)

-- For Noctalia Color templates
require("noctalia")
