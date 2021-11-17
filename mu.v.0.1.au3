#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>

HotKeySet ("{ESC}", "Terminate")

;~ �������� � ���� MUOnline
Local $muGarius = WinGetPos('MU', 'garius')

;������� ������ ���������
Local $invPosX = $muGarius[0] + 711
Local $invPosY = $muGarius[1] + 588

;������� ������
Local $centerPosX = $muGarius[0] + 400
Local $centerPosY = $muGarius[1] + 270

;~ ������� ������������ ������ ��������
Local $hpPointX = $muGarius[0] + 238
Local $hpPointY = $muGarius[1] + 593

;~ �������� ������ ��� �������� ���������
If 1 then
   $centerPosX = $muGarius[0] + 300
EndIf

;������� ������ ������ ���������
Local $invFirstCellX = $muGarius[0] + 585 + 12
Local $invFirstCellY = $muGarius[1] + 277 + 12

;������� ��������� �������
Func Terminate()
    Exit
 EndFunc

; �������� ����� ����������
Func wait()
   sleep(200)
EndFunc

; ������ �� ������ ���������
 Func pressInvBtn()
   sleep(200)
   MouseMove($invPosX, $invPosY, 10)
   MouseDown($MOUSE_CLICK_LEFT)
   sleep(200)
   MouseUp($MOUSE_CLICK_LEFT)
   sleep(200)
;~    Send("{V}")
EndFunc

;  ������ �� ����� ������
 Func pressCenter()
   wait()
   MouseMove($centerPosX, $centerPosY, 10)
   MouseDown($MOUSE_CLICK_LEFT)
   wait()
   MouseUp($MOUSE_CLICK_LEFT)
EndFunc

;~ ��������� � ������ ������
Func atacCenter()
   MouseMove($centerPosX, $centerPosY, 10)
   MouseDown($MOUSE_CLICK_RIGHT)
   Sleep(100)
   MouseUp($MOUSE_CLICK_RIGHT)
EndFunc

; ��������� ���������
Func CheckInv()
   MouseMove($centerPosX, $centerPosY, 10)
   If PixelGetColor($invPosX, $invPosY) = '6249038' Then
	  ConsoleWrite(' Inv is Close ')
	  Return True
   Else
	  ConsoleWrite(' Inv is Open ')
	  Return False
   EndIf
EndFunc

;~ ������� ���������
Func openInv()
   while CheckInv()
	  pressInvBtn()
	  MouseMove($centerPosX, $centerPosY, 10)
   WEnd
   Return True
EndFunc

;~ �������� ����� �� ���������
Func invMouseMove()
   For $i = 0 to 24*8 Step 25
	  For $j = 0 to 24*8 Step 25
		 MouseMove($invFirstCellX + $i, $invFirstCellY + $j, 10)
		 sleep(100)
	  Next
   Next
EndFunc

;~ ������� � ������� ����� ���������
Func checkInvColors()
   For $i = 0 to 24*8 Step 25
	  ConsoleWrite(@CRLF)
	  For $j = 0 to 24*8 Step 25
		 ConsoleWrite( getColor($invFirstCellX + $i, $invFirstCellY + $j) & @CRLF)
	  Next
   Next
EndFunc

;~ �������� ���� � ������� HEX, �� ����������� x, y
Func getColor($clrX, $clrY)
   Return Hex(PixelGetColor($clrX, $clrY), 6)
EndFunc

;~ �������� ���� ������
Func getCellColor($cellX, $cellY)
   $cellColor = ''
   $cellColor = getColor($invFirstCellX + 25 * $cellX - 25, $invFirstCellY + 25 * $cellY - 25)
   ConsoleWrite('���� ������ ' & $cellX & 'x' & $cellY & ' = ' & $cellColor & @CRLF)
   Return $cellColor
EndFunc

;~ ��������� ������� �� ������
Func dropItem($dropItemX, $dropItemY)
   Local $randomDropPlase = Random(1, 5 , 1)

   MouseMove($centerPosX, $centerPosY, 5)
   MouseDown($MOUSE_CLICK_RIGHT)
   Sleep(300)
   MouseUp($MOUSE_CLICK_RIGHT)

   MouseMove($invFirstCellX + 25 * $dropItemX - 25, $invFirstCellY + 25 * $dropItemY - 25, 5)
   MouseDown($MOUSE_CLICK_LEFT)
   Sleep(300)
   MouseUp($MOUSE_CLICK_LEFT)
   Sleep(300)

   If $randomDropPlase = 1 Then
	  MouseMove($centerPosX + 170, $centerPosY, 5)
   ElseIf $randomDropPlase = 2 Then
	  MouseMove($centerPosX + 170, $centerPosY + 170, 5)
   ElseIf $randomDropPlase = 3 Then
	  MouseMove($centerPosX, $centerPosY + 170, 5)
   ElseIf $randomDropPlase = 4 Then
	  MouseMove($centerPosX - 170, $centerPosY + 170, 5)
   ElseIf $randomDropPlase = 5 Then
	  MouseMove($centerPosX - 170, $centerPosY, 5)
   Else
	  MouseMove($centerPosX + 170, $centerPosY + 170, 5)
   EndIf

   MouseDown($MOUSE_CLICK_LEFT)
   Sleep(300)
   MouseUp($MOUSE_CLICK_LEFT)
   Sleep(300)

EndFunc

;~ �������� �� ������ ������
Func checkCell7x5()
   ConsoleWrite('�������� ������ 7�5 ' & @CRLF)
   Local $emptyCell7x5 = '1D1B1B'
   If getCellColor(7, 5) = $emptyCell7x5 Then
	  ConsoleWrite('������ 7�5 ������ ' & @CRLF)
	  Return False
   Else
	  ConsoleWrite('������ 7�5 ������ ' & @CRLF)
	  Return True
   EndIf
EndFunc
Func checkCell8x5()
   ConsoleWrite('�������� ������ 8�5 ' & @CRLF)
   Local $emptyCell8x5 = '222020'
   If getCellColor(8, 5) = $emptyCell8x5 Then
	  ConsoleWrite('������ 8�5 ������ ' & @CRLF)
	  Return False
   Else
	  ConsoleWrite('������ 8�5 ������ ' & @CRLF)
	  Return True
   EndIf
EndFunc
Func checkCell7x6()
   ConsoleWrite('�������� ������ 7�6 ' & @CRLF)
   Local $emptyCell7x6 = '1E1C1C'
   If getCellColor(7, 6) = $emptyCell7x6 Then
	  ConsoleWrite('������ 7�6 ������ ' & @CRLF)
	  Return False
   Else
	  ConsoleWrite('������ 7�6 ������ ' & @CRLF)
	  Return True
   EndIf
EndFunc
Func checkCell8x6()
   ConsoleWrite('�������� ������ 8x6 ' & @CRLF)
   Local $emptyCell8x6 = '161616'
   If getCellColor(8, 6) = $emptyCell8x6 Then
	  ConsoleWrite('������ 8x6 ������ ' & @CRLF)
	  Return False
   Else
	  ConsoleWrite('������ 8x6 ������ ' & @CRLF)
	  Return True
   EndIf
EndFunc
Func checkCell7x7()
   ConsoleWrite('�������� ������ 7x7 ' & @CRLF)
   Local $emptyCell7x7 = '1B1919'
   If getCellColor(7, 7) = $emptyCell7x7 Then
	  ConsoleWrite('������ 7x7 ������ ' & @CRLF)
	  Return False
   Else
	  ConsoleWrite('������ 7x7 ������ ' & @CRLF)
	  Return True
   EndIf
EndFunc
Func checkCell8x7()
   ConsoleWrite('�������� ������ 8x7 ' & @CRLF)
   Local $emptyCell8x7 = '171717'
   If getCellColor(8, 7) = $emptyCell8x7 Then
	  ConsoleWrite('������ 8x7 ������ ' & @CRLF)
	  Return False
   Else
	  ConsoleWrite('������ 8x7 ������ ' & @CRLF)
	  Return True
   EndIf
EndFunc
Func checkCell7x8()
   ConsoleWrite('�������� ������ 7x8 ' & @CRLF)
   Local $emptyCell7x8 = '242222'
   If getCellColor(7, 8) = $emptyCell7x8 Then
	  ConsoleWrite('������ 7x8 ������ ' & @CRLF)
	  Return False
   Else
	  ConsoleWrite('������ 7x8 ������ ' & @CRLF)
	  Return True
   EndIf
EndFunc
Func checkCell8x8()
   ConsoleWrite('�������� ������ 8x8 ' & @CRLF)
   Local $emptyCell8x8 = '1E1C1C'
   If getCellColor(8, 8) = $emptyCell8x8 Then
	  ConsoleWrite('������ 8x8 ������ ' & @CRLF)
	  Return False
   Else
	  ConsoleWrite('������ 8x8 ������ ' & @CRLF)
	  Return True
   EndIf
EndFunc

;~ ��������� ��������� ������
Func dropLastItem()
   If openInv() Then
	  If checkCell7x5() Then
		 ConsoleWrite ('������� 7x5' & @CRLF)
		 dropItem(7, 5)
	  ElseIf checkCell8x5() Then
		 ConsoleWrite ('������� 8x5' & @CRLF)
		 dropItem(8, 5)
	  ElseIf checkCell7x6() Then
		 ConsoleWrite ('������� 7x6' & @CRLF)
		 dropItem(7, 6)
	  ElseIf checkCell8x6() Then
		 ConsoleWrite ('������� 8x6' & @CRLF)
		 dropItem(8, 6)
	  ElseIf checkCell7x7() Then
		 ConsoleWrite ('������� 7x7' & @CRLF)
		 dropItem(7, 7)
	  ElseIf checkCell8x7() Then
		 ConsoleWrite ('������� 8x7' & @CRLF)
		 dropItem(8, 7)
	  ElseIf checkCell7x8() Then
		 ConsoleWrite ('������� 7x8' & @CRLF)
		 dropItem(7, 8)
	  ElseIf checkCell8x8() Then
		 ConsoleWrite ('������� 8x8' & @CRLF)
		 dropItem(8, 8)
	  Else
		 ConsoleWrite ('�����, ���������� ��������' & @CRLF)
	  EndIf
   EndIf
EndFunc

;~ ����������
Func getHP()
   If getColor(hpPointX, hpPointY) = '2F2D2D' Then
	  Send("{Q 5
   EndIf
EndFunc

;~ �������� ��������� ������
Func goEaseKach()
   getHP()
   atacCenter()
   atacCenter()
   Send("{F8 10}")
   MouseMove($muGarius[0] + 5, $muGarius[1] + 5, 10)
   MouseClick($MOUSE_CLICK_LEFT)
   while 1
	  getHP()
	  For $i = 0 to 2
		 atacCenter()
		 Send("{SPACE 20}")
	  Next
	  dropLastItem()
   WEnd
EndFunc

;~ �������� ������	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
goEaseKach()
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


;~ ���� ������	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




