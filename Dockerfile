FROM alpine:3.7

LABEL maintainer="Sina Moghaddas <sina@moghaddas.com>"

RUN addgroup -S simog \
	&& adduser -D -S -s /sbin/nologin -G simog simou

CMD ["sh"]

