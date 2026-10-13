#!/usr/bin/env bash
set -e

pip install -r requirements.txt ipykernel
sudo apt-get update -qq && sudo apt-get install -y -qq default-mysql-client

# Os notebooks usam load_dotenv(override=True), então o .env manda.
# Se ainda não existir, cria um apontando pro MySQL local (preencha os IAG_* à mão).
if [ ! -f .env ]; then
  cat > .env <<'ENV'
IAG_SERVER_URL=
IAG_SUBJECT=
IAG_OFFERING=
IAG_TOKEN=

MD_DB_SERVER=127.0.0.1
MD_DB_PORT=3306
MD_DB_USERNAME=root
MD_DB_PASSWORD=megadados
ENV
fi
