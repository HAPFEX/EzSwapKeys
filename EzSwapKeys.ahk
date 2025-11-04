#Requires AutoHotkey v2.0

esk_version := "1.0.0"



;;;;;;;;;; Includes

#Include JXON.ahk

;;;;;;;;;; Includes



;;;;;;;;;; Main Window

Gui_Main := Gui()
Gui_Main.Title := "EzSwapKeys v" . esk_version . " - https://hapfex.github.io/EzSwapKeys"
Gui_Main.Opt("-Resize -MaximizeBox")

Gui_Main_Keylist := Gui_Main.Add("ListView", "r20 w700", ["Default Key", "Swapped Key", "Syntax"])
Gui_Main_Keylist.ModifyCol(10)
Gui_Main_Keylist.Add("","")

MyMenu := MenuBar()
MyMenu.Add("Assign...", PromptAssignKey)
MyMenu.Add("Remove", NoAction)
MyMenu.Add("Profiles", NoAction)
MyMenu.Add("Preferences", ShowGui_Preferences)


Gui_Main.MenuBar := MyMenu

Gui_Main.Show()

;;;;;;;;;; Main Window



;;;;;;;;;; Preferences Window

Gui_Preferences := Gui()
Gui_Preferences.Title := "Preferences"
Gui_Preferences.Opt("-SysMenu +AlwaysOnTop")

Gui_Preferences_EnableOnStartup := Gui_Preferences.Add("CheckBox",, "Enable on system startup")
Gui_Preferences_Autohide := Gui_Preferences.Add("CheckBox",, "Autohide when started")
Gui_Preferences_UsePreviousProfile:= Gui_Preferences.Add("CheckBox",, "Use previous selected profile")

Gui_Preferences_ApplyButton := Gui_Preferences.Add("Button", "x10 y+10", "&Apply")
Gui_Preferences_CancelButton := Gui_Preferences.Add("Button", "x+10 yp", "&Cancel")

Gui_Preferences_ApplyButton.OnEvent("Click", NoAction)
Gui_Preferences_CancelButton.OnEvent("Click", HideGui_Preferences)

;;;;;;;;;; Preferences Window



;;;;;;;;;; Default Key Assignment Window

Gui_DefaultKeyAssignment := Gui()
Gui_DefaultKeyAssignment.Title := ""
Gui_DefaultKeyAssignment.Opt("-SysMenu +AlwaysOnTop")

Gui_DefaultKeyAssignment_TitleText := Gui_DefaultKeyAssignment.Add("Text",, "Enter a key to swap:           ")
Gui_DefaultKeyAssignment_KeyText := Gui_DefaultKeyAssignment.Add("Text",, "")
Gui_DefaultKeyAssignment_WaitText := Gui_DefaultKeyAssignment.Add("Text",, "Or do nothing for 3 seconds to abort.")

;;;;;;;;;; Default Key Assignment Window



;;;;;;;;;; Change Key Assignment Window

Gui_ChangeKeyAssignment := Gui()
Gui_ChangeKeyAssignment.Title := ""
Gui_ChangeKeyAssignment.Opt("-SysMenu +AlwaysOnTop")

Gui_ChangeKeyAssignment_TitleText := Gui_ChangeKeyAssignment.Add("Text",, "This %key% will be:           ")
Gui_ChangeKeyAssignment_KeyText := Gui_ChangeKeyAssignment.Add("Text",, "")
Gui_ChangeKeyAssignment_WaitText := Gui_ChangeKeyAssignment.Add("Text",, "Or do nothing for 3 seconds to abort.")

;;;;;;;;;; Change Key Assignment Window



;;;;;;;;;; Functions

NoAction(*) {
    ; Do nothing.
}

ShowGui_Preferences(*) {
    Gui_Preferences.Show()
}

HideGui_Preferences(*) {
    Gui_Preferences.Show("Hide")
}

PromptAssignKey(*) {
    Gui_DefaultKeyAssignment.Show()
}

DoAssignKey(*) {
    ; Function to assign a key.
}

;;;;;;;;;; Functions