FROM alpine:3.19

# Install dependencies
RUN apk add --no-cache wget tar

# Download and install PocketBase
RUN wget -qO- https://github.com/pocketbase/pocketbase/releases/download/v0.22.4/pocketbase_0.22.4_linux_amd64.tar.gz | tar xz -C /usr/local/bin/

# Set up persistent storage
VOLUME /pb_data

# Expose port
EXPOSE 8080

# Start command
CMD ["pocketbase", "serve", "--http=0.0.0.0:8080", "--dir=/pb_data"]
