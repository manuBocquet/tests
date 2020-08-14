# tests manu/
docker build -t demo --rm .

docker run --name demo --rm -p 6080:80 demo

docker-compose run -d --rm --service-ports demo

docker-compose up -d demo
