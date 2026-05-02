FROM python:3.12-slim

# Instalar dependências para o Pillow e Flask
RUN apt-get update && apt-get install -y \
    gcc \
    libjpeg-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copia tudo para dentro do container
COPY . .

# Instala as dependências no Python global para evitar erro de venv
RUN pip install --no-cache-dir -r backend/requirements.txt

# Porta que o app.py usa no código do Mike
EXPOSE 19000

# Comando direto para a pasta backend onde está o seu app.py
CMD ["python", "backend/app.py"]
