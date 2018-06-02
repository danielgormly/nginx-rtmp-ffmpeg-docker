docker stop rtmp-live
docker rm rtmp-live
docker build -t rtmp-live .
docker run -d -p 1935:1935 -p 80:80 --name rtmp-live rtmp-live