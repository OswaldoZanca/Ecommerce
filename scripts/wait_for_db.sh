#!/bin/sh

echo "Esperando a la base de datos en $POSTGRES_HOST:$POSTGRES_PORT..."

while ! nc -z $POSTGRES_HOST $POSTGRES_PORT; do
  sleep 1
done

echo "Base de datos lista. Continuando..."

exec "$@"
