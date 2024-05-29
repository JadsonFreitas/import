Attribute VB_Name = "Módulo1"
Sub SubstituirCodigosEPontosEExcluirLinhasEFilterContratacaoCDC()
    Dim ws As Worksheet
    Dim ultimaLinha As Long
    Dim dataUltimoDia As Date
    Dim i As Long
    Dim cel As Range
    Dim rng As Range
    Dim wsRange As Range
    Dim filterRange As Range

    ' Defina a planilha onde estão os dados
    Set ws = ThisWorkbook.Sheets("novoarquivo-win")

    ' Loop para substituir os códigos na coluna C
    For Each cel In ws.Range("C1:C" & ws.Cells(ws.Rows.Count, "C").End(xlUp).Row)
        ' Verifique se o valor da célula é um dos códigos
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

    ' Encontrar a última linha com dados na coluna J
    ultimaLinha = ws.Cells(ws.Rows.Count, "J").End(xlUp).Row

    ' Define a faixa de células nas colunas J, K e P
    Set rng = ws.Range("J1:K" & ultimaLinha & ", P1:P" & ultimaLinha)

    ' Substitui pontos por vírgulas na faixa de células
    rng.Replace What:=".", Replacement:=",", LookAt:=xlPart, _
                SearchOrder:=xlByRows, MatchCase:=False, _
                SearchFormat:=False, ReplaceFormat:=False

    ' Filtra a coluna "O" para mostrar somente "Contratação CDC" e exclui todas as outras correspondências
    If ws.AutoFilterMode Then ws.AutoFilterMode = False ' Remove filtro anterior, se houver
    ws.Rows(1).AutoFilter ' Adiciona filtro automático
    Set wsRange = ws.Range("A1:O" & ws.Cells(ws.Rows.Count, "O").End(xlUp).Row)
    wsRange.AutoFilter Field:=15, Criteria1:="<>*Contratação CDC*"
    Set filterRange = wsRange.Offset(1, 0).Resize(wsRange.Rows.Count - 1, wsRange.Columns.Count).SpecialCells(xlCellTypeVisible)
    If Not filterRange Is Nothing Then
        filterRange.EntireRow.Delete
    End If

    ' Remover o filtro aplicado
    If ws.AutoFilterMode Then ws.AutoFilterMode = False

    ' Encontrar a última linha com dados na coluna B
    ultimaLinha = ws.Cells(ws.Rows.Count, "B").End(xlUp).Row

    ' Aplica a ordenação crescente na coluna B
    ws.Range("A1:O" & ultimaLinha).Sort Key1:=ws.Range("B1"), Order1:=xlAscending, Header:=xlYes

    ' Obter a data do último dia na coluna B
    ultimaLinha = ws.Cells(ws.Rows.Count, "B").End(xlUp).Row
    dataUltimoDia = ws.Cells(ultimaLinha, "B").Value

    ' Loop para excluir linhas que não correspondem à data do último dia na coluna B
    For i = ultimaLinha - 1 To 2 Step -1 ' Começa da penúltima linha até a segunda linha
        If Not IsDate(ws.Cells(i, "B").Value) Or ws.Cells(i, "B").Value <> dataUltimoDia Then
            ws.Rows(i).EntireRow.Delete
        End If
    Next i

    MsgBox "Substituições, exclusões e filtro concluídos!", vbInformation
End Sub

