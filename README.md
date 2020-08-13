# tests manu/
docker build -t demo --rm .
docker run --name demo --rm -p 6080:80 demo
