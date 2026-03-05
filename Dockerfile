# Dockerfile
FROM debian:13-slim

LABEL maintainer="Frank Moeller <moellerf@gmx.net>"
LABEL description="Postfix SMTP Server"
LABEL version="1.0.5"

# environment
ENV DEBIAN_FRONTEND=noninteractive

# package installation
RUN apt-get update && apt-get install -y \
    ca-certificates \
    postfix \
    && rm -rf /var/lib/apt/lists/*

# copy configs
COPY postfix.sh /

# set permissions
RUN chmod +x /postfix.sh

# entrypoint
CMD ["/postfix.sh"]
