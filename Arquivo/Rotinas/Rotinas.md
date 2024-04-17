# Rotinas

## Atualizar 

1. **Abrir o CMD na pasta:**
    `cd C:\Users\Administrador\OneDrive - Signa Brasil\Documentos\apiAutomatizacao\apiAutomatizacao`. 
<br/>

2. **Executar o seguinte comando no CMD** 
`node executar.js`.  
   Este comando irá baixar os arquivos para serem atualizados no banco de dados dos seguintes parceiros:
   - 3R PROMOTORA
   - FICASA
   - INVEST
   - NOVA PROMOTORA
   <br>

    Serão baixados 2 arquivos de cada um desses parceiros: um `.RET` e outro `.CSV`.  
<br/>

3. **Realizar as seguintes alterações nos arquivos:**  

   - Renomear o arquivo `.RET` para `.TXT`.
   - Alterar a codificação do arquivo CSV para UTF-8.
<br/>
1

4. **Fazer o upload:**
   Após as alterações nos arquivos, faça o upload deles no seguinte link: [https://www.signabrasil.com.br/importarbd](https://www.signabrasil.com.br/importarbd).
<br/>

5. **Executar App Comissões:**
   Após o upload, execute o arquivo "Comissões" na área de trabalho do servidor.

   Ele irá atualizar as comissões no banco de dados com os arquivos que acabaram de serem enviados.


## Consórcio diario Atualizar Access

    67406: 3R PROMOTORA
    69075: FICASA
    12198: INVEST
    13701: NOVA PROMOTORA

https://www.parceirosbbconsorcios.com.br

1. Consócio Geral
 colocar no campo periodo de venda o ultimo dia util. 
<br/>

2. Relatorial Gerecial
colocar no campo periodo de venda des do inicio do ano
<br/>

3. AcompDoc
colocar no campo periodo de venda des do inicio de 2018
<br/>

4. 


## Adiantamento de bônus



copy *.csv novoarquivo-win.csv


1 - Diárias
	
	A - Alimentar o banco de dados (8:00 e 8:30)
		1 - Rodar scraping
		2 - Formatar os arquivos
		3 - Importar no bacoffice
		4 - Atualizar comissões

	B - Atulizar Power BI ( 8:30 )
		1 Atualizar e publicar power BI

	C - Enviar validações diárias PARÁ ( 9:00 )
		1 - Gerar arquivo de comissões no backoffice
			financeiro > relatório de comissões > seleciona a data > exporta para o excel > Filtrar Maria aparecida e montar na planilha para envio até coluna R
	 	2 - Enviar por e-mail

	D - Adiantamento e bonus ( 9:30 )
		1 - Atualizar arquivos de adiantamento e bonus

	E - Comissões diárias ( 10:00)
		1 - Montar comissões diárias Para, Amapá e Tocantins.


2 - Semanais 

   A - Comissões semanais (começar na segunda)