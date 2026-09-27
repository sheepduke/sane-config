hl.config({
  xwayland = {
    force_zero_scaling = true
  }
})

hl.env("GDK_SCALE", "2")
hl.env("QT_SCALE_FACTOR", "1")
hl.env("GTK_IM_MODULE", "fcitx")
hl.env("QT_IM_MODULE", "fcitx")
hl.env("XMODIFIERS", "@im=fcitx")
hl.env("XIM", "fcitx")
hl.env("XIM_PROGRAM", "fcitx")
hl.env("GLFW_IM_MODULE", "fcitx")
