docker build -t ks -f docker/Dockerfile .

docker network create ks

docker run -d --rm \
      --name db \
      --network ks \
      --env POSTGRES_USER=app \
      --env POSTGRES_PASSWORD=pass \
      postgres:10.13-alpine

    docker run --rm -it \
    --name app \
    --network ks \
    --env RACK_ENV=development \
    --env DATABASE_URL=postgres://app:pass@db:5432/kittens_store_dev
    ks /docker/run-app.sh