# Replace your RTMP endpoints here.
# You may optionally include $name in your RTMP url, such as 'rtmp://localhost:1935/stream/$name'
# '$name' in nginx.conf will be automatically set to the key that is entered in OBS streaming settings
export VIDEO_ENDPOINT=''
export AUDIO_ENDPOINT=''
envsubst '${VIDEO_ENDPOINT} ${AUDIO_ENDPOINT}' < /opt/nginx/nginx.conf.template > /opt/nginx/nginx.conf