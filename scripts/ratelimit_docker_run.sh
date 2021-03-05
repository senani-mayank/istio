readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

ratelimit_config_local="${SCRIPT_DIR}/docker_ratelimit_config.yaml"
ratelimit_config_docker="/data/ratelimit/config"
env_file=ratelimit_docker.env
ports="-p 8081:8081 -p 8080:8080 -p 6370:6370"


docker network create ratelimit
docker container kill redis
docker container kill ratelimit-server 
docker run --name redis -d --network=ratelimit redis 

docker run --name ratelimit-server --network=ratelimit  ${ports} --mount type=bind,src=${ratelimit_config_local},dst=${ratelimit_config_docker} --env-file ${env_file} envoyproxy/ratelimit:master /bin/ratelimit