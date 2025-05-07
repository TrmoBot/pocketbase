FROM alpine:3.19

# Install dependencies
RUN apk add --no-cache \
    wget \
    unzip \
    ca-certificates

# Download and install PocketBase (using direct tar
