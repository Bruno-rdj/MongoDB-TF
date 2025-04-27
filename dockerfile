# Usa a imagem oficial do MongoDB como base
FROM mongo:latest

# Expõe a porta 27017 (porta padrão do MongoDB)
EXPOSE 27017

# Define que o processo vai rodar como o usuário "mongodb" (melhora a segurança)
USER mongodb

# Define o comando padrão para iniciar o MongoDB aceitando conexões de qualquer IP
CMD ["mongod", "--bind_ip", "0.0.0.0"]
