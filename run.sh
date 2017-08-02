set -eux
xhost +
docker build --build-arg USER_ID="$(id -u)" --tag=google-android-studio .
docker run \
    -ti \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=":0" \
    -e XAUTHORITY=/.Xauthority \
    -v ~/.Xauthority:/.Xauthority:ro \
    -v ~/:/home/android:rw \
    --name google-android-studio \
    google-android-studio
