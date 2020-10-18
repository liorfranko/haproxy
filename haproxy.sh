DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $DIR
docker build -t haproxy "$DIR/"
docker run -v "$DIR/config:/config/" -p 80:80 -it haproxy