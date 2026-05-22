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
    NUMBER = {
        ONE = "1",
        TWO = "2",
        THREE = "3",
        FOUR = "4",
        FIVE = "5",
        SIX = "6",
        SEVEN = "7",
        EIGHT = "8",
        NINE = "9",
        ZERO = "0",
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
        TAB = "TAB"
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
        HOMEPAGE = "XF86HomePage",
        MAIL = "XF86Mail",            
        SEARCH = "XF86Search",        
        TOOLS = "XF86Tools",        
        AUDIOPLAY = "XF86AudioPlay",        
        AUDIOPREV = "XF86AudioPrev",        
        AUDIONEXT = "XF86AudioNext",        
        AUDIOLOWERVOLUME = "XF86AudioLowerVolume",        
        AUDIORAISEVOLUME = "XF86AudioRaiseVolume",        
        AUDIOMUTE = "XF86AudioMute",        
        EXPLORER = "XF86Explorer",        
        CALCULATOR = "XF86Calculator"        
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
    ghostty = chord(KEYS.MODIFIER.SUPER, KEYS.SPECIAL.ENTER),
    ["google-chrome-stable"] = chord(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.B),
    code = chord(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.C),
    dolphin = chord(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.E),
    localsend = chord(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.L)
}

for command,keybind in pairs(apps) do 
    hl.bind(
        keybind,
        hl.dsp.exec_cmd(command)
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

for i = 1, 9 do
    hl.bind(
        chord(
            KEYS.MODIFIER.SUPER,
            tostring(i)
        ),
        hl.dsp.focus({
            workspace = tostring(i)
        })
    )
     hl.bind(
        chord(
            KEYS.MODIFIER.SUPER,
            KEYS.MODIFIER.SHIFT,
            tostring(i)
        ),
        hl.dsp.window.move({
            workspace = tostring(i)
        })
    )
    hl.bind(
        chord(
            KEYS.MODIFIER.SUPER,
            KEYS.MODIFIER.ALT,
            tostring(i)
        ),
        hl.dsp.window.move({
            workspace = tostring(i),
            follow = false,
        })
    )
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