-- tmux prefix and pane bindings.
rex.bind("ctrl+a>ctrl+a", "pane.send_key", { key = "ctrl+a" })
rex.bind("ctrl+a>c", "client.tab.new")
rex.bind("ctrl+a>r", "client.config.reload")
rex.bind("ctrl+a>shift+\\", "pane.split", { direction = "right" })
rex.bind("ctrl+a>-", "pane.split", { direction = "down" })
rex.bind("ctrl+a>ctrl+left", "pane.resize", { amount = 5, direction = "left" })
rex.bind("ctrl+a>ctrl+right", "pane.resize", { amount = 5, direction = "right" })
rex.bind("ctrl+a>ctrl+up", "pane.resize", { amount = 5, direction = "up" })
rex.bind("ctrl+a>ctrl+down", "pane.resize", { amount = 5, direction = "down" })
rex.bind("ctrl+a>ctrl+l", "pane.send_key", { key = "ctrl+l" })

-- Enter repeat mode with ctrl+a then ctrl+r; leave with enter or escape.
rex.mode("repeat", { exclusive = true })
rex.bind("ctrl+a>ctrl+r", "client.mode.enter", { name = "repeat" })
rex.bind("repeat/enter", "client.mode.exit")
rex.bind("repeat/escape", "client.mode.exit")
rex.bind("repeat/ctrl+left", "pane.resize", { amount = 5, direction = "left" })
rex.bind("repeat/ctrl+right", "pane.resize", { amount = 5, direction = "right" })
rex.bind("repeat/ctrl+up", "pane.resize", { amount = 5, direction = "up" })
rex.bind("repeat/ctrl+down", "pane.resize", { amount = 5, direction = "down" })

-- Ghostty split bindings.
rex.bind("alt+shift+up", "pane.split", { direction = "up" })
rex.bind("alt+shift+right", "pane.split", { direction = "right" })
rex.bind("alt+shift+down", "pane.split", { direction = "down" })
rex.bind("alt+shift+left", "pane.split", { direction = "left" })

-- iTerm2 single-byte key mappings.
rex.bind("ctrl+-", "pane.send_key", { key = "ctrl+shift+-" })
rex.bind("ctrl+2", "pane.send_key", { key = "ctrl+space" })
rex.bind("ctrl+3", "pane.send_key", { key = "esc" })
rex.bind("ctrl+4", "pane.send_key", { key = "ctrl+\\" })
rex.bind("ctrl+5", "pane.send_key", { key = "ctrl+]" })
rex.bind("ctrl+6", "pane.send_key", { key = "ctrl+shift+6" })
rex.bind("ctrl+7", "pane.send_key", { key = "ctrl+shift+-" })
rex.bind("ctrl+8", "pane.send_key", { key = "backspace" })
