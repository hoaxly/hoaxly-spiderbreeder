# Hoaxly development setup

## use portia

using the newest dev in docker requires us to build it ourselves.

from projectroot run

    fin build_portia
    fin build_pythonlibs

then you can run 

    fin init


http://hoaxly.docksal:9001

### Start a crawl with portia
```
docker exec hoaxly_portia_1  <PROJECT_PATH> [SPIDER] [OPTIONS]

docker exec hoaxly_portia_1 portiacrawl /app/data/projects/hoaxlyPortia
```

## use kibana
http://hoaxly.docksal:5601

default index: hoaxly
(uncheck contains timedata)