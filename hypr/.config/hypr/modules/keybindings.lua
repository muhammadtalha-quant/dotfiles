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
        ESCAPE = "ESCAPE"
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


-- 1. Apps

local apps = {
    [chord(KEYS.MODIFIER.SUPER, KEYS.SPECIAL.ENTER)] = {name = "ghostty",               description = "Open Ghostty Terminal"},
    [chord(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.B)] =    {name = "google-chrome-stable",  description = "Open Google Chrome Browser"},
    [chord(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.C)] =    {name = "code",                  description = "Open VSCode"},
    [chord(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.E)] =    {name = "dolphin",               description = "Open Dolphin File Manager"},
    [chord(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.L)] =    {name = "localsend",             description = "Open Localsend"},
    [chord(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.G)] =    {name = "gimp",                  description = "Open GIMP"},
}


for keybind,app in pairs(apps) do 
     hl.bind(
        keybind,
        hl.dsp.exec_cmd(app.name),
        {
            description = app.description,
        }
     )
end

-- 2. IPC Calls

local ipc = "qs -c noctalia-shell "

local calls = {
    [chord(KEYS.MODIFIER.SUPER, KEYS.SPECIAL.SPACE)] =                       {name = "ipc call launcher toggle",                                description = "Toggle Launcher"},
    [chord(KEYS.MODIFIER.SUPER, KEYS.MODIFIER.ALT, KEYS.SPECIAL.SPACE)] =    {name = "ipc call controlCenter toggle",                           description = "Toogle Sidebar"},                 
    [chord(KEYS.MODIFIER.SUPER, KEYS.PUNCTUATION.PERIOD)] =                  {name = "ipc call settings toggle",                                description = "Toggle Settings"},             
    [chord(KEYS.MODIFIER.ALT, KEYS.ALPHABET.V)] =                            {name = "ipc call launcher clipboard",                             description = "Toggle Clipboard History"},             
    [chord(KEYS.MODIFIER.ALT, KEYS.ALPHABET.N)] =                            {name = "ipc call notifications toggleHistory",                    description = "Toggle Notifications"},                         
    [chord(KEYS.MODIFIER.ALT, KEYS.ALPHABET.B)] =                            {name = "ipc call bar toggle",                                     description = "Toggle Bar"},     
    [chord(KEYS.MODIFIER.SUPER, KEYS.MODIFIER.SHIFT, KEYS.ALPHABET.T)] =     {name = "ipc call darkMode toggle",                                description = "Cycle Dark/Light Theme"},             
    [chord(KEYS.MODIFIER.SUPER, KEYS.PUNCTUATION.COMMA)] =                   {name = "ipc call launcher emoji",                                 description = "Toggle Emoji Selector"},         
    [chord(KEYS.MODIFIER.ALT, KEYS.ALPHABET.C)] =                            {name = "ipc call calendar toggle",                                description = "Toggle Calendar"},             
    [KEYS.XF86.AUDIORAISEVOLUME] =                                           {name = "ipc call volume increase",                                description = "Increase Volume"},
    [KEYS.XF86.AUDIOLOWERVOLUME] =                                           {name = "ipc call volume decrease",                                description = "Decrease Volume"},
    [KEYS.XF86.AUDIOMUTE] =                                                  {name = "ipc call volume muteOutput",                              description = "Toggle Mute"},
    [chord(KEYS.MODIFIER.ALT, KEYS.SPECIAL.ESCAPE)] =                        {name = "ipc call systemMonitor toggle",                           description = "Toggle Resource Monitor"},
    [chord(KEYS.MODIFIER.CTRL, KEYS.MODIFIER.ALT, KEYS.NAVIGATION.DELETE)] = {name = "ipc call sessionMenu toggle",                             description = "Toggle Session Menu"},
    [chord(KEYS.MODIFIER.SUPER, KEYS.MODIFIER.ALT, KEYS.ALPHABET.L)] =       {name = "ipc call lockScreen lock",                                description = "Lock Session"},
    [chord(KEYS.MODIFIER.SUPER, KEYS.MODIFIER.SHIFT, KEYS.ALPHABET.W)] =     {name = "ipc call wallpaper random",                               description = "Change Wallpaper"},
    [chord(KEYS.MODIFIER.SUPER, KEYS.FUNCTION.F1)] =                         {name = "ipc call plugin:keybind-cheatsheet toggle",               description = "Toggle Keybinds"},                           
}


for keybind,call in pairs(calls) do 
    hl.bind(
        keybind,
        hl.dsp.exec_cmd(ipc .. call.name),
        {
            description = call.description
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