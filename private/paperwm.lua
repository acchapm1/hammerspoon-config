PaperWM = hs.loadSpoon("PaperWM")
PaperWM:bindHotkeys({
    -- switch to a new focused window in tiled grid
    focus_left  = {{"ctrl", "alt", "cmd"}, "left"},
    focus_right = {{"ctrl", "alt", "cmd"}, "right"},
    focus_up    = {{"ctrl", "alt", "cmd"}, "up"},
    focus_down  = {{"ctrl", "alt", "cmd"}, "down"},

    -- move windows around in tiled grid
    swap_left  = {{"ctrl", "alt", "cmd", "shift"}, "left"},
    swap_right = {{"ctrl", "alt", "cmd", "shift"}, "right"},
    swap_up    = {{"ctrl", "alt", "cmd", "shift"}, "up"},
    swap_down  = {{"ctrl", "alt", "cmd", "shift"}, "down"},

    -- position and resize focused window
    center_window = {{"ctrl", "alt", "cmd"}, "c"},
    full_width    = {{"ctrl", "alt", "cmd"}, "f"},
    cycle_width   = {{"ctrl", "alt", "cmd"}, "r"},
    cycle_height  = {{"ctrl", "alt", "cmd", "shift"}, "r"},

    -- move focused window into / out of a column
    slurp_in = {{"ctrl", "alt", "cmd"}, "i"},
    barf_out = {{"ctrl", "alt", "cmd"}, "o"},

    -- switch to a new Mission Control space
    switch_space_1 = {{"ctrl", "alt", "cmd"}, "1"},
    switch_space_2 = {{"ctrl", "alt", "cmd"}, "2"},
    switch_space_3 = {{"ctrl", "alt", "cmd"}, "3"},
    switch_space_4 = {{"ctrl", "alt", "cmd"}, "4"},
    switch_space_5 = {{"ctrl", "alt", "cmd"}, "5"},
    switch_space_6 = {{"ctrl", "alt", "cmd"}, "6"},
    switch_space_7 = {{"ctrl", "alt", "cmd"}, "7"},
    switch_space_8 = {{"ctrl", "alt", "cmd"}, "8"},
    switch_space_9 = {{"ctrl", "alt", "cmd"}, "9"},

    -- move focused window to a new space and tile
    move_window_1 = {{"ctrl", "alt", "cmd", "shift"}, "1"},
    move_window_2 = {{"ctrl", "alt", "cmd", "shift"}, "2"},
    move_window_3 = {{"ctrl", "alt", "cmd", "shift"}, "3"},
    move_window_4 = {{"ctrl", "alt", "cmd", "shift"}, "4"},
    move_window_5 = {{"ctrl", "alt", "cmd", "shift"}, "5"},
    move_window_6 = {{"ctrl", "alt", "cmd", "shift"}, "6"},
    move_window_7 = {{"ctrl", "alt", "cmd", "shift"}, "7"},
    move_window_8 = {{"ctrl", "alt", "cmd", "shift"}, "8"},
    move_window_9 = {{"ctrl", "alt", "cmd", "shift"}, "9"}
})
PaperWM:start()