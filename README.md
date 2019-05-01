# kubaer

```
docker run -it \
-v $(pwd):/home/ \
-e TZ=Asia/Kolkata \
openjdk:8-jdk-alpine \
sh

docker build --no-cache=true -t kubaer-api .

docker run -it -d --rm \
-v $(pwd):/home/ \
-e TZ=Asia/Kolkata \
kubaer-api \
bash
```
