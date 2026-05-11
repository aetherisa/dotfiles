import os

# base16 colorscheme
config.source(os.environ.get("XDG_DATA_HOME") + "/base16/qutebrowser")

# fonts
config.set("fonts.default_family", "CaskaydiaCove Nerd Font")
config.set("fonts.default_size", "12pt")

# tab bar
config.set("tabs.position", "left")
config.set("tabs.favicons.show", "always")
config.set("tabs.indicator.width", 4)
config.set("tabs.indicator.padding", { "bottom": 2, "left": 0, "right": 4, "top": 2 })
config.set("tabs.padding", { "bottom": 6, "left": 3, "right": 3, "top": 6 })
config.set("tabs.title.format", "{current_title}")
config.set("tabs.width", "12%")

# url
config.set("url.start_pages", "about:blank")
config.set("url.default_page", "www.google.com")

# status bar
config.set("statusbar.show", "never")

# miscellaneous
config.set("downloads.location.directory", "~/downloads/")
config.set("auto_save.session", True)
config.set("scrolling.smooth", True)

# key bindings
config.bind("<Shift+Up>", "tab-prev")
config.bind("<Shift+Down>", "tab-next")
config.bind("<Shift+Left>", "back")
config.bind("<Shift+Right>", "forward")
config.bind("<Shift+R>", "reload")
config.bind("<Shift+Q>", "tab-close")
config.bind("<Shift+U>", "undo")
config.bind("<Shift+M>", "tab-mute")
config.bind("<Shift+Return>", "open -tr")
config.bind("<Ctrl+Shift+Down>", "tab-move +")
config.bind("<Ctrl+Shift+Up>", "tab-move -")

config.load_autoconfig(False)
