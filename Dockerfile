FROM alpine:3.3
RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk -U upgrade && \
    apk -U add py-pip build-base python-dev py-numpy@testing ca-certificates && \
    rm -rf /var/cache/apk/* && \
    update-ca-certificates
RUN pip install --upgrade spacy-thrift
RUN python -m spacy.en.download
EXPOSE 9090
ENTRYPOINT ["python", "-m", "spacyThrift.service"]
