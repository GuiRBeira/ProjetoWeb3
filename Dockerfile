# Passo 1: Definir a imagem base
# Começamos com uma imagem oficial do Ruby. Usar uma versão específica
# (como a 3.3.1 que instalou) garante consistência.
# A versão 'alpine' é mais leve, ideal para demonstrações e produção.
FROM ruby:3.3.1-alpine

# Passo 2: Instalar dependências essenciais do sistema
# O ambiente 'alpine' é mínimo, então precisamos adicionar as ferramentas
# básicas de compilação que algumas 'gems' precisam para instalar.
RUN apk add --no-cache build-base

# Passo 3: Definir o diretório de trabalho dentro do container
# É aqui que o código da nossa aplicação vai ficar.
WORKDIR /myapp

# Passo 4: Copiar e instalar as dependências (gems)
# Este é um passo de otimização importante! Copiamos apenas o Gemfile primeiro.
# O Docker guarda os resultados de cada passo em cache. Se o Gemfile não mudar,
# o Docker reutiliza o cache deste passo, tornando os builds futuros muito mais rápidos.
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Passo 5: Copiar o resto do código da aplicação
# Agora que as dependências estão instaladas, copiamos o resto do nosso código.
COPY . .

# Passo 6: Expor a porta que o servidor Rails vai usar
# Informa ao Docker que o container vai escutar na porta 3000 internamente.
EXPOSE 3000

# Passo 7: Definir o comando para iniciar o servidor
# Este é o comando que será executado quando o container iniciar.
# O '-b 0.0.0.0' é crucial para que o servidor Rails seja acessível
# de fora do container.
CMD ["rails", "server", "-b", "0.0.0.0"]

