FROM openjdk:28-ea-19-jdk

WORKDIR /home/ubuntu/jenkins
RUN microdnf install git
COPY ./agent/agent.jar /home/ubuntu/jenkins

COPY ./scripts/start-agent1.sh /home/ubuntu/jenkins

RUN chmod +x /home/ubuntu/jenkins/start-agent1.sh

ENTRYPOINT ["./start-agent1.sh"]