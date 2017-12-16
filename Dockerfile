FROM python:3.6-alpine3.6

# RUN apk -U upgrade

RUN apk add --no-cache build-base python3-dev

# RUN apk add --no-cache python3 build-base python3-dev ca-certificates openssl && \
#    update-ca-certificates && \
#    python3 -m ensurepip && \
#    rm -r /usr/lib/python*/ensurepip && \
#    pip3 install --upgrade pip setuptools && \
#    rm -r /root/.cache
#
#RUN ln -s /usr/include/locale.h /usr/include/xlocale.h && \
#    pip3 install --upgrade numpy

RUN pip3 install --upgrade "spacy-thrift==0.4.0"

RUN python3 -m spacy download en

EXPOSE 9090

ENTRYPOINT ["python3", "-m", "spacyThrift.service"]
