Screen _NewImage(1920, 1080, 32)
_FullScreen
_Title ("ANIMATION")
Cls
l1 = _LoadImage("lock1.jpg")
locklabel:
For i = -1080 To 0 Step 5
    _PutImage (0, i), l1
    _Delay 0.0001
Next i
_PutImage (0, 0), l1
Sleep
l2 = _LoadImage("lock2.png")
For i = 0 To -1080 Step -5
    _PutImage (0, 1080 + i), l2
    _PutImage (0, i), l1
    _Delay 0.0001
Next i
x$ = InKey$
x$ = ""
psk$ = ""
status$ = "Enter password"
_PutImage (0, 0), l2
For i = 500 To 580
    Circle (720, i), 20
    Circle (1200, i), 20
    _Delay 0.01
Next i
E:
x$ = ""
_PutImage (0, 0), l2
For i = 800 To 1120
    Circle (i, 540), 40
Next i
For i = 500 To 580
    Circle (720, i), 20
    Circle (1200, i), 20
Next i
For i = 1 To 59
    Circle (960, 440), i
Next i
_PrintString (820, 520), status$
While x$ <> Chr$(13)
    star$ = ""
    For j = 1 To Len(psk$)
        star$ = star$ + "*"
    Next j
    _PrintString (820, 560), star$
    x$ = InKey$
    If x$ <> "" Then
        x = Asc(x$)
        If x >= 32 And x <= 126 Then
            psk$ = psk$ + x$
        ElseIf x = 8 Then
            psk$ = Left$(psk$, Len(psk$) - 1)
            GoTo E
        End If
    End If
Wend
midx = 1920 / 2
midy = 1080 / 2
r = 50
For i = 1 To 3
    _PutImage (0, 0), l2
    For rad = 0 To 6.3 Step 0.01
        x = midx + (r * Cos(rad))
        y = midy + (r * Sin(rad))
        Circle (x, y), 5
        _Delay 0.001
    Next rad
Next i
If psk$ <> "aditya1234" Then
    status$ = "Incorrect password. Try again"
    psk$ = ""
    star$ = ""
    GoTo E
End If
desktop:
l3 = _LoadImage("wall.png")
_PutImage (0, 0), l3
licon = _LoadImage("licon.png")
_PutImage (10, 10)-(50, 50), licon
exicon = _LoadImage("exiticon.png")
_PutImage (10, 70)-(50, 110), exicon
bashicon = _LoadImage("bash.png")
_PutImage (10, 130)-(50, 170), bashicon
While 1 = 1
    For i = 13 To 1907
        Circle (i, 1054), 12
    Next i
    _PrintString (1800, 1047), Time$
    _PrintString (20, 1047), "BASIC UI by Cryptane"
    Do While _MouseInput
        mx = _MouseX
        my = _MouseY
        mb = _MouseButton(1)
        If mb <> 0 Then
            If mx >= 10 And mx <= 50 And my >= 10 And my <= 50 Then
                GoTo locklabel
            ElseIf mx >= 10 And mx <= 50 And my >= 70 And my <= 110 Then
                GoTo exitlabel
            ElseIf mx >= 10 And mx <= 50 And my >= 130 And my <= 170 Then
                Shell _DontWait _Hide "ubuntu.bat"
                _PrintString (900, 400), "Starting Bash. Please wait."
                _Delay 10
                GoTo desktop
            End If
        End If
    Loop
Wend
exitlabel:
_PrintString (900, 400), "Goodbye. See you later."
_Delay 3
_ScreenHide
End
