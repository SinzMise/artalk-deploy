FROM artalk/artalk-go

WORKDIR /

COPY ./data /data

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 23366

CMD ["server", "-c", "/data/artalk.yml"]
