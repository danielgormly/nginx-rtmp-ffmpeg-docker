# nginx-rtmp-ffmpeg-docker

Based on [Tiangolo's nginx-rtmp-module Docker image](https://github.com/tiangolo/nginx-rtmp-docker/) that uses Nginx and Arut's nginx-rtmp-module. 2 routes setup, one injests RTMP vid and converts to HLS on the fly. The other simply proxies an RTMP stream.

### Dockerfile composition
- From buildpacks-dep:stretch (Debian Stretch with build tools)
- Nginx 1.13.8 (Pulled from nginx.org during build)
- [Arut's nginx-rtmp-module 1.2.1](https://github.com/arut/nginx-rtmp-module) (Pulled from Github release during build)
- FFMPEG (Built from http://www.deb-multimedia.org)

### Run
`docker build -t rtmp-live .`
`docker run -d -p 1935:1935 --name rtmp-live rtmp-live`
`docker stop rtmp-live`

### Endpoints
RTMP proxy: `rtmp://localhost/live/key`
RTMP to HLS injestion: `rtmp://localhost/hls/key`
HLS output: `http://localhost/hls`

### Test with VLC

- `alias vlc=/Applications/VLC.app/Contents/MacOS/VLC`
- `rtmpdump -v -r rtmp://13.236.178.121/live/test | vlc -`

### Resources

- https://github.com/Palakis/obs-websocket OBS-Websocket add-on
- https://github.com/haganbmj/obs-websocket-js JS Client
- https://github.com/t2t2/obs-tablet-remote Vue front-end
- https://www.deb-multimedia.org/ Installation of FFMPEG on Debian
