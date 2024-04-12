Attribute VB_Name = "M�dulo1"
Sub SubstituirCodigosEPontosEExcluirLinhas()
    Dim ws As Worksheet
    Dim ultimaLinha As Long
    Dim dataUltimoDia As Date
    Dim i As Long
    Dim cel As Range
    Dim col As Range
    Dim rng As Range

    ' Defina a planilha onde est�o os dados
    Set ws = ThisWorkbook.Sheets("novoarquivo-win")

    ' Loop para substituir os c�digos na coluna C
    For Each cel In ws.Range("C1:C" & ws.Cells(ws.Rows.Count, "C").End(xlUp).Row)
        ' Verifique se o valor da c�lula � um dos c�digos
        If cel.Value = "67406" Then
            cel.Value = "3R PROMOTORA"
        ElseIf cel.Value = "69075" Then
            cel.Value = "FICASA"
        ElseIf cel.Value = "12198" Then
            cel.Value = "INVEST"
        ElseIf cel.Value = "13701" Then
            cel.Value = "NOVA PROMOTORA"
        End If
    Next cel

    ' Encontrar a �ltima linha com dados na coluna J
    ultimaLinha = ws.Cells(ws.Rows.Count, "J").End(xlUp).Row

    ' Define a faixa de c�lulas nas colunas J, K e P
    Set rng = ws.Range("J1:K" & ultimaLinha & ", P1:P" & ultimaLinha)

    ' Substitui pontos por v�rgulas na faixa de c�lulas
    rng.Replace What:=".", Replacement:=",", LookAt:=xlPart, _
                SearchOrder:=xlByRows, MatchCase:=False, _
                SearchFormat:=False, ReplaceFormat:=False

    ' Encontrar a �ltima linha com dados na coluna B
    ultimaLinha = ws.Cells(ws.Rows.Count, "B").End(xlUp).Row

    ' Obter a data do �ltimo dia na coluna B
    dataUltimoDia = ws.Cells(ultimaLinha, "B").Value

    ' Loop para excluir linhas que n�o correspondem � data do �ltimo dia na coluna B
    For i = ultimaLinha - 1 To 2 Step -1 ' Come�a da pen�ltima linha at� a segunda linha
        If Not IsDate(ws.Cells(i, "B").Value) Or ws.Cells(i, "B").Value <> dataUltimoDia Then
            ws.Rows(i).EntireRow.Delete
        End If
    Next i

    MsgBox "Substitui��es e exclus�es conclu�das!", vbInformation
End Sub


