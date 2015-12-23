
Gui, Show, x0 y0 h0 w0, FnMapper

HomePath := A_ScriptDir "\AutohotkeyRemoteControl.dll"
hModule := DllCall("LoadLibrary", "str", HomePath)
OnMessage(0x00FF, "InputMsg")

EditUsage     := 1
EditUsagePage := 12
HWND          := WinExist("FnMapper")
nRC           := DllCall("AutohotkeyRemoteControl\RegisterDevice", INT, EditUsage, INT, EditUsagePage, INT, HWND, "Cdecl UInt")
WinHide, FnMapper


InputMsg(wParam, lParam, msg, hwnd) {
	DeviceNr := -1
	nRC := DllCall("AutohotkeyRemoteControl\GetWM_INPUTDataType", UINT, wParam, UINT, lParam, "INT *", DeviceNr, "Cdecl UInt")
	if (ErrorLevel || nRC == 0xFFFFFFFF) {
		MsgBox GetWM_INPUTHIDData fehlgeschlagen. Errorcode: %errorlevel%
		DllCall("FreeLibrary", "UInt", hModule)
		ExitApp
	}
	if (nRC = 2)
		ProcessHIDData(wParam, lParam)
	else {
		MsgBox, 4144,, Error - no HID data
		DllCall("FreeLibrary", "UInt", hModule)
		ExitApp
	}
}
ProcessHIDData(wParam, lParam) {
	DataSize:=5000, VarSetCapacity(RawData, %DataSize%, 0), RawData:=1
	DllCall("AutohotkeyRemoteControl\GetWM_INPUTHIDData", UINT, wParam, UINT, lParam, "UINT *" , DataSize, "UINT", &RawData, "Cdecl UInt")
	KeyStatus := NumGet(RawData, 1, "UChar")
	
	;Filter bit 5 (Fn key) & bit 4 (Eject key)
	Transform, FnValue, BitAnd, 16, KeyStatus
	Transform, EjectValue, BitAnd, 8, KeyStatus
	
	fnPressed := (FnValue=16) ? 1 : 0
	ejPressed := (EjectValue=8) ? 1 : 0
}