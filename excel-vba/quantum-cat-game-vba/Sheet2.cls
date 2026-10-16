Attribute VB_Name = "Sheet2"
Attribute VB_Base = "0{00020820-0000-0000-C000-000000000046}"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True
Attribute VB_TemplateDerived = False
Attribute VB_Customizable = True
Attribute VB_Control = "CommandButton1, 1, 1, MSForms, CommandButton"
Private Sub CommandButton1_Click()

start_Tf = 0
Do While start_Tf = 0
If Sheet2.Cells(3, 3) > 10000 Then
MsgBox "1만원~9999만원까지 입력 가능"
Else
start_Tf = 1
End If
Loop


Sheet1.Cells(12, 2) = Sheet2.Cells(3, 3)
Sheets("version1").Select
Sheet1.Cells(12, 2) = Sheet2.Cells(3, 3)

Sheet1.Range("F5:H1032").Select
Selection.ClearContents
Sheet1.Range("J5:L1032").Select
Selection.ClearContents
Sheet1.Range("N5:P1032").Select
Selection.ClearContents
Sheet1.Range("R5:T1032").Select
Selection.ClearContents

Sheet1.Cells(5, 2) = " "
Sheet1.Cells(5, 3) = " "
Sheet1.Cells(5, 4) = " "
Sheet1.Cells(9, 2) = " "
Sheet1.Cells(9, 3) = " "
Sheet1.Cells(10, 2) = " "
Sheet1.Cells(10, 3) = " "
Sheet1.Cells(11, 2) = " "
Sheet1.Cells(11, 3) = " "
Sheet1.Cells(13, 2) = " "
Sheet1.Cells(15, 2) = " "
Sheet1.Cells(14, 2) = " "
Sheet1.Cells(17, 2) = " "
Sheet1.Cells(17, 3) = " "
Sheet1.Cells(17, 1) = " "
Sheet1.Cells(16, 2) = " "
Sheet1.Cells(16, 3) = " "


End Sub
