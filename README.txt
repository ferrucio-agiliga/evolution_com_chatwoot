+++ Integração da API evolution v2 com chatwoot +++
Evolution API v2: https://doc.evolution-api.com/v2/pt/get-started/introduction
Chatwoot: https://www.chatwoot.com/

+++ Requisitos windows +++
- WSL (Instância de alguma distro linux, alpine, ubuntu ou app Docker desktop)
- gitbash (Para rodar o script start.sh, acaso não queira rodá-lo, pode usar os comandos dentro dele manualmente por um terminal do windows)

+++ Requisitos linux +++
- Docker
!!! Está subindo redis, nginx, pgsql em containers, acaso não queira usar os containers, favor instalá-los na máquina e proceder com ajustes nas configurações dos arquivos .env

+++ Como iniciar +++
!!! Existem alguns .env na pasta principal que podem estar ocultos acaso suas configs de pasta do windows não permita itens ocultos.
!!! Lembre-se de modificar o conteúdo das váriaveis de ambiente SECRET_KEY_BASE e AUTHENTICATION_API_KEY quando for colocar em produção.

---
chmod +x start.sh
./start.sh
---

+++ Considerações finais +++
!!! Para criar a instância do chatwoot, será necessário, antes acessar o chatwoot, criar sua conta para obter o token do usuário...
!!! Ao acessar o manager da evolution-api, será solicitado uma key, a mesma é o conteúdo da varíavel AUTHENTICATION_API_KEY...

Dados acaso você usou apenas o start.sh e não modificou arquivos de configuração:
Evolution (http://localhost:8080/manager):
Key: b5e1a8c0-ae8d-4642-9666-6abe8e15723f

Chatwoot (http://localhost:8081/installation/onboarding):
 - Exemplo dados para criar usuário no chatwoot:
  ID: 2
  Token: W2gH4fbXRW1DxdpN19xMRJe5 (Esse token você obtém através das configurações do usuário)
  teste@teste.com
  $c1234T@

PgAdmin (http://localhost:8082/login?next=/):
user: demo@demo.com.br
pass: PgAdmin2021!
