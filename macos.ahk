#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; --------
; NOTES
; --------------------------------------------------------------
; ! = ALT
; ^ = CTRL
; + = SHIFT
; # = WIN
;
; Debug action snippet: MsgBox You pressed Control-A while Notepad is active.

; Close windows (cmd + q to Alt + F4)
^q::Send !{F4}

; Remap Windows + Tab to Alt + Tab.
LControl & Tab::AltTab

WheelUp::Send {WheelDown}
WheelDown::Send {WheelUp}

SetTitleMatchMode, 2

#If WinActive("ahk_class Chrome_WidgetWin_1") && WinActive("ahk_exe chrome.exe")
^+]::Send ^{PgDn}
^+[::Send ^{PgUp}
; Show Web Developer Tools with cmd + alt + i
^!i::Send {F12}
#IfWinActive

#If WinActive("ahk_exe explorer.exe")
^BS::Send {Del}
RWin & BS::Send {Del}
^Up::Send !{Up}
^Down::Send {ENTER}
^O::Send {Enter}
Enter::Send {F2}
#IfWinActive