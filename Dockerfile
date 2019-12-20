FROM alpine:3.11

RUN apk update && \
    apk add ca-certificates curl

COPY notify.sh /notify.sh
RUN chmod a+x /notify.sh

CMD ["/notify.sh"]