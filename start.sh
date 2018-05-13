# postgresの設定
# 起動待ち
until `psql -h kong-database -U postgres -c '\q'`; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"

kong migrations up
kong start
