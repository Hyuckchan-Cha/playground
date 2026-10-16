Attribute VB_Name = "Sheet1"
Attribute VB_Base = "0{00020820-0000-0000-C000-000000000046}"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True
Attribute VB_TemplateDerived = False
Attribute VB_Customizable = True
Attribute VB_Control = "CommandButton3, 10, 0, MSForms, CommandButton"
Attribute VB_Control = "CommandButton5, 7, 1, MSForms, CommandButton"
Attribute VB_Control = "CommandButton2, 2, 2, MSForms, CommandButton"
Attribute VB_Control = "CommandButton1, 1, 3, MSForms, CommandButton"
Attribute VB_Control = "CommandButton4, 6, 4, MSForms, CommandButton"
Attribute VB_Control = "CommandButton6, 8, 5, MSForms, CommandButton"
Attribute VB_Control = "CommandButton7, 9, 6, MSForms, CommandButton"
Private Sub CommandButton1_Click()

Dim i As Integer
Dim x, pi As Double

Range("F5:H1032").Select
Selection.ClearContents
Range("J5:L1032").Select
Selection.ClearContents
Range("N5:P1032").Select
Selection.ClearContents

dx = Cells(3, 7)
pi = 3.141592
i = 5
n = Cells(2, 7)
Cells(5, 2) = "sqrt(3)*x"
Cells(5, 3) = 0
Cells(5, 4) = 0 + dx * (n - 1)
L = Cells(5, 4)

Do While i - 6 < (L / dx)
     x = 0 + dx * (i - 5)
     Cells(i, 6) = x
     Cells(i, 7) = 3 * (x * x) / (L * L * L)
     Cells(i, 8) = Cells(i, 7) * dx
     Cells(i, 10) = i - 4
     Cells(i, 11) = ((-1) ^ (i - 3)) * Sqr(6) / ((i - 4) * pi)
     Cells(i, 12) = Cells(i, 11) ^ 2
     i = i + 1
     Sheet1.Activate
     Loop
     
i = 5
Do While i - 6 < (L / dx)
     x = 0 + dx * (i - 5)
     Cells(i, 14) = wavepacket_real(x, 0, 0)
     Cells(i, 15) = wavepacket_imag(x, 0, 0)
     Cells(i, 16) = Cells(i, 14) ^ 2 + Cells(i, 15) ^ 2
     i = i + 1
     Sheet1.Activate
Loop


End Sub
Private Sub CommandButton2_Click()

Dim i As Integer
Dim x, pi As Double

Range("F5:H1032").Select
Selection.ClearContents
Range("J5:L1032").Select
Selection.ClearContents
Range("N5:P1032").Select
Selection.ClearContents

dx = Cells(3, 7)
pi = 3.141592
i = 5
n = Cells(2, 7)
Cells(5, 2) = "step function"
Cells(5, 3) = 0
Cells(5, 4) = 0 + dx * (n)
L = Cells(5, 4) + dx

Do While i - 5 < (L / (2 * dx)) + 1
     x = 0 + dx * (i - 5)
     Cells(i, 6) = x
     Cells(i, 7) = 2 / L
     Cells(i, 8) = Cells(i, 7) * dx
     Cells(i, 10) = i - 4
     Cells(i, 11) = (4 * (Sin((i - 4) * pi / 4)) ^ 2) / ((i - 4) * pi)
     Cells(i, 12) = Cells(i, 11) ^ 2
     i = i + 1
     Sheet1.Activate
     Loop
     
Do While i - 5 < (L / dx) + 1
     x = 0 + dx * (i - 5)
     Cells(i, 6) = x
     Cells(i, 7) = 0
     Cells(i, 8) = Cells(i, 7) * dx
     Cells(i, 10) = i - 4
     Cells(i, 11) = (4 * (Sin((i - 4) * pi / 4)) ^ 2) / ((i - 4) * pi)
     Cells(i, 12) = Cells(i, 11) ^ 2
     i = i + 1
     Sheet1.Activate
     Loop
     
i = 5
Do While i - 6 < (L / dx)
     x = 0 + dx * (i - 5)
     Cells(i, 14) = wavepacket_real(x, 0, 1)
     Cells(i, 15) = wavepacket_imag(x, 0, 1)
     Cells(i, 16) = Cells(i, 14) ^ 2 + Cells(i, 15) ^ 2
     i = i + 1
     Sheet1.Activate
Loop


End Sub

Private Sub CommandButton6_Click()

Dim i As Integer
Dim x, pi As Double

Range("F5:H1032").Select
Selection.ClearContents
Range("J5:L1032").Select
Selection.ClearContents
Range("N5:P1032").Select
Selection.ClearContents

dx = Cells(3, 7)
pi = 3.141592
i = 5
n = Cells(2, 7)
Cells(5, 2) = "psi = sqrt(1/L)"
Cells(5, 3) = 0
Cells(5, 4) = 0 + dx * (n - 1)
L = Cells(5, 4)

Do While i - 6 < (L / dx)
     x = 0 + dx * (i - 5)
     n = i - 4
     Cells(i, 6) = x
     Cells(i, 7) = 1 / L
     Cells(i, 8) = Cells(i, 7) * dx
     Cells(i, 10) = i - 4
     Cells(i, 11) = (2 * Sqr(2)) * (Sin(n * pi / 2)) ^ 2 / (n * pi)
     Cells(i, 12) = Cells(i, 11) ^ 2
     i = i + 1
     Sheet1.Activate
     Loop
     
i = 5
Do While i - 6 < (L / dx)
     x = 0 + dx * (i - 5)
     Cells(i, 14) = wavepacket_real(x, 0, 0)
     Cells(i, 15) = wavepacket_imag(x, 0, 0)
     Cells(i, 16) = Cells(i, 14) ^ 2 + Cells(i, 15) ^ 2
     i = i + 1
     Sheet1.Activate
Loop


End Sub

Private Sub CommandButton7_Click()

Dim i As Integer
Dim x, pi As Double

Range("F5:H1032").Select
Selection.ClearContents
Range("J5:L1032").Select
Selection.ClearContents
Range("N5:P1032").Select
Selection.ClearContents

dx = Cells(3, 7)
pi = 3.141592
i = 5
n = Cells(2, 7)
Cells(5, 2) = "e^-|x-L/2|"
Cells(5, 3) = 0
Cells(5, 4) = 0 + dx * (n)
L = Cells(5, 4) + dx
a = Sqr(1 / (1 - Exp(-L)))

Do While i - 5 < (L / (2 * dx)) + 1
     x = 0 + dx * (i - 5)
     n = i - 4
     Cells(i, 6) = x
     Cells(i, 7) = Exp(2 * (x - L / 2))
     Cells(i, 8) = Cells(i, 7) * dx
     Cells(i, 10) = n
     b = (i - 4) * pi / L
     Cells(i, 11) = a * Sqr(2 / L) * (2 * (Sin(n * pi / 2)) + b * Exp(-L / 2) * (1 - Cos(n * pi))) / (1 + b ^ 2)
     Cells(i, 12) = Cells(i, 11) ^ 2
     i = i + 1
     Sheet1.Activate
     Loop
     
Do While i - 5 < (L / dx) + 1
     x = 0 + dx * (i - 5)
     Cells(i, 6) = x
     Cells(i, 7) = Exp(-2 * (x - L / 2))
     Cells(i, 8) = Cells(i, 7) * dx
     Cells(i, 10) = i - 4
     Cells(i, 11) = a * Sqr(2 / L) * (2 * (Sin(n * pi / 2)) + b * Exp(-L / 2) * (1 - Cos(n * pi))) / (1 + b ^ 2)
     Cells(i, 12) = Cells(i, 11) ^ 2
     i = i + 1
     Sheet1.Activate
     Loop
     
i = 5
Do While i - 6 < (L / dx)
     x = 0 + dx * (i - 5)
     Cells(i, 14) = wavepacket_real(x, 0, 1)
     Cells(i, 15) = wavepacket_imag(x, 0, 1)
     Cells(i, 16) = Cells(i, 14) ^ 2 + Cells(i, 15) ^ 2
     i = i + 1
     Sheet1.Activate
Loop

End Sub
Sub usinginputprint1()

Dim input1 As Integer
Dim input2, input3 As Integer

money_TF = 0
Do While money_TF = 0
input1 = Application.InputBox("배팅할 금액을 입력하세요(1~9999)")
If input1 <= Cells(12, 2) Then
money_TF = 1
Else
MsgBox "잔액이 부족합니다."
End If
Loop

pos_start_TF = 0
Do While pos_start_TF = 0
input2 = Application.InputBox("아래의 노란 그래프를 보고 고양이 있을 것 같은 범위의 시작값을 입력하세요(범위 크기: 2)")
If 0 <= input2 And input2 < 8.24 Then
pos_start_TF = 1
Else
pos_start_TF = 0
MsgBox "퍼텐셜 우물의 범위를 벗어납니다."
End If
Loop

Cells(15, 2) = input1
Cells(17, 1) = "위치 배팅 범위"
Cells(16, 2) = "시작"
Cells(16, 3) = "끝"
Cells(17, 2) = input2
Cells(17, 3) = input2 + 2


End Sub
Sub usingprint2()

Dim input1 As Integer
Dim input2, input3 As Integer

money_TF = 0

Do While money_TF = 0
input1 = Application.InputBox("베팅할 금액을 입력하세요(1~9999)")
If input1 <= Cells(12, 2) Then
money_TF = 1
Else
MsgBox "잔액이 부족합니다."
End If
Loop
num_data = Cells(2, 7)
energy_start_TF = 0
Do While energy_start_TF = 0
input2 = Application.InputBox("아래의 확률분포를 보고 고양이가 가질 에너지 상태 배팅값을 정수로 입력하세요(n = 1 ~" & num_data & ")")
If 1 <= input2 <= 1024 Then
energy_start_TF = 1
Else
energy_start_TF = 0
MsgBox "에너지 상태를 n = 1~" & num_data & "까지만 생각합니다."
End If
Loop

Cells(15, 2) = input1
Cells(17, 1) = "에너지 상태 배팅값(n)"
Cells(16, 2) = "값"
Cells(16, 3) = " "
Cells(17, 2) = input2
Cells(17, 3) = " "

End Sub

Private Sub CommandButton3_Click()

p = vbNo
Do While p = vbNo
usingprint2
Money = Cells(15, 2)
energyval = Cells(17, 2)

'입력 값으로부터 배당 구하기
i = 5
Do While Cells(i, 10) < energyval
i = i + 1
Loop

Pb = Cells(i, 12)

baedang = Int(1 / Pb)
Cells(13, 2) = baedang
Pb = Round(Pb, 6) * 100
MsgBox "베팅 금액은" & Money & "이고, 에너지 상태 배팅값은 n=" & energyval & "이며, 이 값의 확률 " & Pb & " %로부터 산출된 배당은" & baedang & " 입니다."
p = MsgBox("전자질량 고양이의 에너지를 확인하시려면 예를, 베팅 금액과 값을 다시 조정하려면 아니오를 눌러주세요.", vbYesNo)

Loop

findcat_energy

End Sub
Private Sub CommandButton4_Click()

p = vbNo
Do While p = vbNo
usinginputprint1
Money = Cells(15, 2)
Startval = Cells(17, 2)
endval = Cells(17, 3)

'입력 범위로부터 배당 구하기
i = 5
Do While Cells(i, 6) < Startval
i = i + 1
Loop

sum_b = 0
Do While Cells(i, 6) <= endval
sum_b = sum_b + Cells(i, 20) * 0.01
i = i + 1
Loop

baedang = Int(1 / sum_b)
Cells(13, 2) = baedang
sum_b = 100 * Round(sum_b, 6)
MsgBox "베팅 금액은" & Money & "이고, 위치 범위는(" & Startval & "," & endval & ")이며, 이 범위에서의 확률 " & sum_b & "%로부터 산출된 배당은" & baedang & " 입니다."
p = MsgBox("전자질량 고양이의 위치를 찾으시려면 예를, 베팅 금액과 범위를 다시 조정하려면 아니오를 눌러주세요.", vbYesNo)

Loop

findcat

End Sub
Function prob_distrib_nansoo(n)
Dim randomnumber As Double
randomnumber = Rnd() '유효숫자 14자리이므로 매우 작은 수 1,2개를 제외한 나머지 숫자에 대해서는 제대로 계산 가능
s0 = 0
s = 0
i = 1

If n = 0 Then
Do While (randomnumber - s) > 0
s0 = s
s = s + Cells(i + 4, 20) * 0.01
If (randomnumber - s0) > (randomnumber - s) Then
res = i + 4
Else
res = i + 5
End If
i = i + 1
Loop

Else
Do While (randomnumber - s) > 0
s0 = s
s = s + Cells(i + 4, 12)
If (randomnumber - s0) > (randomnumber - s) Then
res = i + 4
Else
res = i + 5
End If
i = i + 1
Loop

End If

prob_distrib_nansoo = res

End Function

Sub findcat_energy()

e_val = Cells(17, 2)

cat_energy_index = prob_distrib_nansoo(1)
Cells(11, 1) = "에너지 측정값/확률"
Cells(9, 2) = "위치 or n"
Cells(9, 3) = "확률 or 확률밀도"
Cells(11, 2) = Cells(cat_energy_index, 10)
Cells(11, 3) = Cells(cat_energy_index, 12)

If e_val = Cells(11, 2) Then
MsgBox ("고양이의 에너지를 예측했습니다.")
Cells(12, 2) = Cells(12, 2) + Cells(15, 2) * Cells(13, 2)
Else
MsgBox ("고양이의 에너지를 예측하지 못했습니다.")
Cells(12, 2) = Cells(12, 2) - Cells(15, 2)
End If

If Cells(12, 2) <= 0 Then
Sheets("End").Select
End If

End Sub
Sub findcat()

dx = Cells(3, 7)
init = Cells(17, 2)
last = Cells(17, 3)

cat_pos_index = prob_distrib_nansoo(0)
Cells(10, 1) = "위치 측정값/확률"
Cells(9, 2) = "위치 or n"
Cells(9, 3) = "확률 or 확률밀도"
Cells(10, 2) = Cells(cat_pos_index, 6)
Cells(10, 3) = Cells(cat_pos_index, 20) * dx

If Cells(10, 2) > init And Cells(10, 2) < last Then
MsgBox ("고양이가 원하는 범위 안에 있습니다.")
Cells(12, 2) = Cells(12, 2) + Cells(15, 2) * Cells(13, 2)
Else
MsgBox ("고양이가 지정한 범위 안에 없습니다.")
Cells(12, 2) = Cells(12, 2) - Cells(15, 2)
End If

If Cells(12, 2) <= 0 Then
Sheets("End").Select
End If

End Sub

Private Sub CommandButton5_Click()

t = Application.InputBox("몇 초 후의 파동함수를 택할지 정하시오.")
Range("R5:T4100").Select
Selection.ClearContents
L = Cells(5, 4)
i = 5
dx = Cells(3, 7)
Cells(14, 2) = t

If Cells(5, 2) = "step function" Then
n = 1
Else
n = 0
End If

Do While i - 6 < (L / dx)
     x = 0 + dx * (i - 5)
     Cells(i, 18) = wavepacket_real(x, t, n)
     Cells(i, 19) = wavepacket_imag(x, t, n)
     Cells(i, 20) = Cells(i, 18) ^ 2 + Cells(i, 19) ^ 2
     i = i + 1
     Sheet1.Activate
     Loop


End Sub

Function wavepacket_real(x, t, b)

n = 1
pi = 3.141592
L = (Cells(2, 7) - 1) * Cells(3, 7)
a = t * pi * pi * 66.26 / (2 * 9.109 * L * L) '플랑크 상수와 전자 질량 이용
n_max = Cells(2, 7)
s = 0
If b = 0 Then
Do While n < n_max + 1
w = n * n * a
psi = Sqr(2 / L) * Cells(n + 4, 11) * Sin(n * pi * x / L) * Cos(w)
s = s + psi
n = n + 1
Loop

Else
Do While n < n_max + 2
w = n * n * a
psi = Sqr(2 / L) * Cells(n + 4, 11) * Sin(n * pi * x / L) * Cos(w)
s = s + psi
n = n + 1
Loop
End If

wavepacket_real = s

End Function
Function wavepacket_imag(x, t, b) 'b는 step function을 구현하기 위해 사용.

n = 1
pi = 3.141592
L = (Cells(2, 7) - 1) * Cells(3, 7)
a = t * pi * pi * 66.26 / (2 * 9.109 * L * L)
n_max = Cells(2, 7)
s = 0

If b = 0 Then
Do While n < n_max + 1
w = n * n * a
psi = -Sqr(2 / L) * Cells(n + 4, 11) * Sin(n * pi * x / L) * Sin(w)
s = s + psi
n = n + 1
Loop
Else
Do While n < n_max + 2
w = n * n * a
psi = -Sqr(2 / L) * Cells(n + 4, 11) * Sin(n * pi * x / L) * Sin(w)
s = s + psi
n = n + 1
Loop
End If

wavepacket_imag = s

End Function

