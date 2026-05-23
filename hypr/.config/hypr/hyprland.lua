require("modules.keybindings")

local function start_shell()
	hl.exec_cmd("qs -c noctalia-shell") -- to be removed when noctalia v5 releases
	-- hl.exec_cmd("noctalia") -- to be uncommented when noctalia v5 releases
end

hl.on("hyprland.start", start_shell)
