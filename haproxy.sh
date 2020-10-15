DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker build -t haproxy "$DIR/"
docker run -p 80:80 -it haproxy