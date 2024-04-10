import pandas as pd
import os

# Pasta onde estão as planilhas
pasta = r'C:\Users\Suporte\Desktop\Nova_pasta'

# Lista para armazenar os DataFrames de cada planilha
dataframes = []

# Listar todos os arquivos na pasta
arquivos = os.listdir(pasta)

# Iterar sobre os arquivos e ler apenas os arquivos CSV
for arquivo in arquivos:
    if arquivo.endswith('.csv'):
        caminho_arquivo = os.path.join(pasta, arquivo)
        df = pd.read_csv(caminho_arquivo, encoding='UTF-8')  # ou 'cp1252' para Windows
        dataframes.append(df)

# Concatenar todos os DataFrames em um único DataFrame
df_combined = pd.concat(dataframes)

# Resetar os índices para o novo DataFrame combinado
df_combined = df_combined.reset_index(drop=True)

# Salvar o DataFrame combinado em um novo arquivo CSV
caminho_planilha_combinada = r'C:\Users\Suporte\Desktop\Nova_pasta\planilha_combinada.csv'
df_combined.to_csv(caminho_planilha_combinada, index=False)

# Exibir o DataFrame combinado
print(df_combined)
