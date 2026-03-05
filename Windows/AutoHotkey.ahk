/*
* This file is used to emulate Linux key bindings on Windows system.
*
*   ^ Ctrl
*   ! Alt
*   # Super
*   + Shift
*/

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                            Utilities                             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

IsPowerShellWindow() {
    SetTitleMatchMode(2)
    return (WinActive("ahk_exe WindowsTerminal.exe")
            || WinActive("ahk_exe powershell.exe"))
        && (WinActive("Windows PowerShell")
            || WinActive("PowerShell")
            || WinActive("powershell")
            || WinActive("Capacity DMS")
            || WinActive("EXCHANGE"))
}

IsPowerShellIseWindow() {
    return WinActive("Windows PowerShell ISE")
}

IsOneNoteWindow() {
    return WinActive("ahk_exe OneNote.exe")
}

IsFirefoxWindow() {
    return WinActive("ahk_class MozillaWindowClass")
}

IsEdgeWindow() {
    return WinActive("ahk_class Chrome_WidgetWin_1")
}

IsMicrosoftToDoWindow() {
    return WinActive("Microsoft To Do")
}

ShouldApplyShellBindings() {
    return IsPowerShellWindow()
}

KillLine() {
    Send("+{End}")
    Send("{Delete}")
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                              Shell                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#HotIf ShouldApplyShellBindings()

^f::Send("{Right}")
^+f::Send("+{Right}")

^b::Send("{Left}")
^+b::Send("+{Left}")

^p::Send("{Up}")
^+p::Send("+{Up}")

^n::Send("{Down}")
^+n::Send("+{Down}")

!b::Send("^{Left}")
!+b::Send("^+{Left}")

!f::Send("^{Right}")
!+f::Send("^+{Right}")

^a::Send("{Home}")
^+a::Send("+{Home}")

^e::Send("{End}")
^+e::Send("+{End}")

^d::Send("{Delete}")

!d::Send("^{Delete}")

!Backspace::Send("^{Backspace}")

^g::Send("{Esc}")
^u::Send("{Esc}")

^k::KillLine()

^v::Send("{PgDn}")
!v::Send("{PgUp}")

^y::Send("+{Insert}")

!>::Send("^{End}")
!<::Send("^{Home}")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                            Browser                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#HotIf IsFirefoxWindow() || IsEdgeWindow()

!1::Send("^1")
!2::Send("^2")
!3::Send("^3")
!4::Send("^4")
!5::Send("^5")
!6::Send("^6")
!7::Send("^7")
!8::Send("^8")
!9::Send("^9")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                             Global                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#HotIf

#q::Send("!{F4}")

+Space::Send("{Space}")