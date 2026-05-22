require("modules.keybindings")

local function start_shell()
	hl.exec_cmd("qs -c noctalia-shell")
end

hl.on("hyprland.start", start_shell)
