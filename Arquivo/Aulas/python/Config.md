# Primeiro devemos criar o ambiente virtual:

	# Windows
		python -m venv venv
  
# Após a criação do venv vamos ativa-lo:

    # Windows
		venv\Scripts\Activate
  
# Caso algum comando retorne um erro de permissão execute o código e tente novamente:

        Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
    
# Agora vamos fazer a instalação do Django e as demais bibliotecas:

        pip install django
        pip install pillow
        pip install bandas