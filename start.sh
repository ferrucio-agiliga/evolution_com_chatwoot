#!/bin/bash

function msg_ok () {
echo "OK - $1"
}

function msg_ko () {
echo "KO - $1"
exit 1
}

rm -r database && msg_ok 'excluir database'
rm -r evolution-api/evolution_instances && msg_ok 'evolution-api/evolution_instances'

mkdir database || msg_ko 'criar pasta database' && msg_ok 'criar pasta database'
mkdir database/chatwoot || msg_ko 'criar pasta database/chatwoot' && msg_ok 'criar pasta database/chatwoot'
mkdir database/chatwoot/postgres || msg_ko 'criar pasta database/chatwoot/postgres' && msg_ok 'criar pasta database/chatwoot/postgres'
mkdir database/chatwoot/postgressql || msg_ko 'criar pasta database/chatwoot/postgressql' && msg_ok 'criar pasta database/chatwoot/postgressql'
mkdir database/chatwoot/redis || msg_ko 'criar pasta database/chatwoot/redis' && msg_ok 'criar pasta database/chatwoot/redis'

mkdir database/evolution || msg_ko 'criar pasta database/evolution' && msg_ok 'criar pasta database/evolution'
mkdir database/evolution/postgres || msg_ko 'criar pasta database/evolution/postgres' && msg_ok 'criar pasta database/evolution/postgres'
mkdir database/evolution/postgressql || msg_ko 'criar pasta database/evolution/postgressql' && msg_ok 'criar pasta database/evolution/postgressql'
mkdir database/evolution/redis || msg_ko 'criar pasta database/evolution/redis' && msg_ok 'criar pasta database/evolution/redis'

docker-compose up -d || msg_ko 'subir o docker-compose' && msg_ok 'subir o docker-compose'
echo 'Aguardando 10 segundos para subir umas coisas...' && sleep 10
docker-compose run --rm rails bundle exec rails db:chatwoot_prepare || msg_ko 'executar preparação de banco do chatwoot' && msg_ok 'executar preparação de banco do chatwoot'