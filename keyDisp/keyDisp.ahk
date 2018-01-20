#SingleInstance IGNORE
SplashTextOn,300,100,,`nkeyDisp`n`nCreated by ayunami2000`nhttps://ayunami2000.github.io/AHK/keyDisp
Sleep,2500
SplashTextOff
InputBox,GUIcolor,Set Color,Type the desired hexadecimal color for the background of the display into the box below.`n`nEx.:`n00FF00 (green)
If ErrorLevel
ExitApp
If (GUIcolor="")
GUIcolor=FF0000
If (StrLen(GUIcolor)=6)
GUIcolor=0x%GUIcolor%
Gui,Color,%GUIcolor%
SetFormat,Integer,Hex
GUIcolor^=0xffffff
Gui,+E0x20 -Caption +LastFound +ToolWindow +AlwaysOnTop
WinSet,Transparent,127.5
Gui,Font,s13 Bold
Gui,Add,Text,Center c%GUIcolor% vovrlay x0 y12.5 w150,Press a Key...
Gui,Show,xCenter y0 w150 h50
MsgBox,36,Easy Exit Mode,Easy Exit mode allows you to type "exit" and then enter to exit AutoHotkey. Would you like to enable it?
esyExt=0
IfMsgBox Yes
esyExt=1
Gui,Show,xCenter y0 w150 h50
Loop{
Input,key,VL1MCE,{LControl}{RControl}{LAlt}{RAlt}{LShift}{RShift}{LWin}{RWin}{AppsKey}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BS}{Capslock}{Numlock}{PrintScreen}{Pause}
If(ErrorLevel!="Max"){
StringTrimLeft,ErrorLevel,ErrorLevel,7
key=%ErrorLevel%
}
If(key="`n")
key=Enter
If(key="`t")
key=Tab
If(key=" ")
key=Space
If(esyExt=1){
If((key="x")&&(str="e") or (key="i")&&(str="ex") or (key="t")&&(str="exi")){
str=%str%%key%
}
If((key="Enter")&&(str="exit")){
SplashTextOff
ExitApp
}
If((key!="x")&&(key!="i")&&(key!="t")){
str=%key%
}
}else{
str=%key%
}
GuiControl,,ovrlay,%str%
}
