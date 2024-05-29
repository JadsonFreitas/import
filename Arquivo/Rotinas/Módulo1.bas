Attribute VB_Name = "M�dulo1"
Sub SubstituirCodigosEPontosEExcluirLinhasEFilterContratacaoCDC()
    Dim ws As Worksheet
    Dim ultimaLinha As Long
    Dim dataUltimoDia As Date
    Dim i As Long
    Dim cel As Range
    Dim rng As Range
    Dim wsRange As Range
    Dim filterRange As Range

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

    ' Filtra a coluna "O" para mostrar somente "Contrata��o CDC" e exclui todas as outras correspond�ncias
    If ws.AutoFilterMode Then ws.AutoFilterMode = False ' Remove filtro anterior, se houver
    ws.Rows(1).AutoFilter ' Adiciona filtro autom�tico
    Set wsRange = ws.Range("A1:O" & ws.Cells(ws.Rows.Count, "O").End(xlUp).Row)
    wsRange.AutoFilter Field:=15, Criteria1:="<>*Contrata��o CDC*"
    Set filterRange = wsRange.Offset(1, 0).Resize(wsRange.Rows.Count - 1, wsRange.Columns.Count).SpecialCells(xlCellTypeVisible)
    If Not filterRange Is Nothing Then
        filterRange.EntireRow.Delete
    End If

    ' Remover o filtro aplicado
    If ws.AutoFilterMode Then ws.AutoFilterMode = False

    ' Encontrar a �ltima linha com dados na coluna B
    ultimaLinha = ws.Cells(ws.Rows.Count, "B").End(xlUp).Row

    ' Aplica a ordena��o crescente na coluna B
    ws.Range("A1:O" & ultimaLinha).Sort Key1:=ws.Range("B1"), Order1:=xlAscending, Header:=xlYes

    ' Obter a data do �ltimo dia na coluna B
    ultimaLinha = ws.Cells(ws.Rows.Count, "B").End(xlUp).Row
    dataUltimoDia = ws.Cells(ultimaLinha, "B").Value

    ' Loop para excluir linhas que n�o correspondem � data do �ltimo dia na coluna B
    For i = ultimaLinha - 1 To 2 Step -1 ' Come�a da pen�ltima linha at� a segunda linha
        If Not IsDate(ws.Cells(i, "B").Value) Or ws.Cells(i, "B").Value <> dataUltimoDia Then
            ws.Rows(i).EntireRow.Delete
        End If
    Next i

    MsgBox "Substitui��es, exclus�es e filtro conclu�dos!", vbInformation
End Sub

