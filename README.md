# docker-dns
This will be a first attempt at using containers and testing deployment of DNS on a larger scale.


# How to run
As of right now, please use the below code to run this container.
docker run -ti --cap-add SYS_ADMIN drewstillman/docker-dns

Use this command to SSH in
docker exec -it <container name> /bin/bash
