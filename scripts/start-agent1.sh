#!/bin/sh
java -jar agent.jar -url http://172.17.0.2:8080/ -secret $AGENT_SECRET -name "agent-1" -webSocket -workDir "/home/ubuntu/jenkins"
