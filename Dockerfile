# Stage 1: Construção do conteúdo estático (Builder)
FROM alpine:3.21.3 AS builder

# Cria o diretório de trabalho
WORKDIR /app

# Cria o arquivo HTML com a mensagem
RUN echo '<!DOCTYPE html><html><head><title>Pod Status</title></head><body><h1>Seu pod está no ar!</h1></body></html>' > index.html

# Stage 2: Configuração do Nginx
FROM nginx:alpine

# Copia o arquivo HTML do estágio builder para o diretório padrão do Nginx
COPY --from=builder /app/index.html /usr/share/nginx/html/index.html

# Expõe a porta 80
EXPOSE 80

# Comando padrão para iniciar o Nginx
CMD ["nginx", "-g", "daemon off;"]