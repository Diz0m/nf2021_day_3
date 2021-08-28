FROM alpine:latest
RUN mkdir /opt/web53
ADD config.yaml /opt/web53/config.yaml
ADD web-53 /opt/web53/web-53
EXPOSE 8080
WORKDIR /opt/web53
ENTRYPOINT ["./web-53"]
