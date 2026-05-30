-------------------------------------------------------------
---                        KEYS                           ---
-------------------------------------------------------------

local function chord(...)
    return table.concat({...}, "+")
end 

local  KEYS = {
    MODIFIER = {
        SUPER = "SUPER",
        CTRL = "CONTROL",
        ALT = "ALT",
        SHIFT = "SHIFT"
    },
    ALPHABET = {
        A = "A",
        B = "B",
        C = "C",
        D = "D",
        E = "E",
        F = "F",
        G = "G",
        H = "H",
        I = "I",
        J = "J",
        K = "K",
        L = "L",
        M = "M",
        N = "N",
        O = "O",
        P = "P",
        Q = "Q",
        R = "R",
        S = "S",
        T = "T",
        U = "U",
        V = "V",
        W = "W",
        X = "X",
        Y = "Y",
        Z = "Z"
    },
    ARROW = {
        LEFT = "LEFT",
        RIGHT = "RIGHT",
        UP = "UP",
        DOWN = "DOWN",
    },
    PUNCTUATION = {
        COMMA = "COMMA",
        PERIOD = "PERIOD",
        SEMICOLON = "SEMICOLON",
        APOSTROPHE = "APOSTROPHE",
    },
    SYMBOL = {
        EQUAL = "EQUAL",
        MINUS = "MINUS",
        BRACKETRIGHT = "BRACKETRIGHT",
        BRACKETLEFT = "BRACKETLEFT",
        SLASH = "SLASH",
        BACKSLASH = "BACKSLASH",
        BACKTICK = "GRAVE"
    },
    SPECIAL = {
        BACKSPACE  = "BACKSPACE",
        ENTER = "RETURN",
        SPACE = "SPACE",
        TAB = "TAB",
        ESCAPE = "ESCAPE",
        PRINT = "PRINT"
    },
    LOCKS = {
        CAPSLOCK = "Caps_Lock",
        NUMLOCK = "Num_Lock",
        SCROLLLOCK = "Scroll_Lock"
    },
    NAVIGATION = {
        INSERT = "INSERT",
        DELETE = "DELETE",
        HOME = "HOME",
        END = "END",
        PGUP = "PRIOR",
        PGDN = "NEXT",
    },
    FUNCTION = {
        F1 = "F1",
        F2 = "F2",
        F3 = "F3",
        F4 = "F4",
        F5 = "F5",
        F6 = "F6",
        F7 = "F7",
        F8 = "F8",
        F9 = "F9",
        F10 = "F10",
        F11 = "F11",
        F12 = "F12",
    },
    XF86 = {
        -- Update according to your keyboard; use wev to find sym
        HOMEPAGE = "XF86HomePage",                               -- Fn + F1   
        MAIL = "XF86Mail",                                       -- Fn + F2     
        SEARCH = "XF86Search",                                   -- Fn + F3 
        TOOLS = "XF86Tools",                                     -- Fn + F4   
        AUDIOPLAY = "XF86AudioPlay",                             -- Fn + F5   
        AUDIOPREV = "XF86AudioPrev",                             -- Fn + F6       
        AUDIONEXT = "XF86AudioNext",                             -- Fn + F7       
        AUDIOLOWERVOLUME = "XF86AudioLowerVolume",               -- Fn + F8               
        AUDIORAISEVOLUME = "XF86AudioRaiseVolume",               -- Fn + F9               
        AUDIOMUTE = "XF86AudioMute",                             -- Fn + F10           
        EXPLORER = "XF86Explorer",                               -- Fn + F11           
        CALCULATOR = "XF86Calculator"                            -- Fn + F12           
    },
    MOUSE = {
        LMB = "mouse:272",
        RMB = "mouse:273",
        MMB = "mouse:274"
    }, 
}

-- 0. Hyprland Specific Binds

hl.bind(
    chord(KEYS.MODIFIER.SUPER, KEYS.MODIFIER.ALT, KEYS.ALPHABET.R),
    hl.dsp.exec_cmd("hyprctl reload && noctalia msg config-reload")
)

-- 1. Apps

local apps = {
    [chord(KEYS.MODIFIER.SUPER, KEYS.SPECIAL.ENTER)] = {cmd = "kitty",                 desc = "Open Kitty Terminal"},
    [chord(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.B)] =    {cmd = "google-chrome-stable",  desc = "Open Google Chrome Browser"},
    [chord(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.C)] =    {cmd = "code",                  desc = "Open VSCode"},
    [chord(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.E)] =    {cmd = "kitty -e yazi",         desc = "Open Yazi File Manager"},
    [chord(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.L)] =    {cmd = "kdeconnect-app",            desc = "Open KDEConnect"},
    [chord(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.G)] =    {cmd = "gimp",                  desc = "Open GIMP"},
    [chord(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.M)] =    {cmd = "kitty -e cava",         desc = "Open cava music simulator"}
}


for keybind,app in pairs(apps) do 
     hl.bind(
        keybind,
        hl.dsp.exec_cmd(app.cmd),
        {
            description = app.desc,
        }
     )
end

-- 2. Utilities

local ipc = {
    [chord(KEYS.MODIFIER.SUPER, KEYS.SPECIAL.SPACE)] =                       {cmd = "noctalia msg panel-toggle launcher",                                desc = "Toggle Launcher"},
    [chord(KEYS.MODIFIER.SUPER, KEYS.MODIFIER.ALT, KEYS.SPECIAL.SPACE)] =    {cmd = "noctalia msg panel-toggle control-center",                          desc = "Toogle Sidebar"},                 
    [chord(KEYS.MODIFIER.SUPER, KEYS.PUNCTUATION.PERIOD)] =                  {cmd = "noctalia msg settings-toggle",                                      desc = "Toggle Settings"},             
    [chord(KEYS.MODIFIER.ALT, KEYS.ALPHABET.V)] =                            {cmd = "noctalia msg panel-toggle clipboard",                               desc = "Toggle Clipboard History"},             
    [chord(KEYS.MODIFIER.ALT, KEYS.ALPHABET.N)] =                            {cmd = "noctalia msg panel-toggle control-center notifications",            desc = "Toggle Notifications"},                         
    [chord(KEYS.MODIFIER.ALT, KEYS.ALPHABET.B)] =                            {cmd = "noctalia msg bar-toggle",                                           desc = "Toggle Bar"},     
    [chord(KEYS.MODIFIER.SUPER, KEYS.MODIFIER.SHIFT, KEYS.ALPHABET.T)] =     {cmd = "noctalia msg theme-mode-toggle",                                    desc = "Cycle Dark/Light Theme"},             
    [chord(KEYS.MODIFIER.SUPER, KEYS.PUNCTUATION.COMMA)] =                   {cmd = "noctalia msg panel-toggle launcher /emo",                           desc = "Toggle Emoji Selector"},         
    [chord(KEYS.MODIFIER.ALT, KEYS.ALPHABET.C)] =                            {cmd = "noctalia msg panel-toggle control-center calendar",                 desc = "Toggle Calendar"},             
    [KEYS.XF86.AUDIORAISEVOLUME] =                                           {cmd = "noctalia msg volume-up",                                            desc = "Increase Volume"},
    [KEYS.XF86.AUDIOLOWERVOLUME] =                                           {cmd = "noctalia msg volume-up",                                            desc = "Decrease Volume"},
    [KEYS.XF86.AUDIOMUTE] =                                                  {cmd = "noctalia msg volume-mute",                                          desc = "Toggle Mute"},
    [chord(KEYS.MODIFIER.ALT, KEYS.SPECIAL.ESCAPE)] =                        {cmd = "noctalia msg panel-toggle control-center system",                   desc = "Toggle Resource Monitor"},
    [chord(KEYS.MODIFIER.CTRL, KEYS.MODIFIER.ALT, KEYS.NAVIGATION.DELETE)] = {cmd = "noctalia msg panel-toggle session",                                 desc = "Toggle Session Menu"},
    [chord(KEYS.MODIFIER.SUPER, KEYS.MODIFIER.ALT, KEYS.ALPHABET.L)] =       {cmd = "noctalia msg screen-lock",                                          desc = "Lock Session"},
    [chord(KEYS.MODIFIER.ALT, KEYS.ALPHABET.W)] =                            {cmd = "noctalia msg wallpaper-random",                                     desc = "Random Wallpaper"}, 
}

local utils = {
    [chord(KEYS.MODIFIER.SUPER, KEYS.MODIFIER.SHIFT, KEYS.ALPHABET.S)] =     {cmd = "hyprcap shot region -z -c -n",                 desc = "Capture Region"},
    [chord(KEYS.MODIFIER.SUPER, KEYS.MODIFIER.ALT, KEYS.ALPHABET.S)] =       {cmd = "hyprcap shot window:active -z -c -n",          desc = "Capture Focused Window"},
    [chord(KEYS.MODIFIER.SUPER, KEYS.MODIFIER.CTRL, KEYS.ALPHABET.S)] =      {cmd = "hyprcap shot monitor:active -z -c -n",         desc = "Capture Full Screen"},
    [chord(KEYS.MODIFIER.SUPER, KEYS.MODIFIER.SHIFT, KEYS.ALPHABET.R)] =     {cmd = "hyprcap rec region -c -n",                     desc = "Record Region"},
    [chord(KEYS.MODIFIER.SUPER, KEYS.MODIFIER.ALT, KEYS.ALPHABET.R)] =       {cmd = "hyprcap rec window:active -c -n",              desc = "Record Focused Window"},
    [chord(KEYS.MODIFIER.SUPER, KEYS.MODIFIER.CTRL, KEYS.ALPHABET.R)] =      {cmd = "hyprcap rec monitor:active -c -n",             desc = "Record Full Screen"},
    [KEYS.LOCKS.SCROLLLOCK] =                                                {cmd = "hyprpicker -a -f hex",                         desc = "Pick Color"},
}

for keybind,call in pairs(ipc) do 
    hl.bind(
        keybind,
        hl.dsp.exec_cmd(call.cmd),
        {
            description = call.desc
        }
    )
end

for keybind,util in pairs(utils) do
    hl.bind(
        keybind,
        hl.dsp.exec_cmd(util.cmd),
        {
            description = util.desc
        }
    )
end


-- 3. Windows 

hl.bind(
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.ALPHABET.Q
    ),
    hl.dsp.window.close(),
    {
        description = "Gracefully Close Window"
    }
)

hl.bind(
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.MODIFIER.SHIFT,
        KEYS.ALPHABET.Q
    ),
    hl.dsp.window.kill(),
    {
        description = "Forcefully Close Window"
    }
)

hl.bind(
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.ALPHABET.F
    ),
    hl.dsp.window.float(),
    {
        description = "Toggle Float/Tile"
    }
)

hl.bind(
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.ARROW.LEFT
    ),
    hl.dsp.focus({
        direction = "left"
    }),
    {
        description = "Focus Window Left"
    }
)

hl.bind(
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.ARROW.RIGHT
    ),
    hl.dsp.focus({
        direction = "right"
    }),
    {
        description = "Focus Window Right"
    }
)
hl.bind(
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.ARROW.UP
    ),
    hl.dsp.focus({
        direction = "up"
    }),
    {
        description = "Focus Window Up"
    }
)

hl.bind(
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.ARROW.DOWN
    ),
    hl.dsp.focus({
        direction = "down"
    }),
    {
        description = "Focus Window Down"
    }
)

hl.bind(
    KEYS.FUNCTION.F11,
    hl.dsp.window.fullscreen(),
    {
        description = "Toggle Fullscreen"
    }
)

hl.bind(
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.MOUSE.LMB
    ),
    hl.dsp.window.drag(),
    {
        description = "Drag Window"
    }
)

hl.bind(
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.MOUSE.RMB
    ),
    hl.dsp.window.resize(),
    {
        description = "Resize Window"
    }
)

hl.bind(
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.MODIFIER.SHIFT,
        KEYS.ARROW.LEFT
    ),
    hl.dsp.window.swap({
        direction = "left"
    }),
    {
        description = "Swap Focused Window with Window to Left"
    }
)

hl.bind(
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.MODIFIER.SHIFT,
        KEYS.ARROW.RIGHT
    ),
    hl.dsp.window.swap({
        direction = "right"
    }),
    {
        description = "Swap Focused Window with Window to Right"
    }
)

hl.bind(
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.MODIFIER.SHIFT,
        KEYS.ARROW.UP
    ),
    hl.dsp.window.swap({
        direction = "up"
    }),
    {
        description = "Swap Focused Window with Window Above"
    }
)

hl.bind(
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.MODIFIER.SHIFT,
        KEYS.ARROW.DOWN
    ),
    hl.dsp.window.swap({
        direction = "down"
    }),
    {
        description = "Swap Focused Window with Window Below"
    }
)

-------------------------------------------------------------
---                WORKING WITH WORKSPACES                ---   
-------------------------------------------------------------
---

-- 4. Workspaces

local function SwitchToWorkspace(WorkspaceID) 
    hl.bind(
        chord(
            KEYS.MODIFIER.SUPER,
            tostring(WorkspaceID)
        ),
        hl.dsp.focus({
            workspace = tostring(WorkspaceID)
        }), 
        {
            description = "Switch To Workspace # " .. tostring(WorkspaceID)
        }
    )
end

local function MoveWindowToWorkspace(WorkspaceID)
     hl.bind(
            chord(
                KEYS.MODIFIER.SUPER,
                KEYS.MODIFIER.SHIFT,
                tostring(WorkspaceID)
            ),
        hl.dsp.window.move({
            workspace = tostring(WorkspaceID)
        }), 
        {
            description = "Move Window To Workspace # " .. tostring(WorkspaceID)
        }
    )
end

local function MoveWindowToWorkspaceSilently(WorkspaceID) 
    hl.bind(
        chord(
            KEYS.MODIFIER.SUPER,
            KEYS.MODIFIER.ALT,
            tostring(WorkspaceID)
        ),
        hl.dsp.window.move({
            workspace = tostring(WorkspaceID),
            follow = false,
        }), 
        {
            description = "Move Window (Silent) To Workspace # " .. tostring(WorkspaceID) 
        }
    )
end

for i = 1, 9 do
    SwitchToWorkspace(i)
end

for i = 1, 9 do
    MoveWindowToWorkspace(i)
end

for i = 1, 9 do
    MoveWindowToWorkspaceSilently(i)
end

hl.bind(
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.MODIFIER.ALT, 
        KEYS.ARROW.RIGHT
    ),
    hl.dsp.focus({
        workspace = "+1"
    }), 
    {
        description = "Switch to workspace right"
    }
)

hl.bind(
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.MODIFIER.ALT,
        KEYS.ARROW.LEFT
    ),
    hl.dsp.focus({
        workspace = "-1"
    }), 
    {
        description = "Switch to workspace left"
    }
)
