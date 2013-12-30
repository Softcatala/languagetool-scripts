#!/bin/bash

java -server -Dsun.net.httpserver.maxReqTime=10 -Dsun.net.httpserver.maxRspTime=10 -Xmx1024M -cp languagetool-server.jar org.languagetool.server.HTTPServer --public >> /tmp/lt.log 2>&1 &

