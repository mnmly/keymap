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
; LControl & Tab::AltTab
; ^+Tab::Send ^!{Tab}
;
;WheelUp::Send {WheelDown}
;WheelDown::Send {WheelUp}

; Remap Fullscreen
^!m::WinMaximize, A  ; Assign a hotkey to maximize the active window.
^!c::CenterWindow("A")
^!Left::MoveWindowLeft("A")
^!Right::MoveWindowRight("A")


; The following function centers the specified window on the screen:
CenterWindow(WinTitle)
{
    WinGetPos,,, Width, Height, %WinTitle%
    WinMove, %WinTitle%,, (A_ScreenWidth/4), (A_ScreenHeight/4), (A_ScreenWidth / 2), (A_ScreenHeight / 2)
}

; The following function centers the specified window on the screen:
MoveWindowLeft(WinTitle)
{
    WinGetPos,,, Width, Height, %WinTitle%
    WinMove, %WinTitle%,, 0, 0, (A_ScreenWidth/2), A_ScreenHeight
}

; The following function centers the specified window on the screen:
MoveWindowRight(WinTitle)
{
    WinGetPos,,, Width, Height, %WinTitle%
    WinMove, %WinTitle%,, (A_ScreenWidth/2), 0, (A_ScreenWidth/2), A_ScreenHeight
}


^E:: Send #v

SetTitleMatchMode, 2

#If WinActive("ahk_class Chrome_WidgetWin_1") && WinActive("ahk_exe chrome.exe")

; Cycle through tabs
^+]::Send ^{PgDn}
^+[::Send ^{PgUp}

; Show Web Developer Tools with cmd + alt + i
^!i::Send {F12}

#IfWinActive

#If WinActive("ahk_exe explorer.exe")

; Delete File
^BS::Send {Del}
RWin & BS::Send {Del}

; Open File
^O::Send {Enter}

; Rename File
Enter::Send {F2}
#IfWinActive
