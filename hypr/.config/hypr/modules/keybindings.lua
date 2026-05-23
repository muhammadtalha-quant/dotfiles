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
    -- NUMBER = {
    --     ONE = "1",
    --     TWO = "2",
    --     THREE = "3",
    --     FOUR = "4",
    --     FIVE = "5",
    --     SIX = "6",
    --     SEVEN = "7",
    --     EIGHT = "8",
    --     NINE = "9",
    --     ZERO = "0",
    -- },
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




-----------------------------------------------------------
---                       APPS                          ---
-----------------------------------------------------------


local apps = {
    [chord(KEYS.MODIFIER.SUPER, KEYS.SPECIAL.ENTER)] = "ghostty",
    [chord(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.B)] = "google-chrome-stable",
    [chord(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.C)] = "code",
    [chord(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.E)] = "dolphin",
    [chord(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.L)] = "localsend",
    [chord(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.G)] = "gimp"
}

for keybind,app in pairs(apps) do 
     hl.bind(
        keybind,
        hl.dsp.exec_cmd(app)
     )
end

-----------------------------------------------------------
---                 NOCTALIA IPC CALLS (v4)             ---
-----------------------------------------------------------
--- will change on noctalia v5 release 

local ipc = "qs -c noctalia-shell "

local calls = {
    [chord(KEYS.MODIFIER.SUPER, KEYS.SPECIAL.SPACE)] = "ipc call launcher toggle",
    [chord(KEYS.MODIFIER.SUPER, KEYS.MODIFIER.ALT, KEYS.SPECIAL.SPACE)] = "ipc call controlCenter toggle",
    [chord(KEYS.MODIFIER.SUPER, KEYS.PUNCTUATION.PERIOD)] = "ipc call settings toggle",
    [chord(KEYS.MODIFIER.ALT, KEYS.ALPHABET.V)] = "ipc call launcher clipboard",
    [chord(KEYS.MODIFIER.ALT, KEYS.ALPHABET.N)] = "ipc call notifications toggleHistory",
    [chord(KEYS.MODIFIER.CTRL, KEYS.MODIFIER.ALT, KEYS.ALPHABET.N)] = "ipc call notifications clear",
    [chord(KEYS.MODIFIER.SUPER, KEYS.MODIFIER.CTRL, KEYS.ALPHABET.N)] = "ipc call notifications toggleDND",
    [chord(KEYS.MODIFIER.ALT, KEYS.ALPHABET.B)] = "ipc call bar toggle",
    [chord(KEYS.MODIFIER.SUPER, KEYS.MODIFIER.SHIFT, KEYS.ALPHABET.T)] = "ipc call darkMode toggle",
    [chord(KEYS.MODIFIER.SUPER, KEYS.PUNCTUATION.COMMA)] = "ipc call launcher emoji",
    [chord(KEYS.MODIFIER.SUPER, KEYS.MODIFIER.CTRL, KEYS.ALPHABET.C)] = "ipc call calendar toggle",
    [KEYS.XF86.AUDIORAISEVOLUME] = "ipc call volume increase",
    [KEYS.XF86.AUDIOLOWERVOLUME] = "ipc call volume decrease",
    [KEYS.XF86.AUDIOMUTE] = "ipc call volume muteOutput",
    [KEYS.XF86.CALCULATOR] = "ipc call volume togglePanel",
    [KEYS.XF86.AUDIOPLAY] = "ipc call media playPause",
    [chord(KEYS.MODIFIER.ALT, KEYS.SPECIAL.ESCAPE)] = "ipc call systemMonitor toggle",
    [chord(KEYS.MODIFIER.CTRL, KEYS.MODIFIER.ALT, KEYS.NAVIGATION.DELETE)] = "ipc call sessionMenu toggle",
    [chord(KEYS.MODIFIER.SUPER, KEYS.MODIFIER.ALT, KEYS.ALPHABET.L)] = "ipc call lockScreen lock",
    [chord(KEYS.MODIFIER.SUPER, KEYS.MODIFIER.SHIFT, KEYS.ALPHABET.W)] = "ipc call wallpaper random",
}

for keybind,call in pairs(calls) do 
    hl.bind(
        keybind,
        hl.dsp.exec_cmd(ipc .. call)
    )
end



-------------------------------------------------------------
---                 WORKING WITH WINDOWS                  ---   
-------------------------------------------------------------


hl.bind( -- close single window
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.ALPHABET.Q
    ),
    hl.dsp.window.close()
)

hl.bind( -- close all instances of a window
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.MODIFIER.SHIFT,
        KEYS.ALPHABET.Q
    ),
    hl.dsp.window.kill()
)

hl.bind( -- toggle float / tile
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.ALPHABET.F
    ),
    hl.dsp.window.float()
)

hl.bind( -- focus left
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.ARROW.LEFT
    ),
    hl.dsp.focus({
        direction = "left"
    })
)

hl.bind( -- focus right
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.ARROW.RIGHT
    ),
    hl.dsp.focus({
        direction = "right"
    })
)
hl.bind( -- focus up
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.ARROW.UP
    ),
    hl.dsp.focus({
        direction = "up"
    })
)

hl.bind( -- focus down
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.ARROW.DOWN
    ),
    hl.dsp.focus({
        direction = "down"
    })
)

hl.bind( -- toggle fullscreen
    KEYS.FUNCTION.F11,
    hl.dsp.window.fullscreen()
)

hl.bind( -- drag window
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.MOUSE.LMB
    ),
    hl.dsp.window.drag()
)

hl.bind( -- resize window
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.MOUSE.RMB
    ),
    hl.dsp.window.resize()
)

hl.bind( -- swap focused window with window to the left 
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.MODIFIER.SHIFT,
        KEYS.ARROW.LEFT
    ),
    hl.dsp.window.swap({
        direction = "left"
    })
)

hl.bind( -- swap focused window with window to the right
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.MODIFIER.SHIFT,
        KEYS.ARROW.RIGHT
    ),
    hl.dsp.window.swap({
        direction = "right"
    })
)

hl.bind( -- swap focused window with window above
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.MODIFIER.SHIFT,
        KEYS.ARROW.UP
    ),
    hl.dsp.window.swap({
        direction = "up"
    })
)

hl.bind( -- swap focused window with window below
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.MODIFIER.SHIFT,
        KEYS.ARROW.DOWN
    ),
    hl.dsp.window.swap({
        direction = "down"
    })
)

-------------------------------------------------------------
---                WORKING WITH WORKSPACES                ---   
-------------------------------------------------------------
---

local function SwitchToWorkspace(WorkspaceID) 
    hl.bind(
        chord(
            KEYS.MODIFIER.SUPER,
            tostring(WorkspaceID)
        ),
        hl.dsp.focus({
            workspace = tostring(WorkspaceID)
        })
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
        })
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
        })
    )
end

for i = 1, 9 do
    SwitchToWorkspace(i)
    MoveWindowToWorkspace(i)
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
    })
)

hl.bind(
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.MODIFIER.ALT,
        KEYS.ARROW.LEFT
    ),
    hl.dsp.focus({
        workspace = "-1"
    })
)