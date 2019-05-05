# kubaer

```
docker run -it \
-v $(pwd):/home/ \
-e TZ=Asia/Kolkata \
openjdk:8-jdk-alpine \
sh

docker build --no-cache=true -t kubaer-api .

docker run -it --rm \
-v $(pwd):/home/ \
-e TZ=Asia/Kolkata \
-p 18990:8080 \
--add-host="dockerhost:172.17.0.1" \
kubaer-api \
bash
```
