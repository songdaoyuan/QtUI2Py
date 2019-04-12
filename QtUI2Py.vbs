Dim objWs
Set objWs = CreateObject("Wscript.Shell")
Set objFso = CreateObject("Scripting.FileSystemObject")

IF Wscript.Arguments.count = 0 then 
	Msgbox "拖拽.ui文件到本图标",0,"提示"
End if

For i = 0 To Wscript.Arguments.count-1
	StrPath = wscript.Arguments(a)
	IF objFso.GetExtensionName(StrPath) <> "ui" then
		Msgbox "错误，非.ui文件，请检查",0,"提示"
		Wscript.Quit()
	End IF 
	UIFilePath = objFso.GetParentFolderName(StrPath)
Next

objWs.Run "powershell pyuic5 -o " & UIFilePath & "\UI.py " & "StrPath"
objWs.popup "在.ui文件所在目录下生成UI.py",5,"QtUI2Py",64
