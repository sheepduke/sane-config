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

IsCmdWindow() {
    return WinActive("ahk_class ConsoleWindowClass")
}

IsPowerShellWindow() {
    return WinActive("powershell") or WinActive("Windows PowerShell (Admin)")
}

IsConsoleWindow() {
    return IsCmdWindow() or IsPowerShellWindow()
}

IsNotepadWindow() {
    return WinActive("ahk_class Notepad")
}

IsVisualStudioWindow() {
    SetTitleMatchMode 2
    return WinActive("Visual Studio")
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                              Basic                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#if IsConsoleWindow() or IsNotepadWindow() or IsVisualStudioWindow()

; C-f => Forward char.
^F::Send {Right}

; C-b => Backward char.
^B::Send {Left}

; C-p => Backward line.
^P::Send {Up}

; C-n => Forward line.
^N::Send {Down}

; M-b => Backward word.
!B::Send ^{Left}

; M-f => Forward word.
!F::Send ^{Right}

; C-a => Goto beginning of line.
^A::Send {Home}

; C-e => Goto end of line.
^E::Send {End}

; C-d => Delete char.
^D::Send {Delete}

; M-d => Delete word.
!D::Send ^{Delete}

; M-<Backspace> => Backward kill word.
!Backspace::Send ^{Backspace}


#if IsConsoleWindow()
^U::Send {Esc}

#if IsCmdWindow()
^K::
Send {Left}
Send +{Home}
Click right
Send {Esc}
Click right
return

#if IsPowerShellWindow()
; C-k => Kill line.
^k::
Send +{End}
Send {Delete}
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                             Global                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#IfWinActive

; S-C => Close window.
#+c::Send !{F4}

; C-M-C => Show window class.
^!+c::
WinGetClass, class, A
MsgBox, The active window's class is "%class%".
return
; C-M-T => SHow window title.
^!+t::
WinGetTitle, Title, A
MsgBox, The active window is "%Title%".

; C-M-R => Reload script.
^!+r::Reload

^!+x::
if IsVisualStudioWindow() {
    MsgBox, "Catch!"
}
else {
    MsgBox, "Wrong"
}