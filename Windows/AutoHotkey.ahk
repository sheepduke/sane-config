/*
* This file is used to emulate Linux key bindings on Windows system.
*
* Some quick references:
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
    SetTitleMatchMode 2
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
    ; SetTitleMatchMode 2
    ; return WinActive("OneNote")
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
           || IsPowerShellWindow()
}

KillLine() {
    Send +{End}
    Send {Delete}
    return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                              Shell                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#if ShouldApplyShellBindings()

; C-f => Forward char.
^F::Send {Right}
^+F::Send +{Right}

; C-b => Backward char.
^B::Send {Left}
^+B::Send +{Left}

; C-p => Backward line.
^P::Send {Up}
^+P::Send +{Up}

; C-n => Forward line.
^N::Send {Down}
^+N::Send +{Down}

; M-b => Backward word.
!B::Send ^{Left}
!+B::Send ^+{Left}

; M-f => Forward word.
!F::Send ^{Right}
!+F::Send ^+{Right}

; C-a => Goto beginning of line.
^A::Send {Home}
^+A::Send +{Home}

; C-e => Goto end of line.
^E::Send {End}
^+E::Send +{End}

; C-d => Delete char.
^D::Send {Delete}

; M-d => Delete word.
!D::Send ^{Delete}

; M-<Backspace> => Backward kill word.
!Backspace::Send ^{Backspace}

; C-g => Cancel.
^G::Send {Esc}

; C-u => Cancel.
^U::Send {Esc}

; C-k => Kill line.
^K::KillLine()

; C-v => Page down.
^V::Send {PgDn}

; M-v => Page up.
!V::Send {PgUp}

; C-y => Yank.
^Y::Send +{Insert}

; M-< => Move to end.
!>::Send ^{End}

; M-> => Move to beginning.
!<::Send ^{Home}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                            Browser                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#if IsFirefoxWindow() or IsEdgeWindow()

!1::Send ^1
!2::Send ^2
!3::Send ^3
!4::Send ^4
!5::Send ^5
!6::Send ^6
!7::Send ^7
!8::Send ^8
!9::Send ^9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                             Global                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#IfWinActive

; S-q => Close window.
#q::Send !{F4}

+Space::Send {Space}