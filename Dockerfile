FROM alpine:3.19

# Install dependencies
RUN apk add --no-cache wget unzip

# Download the LATEST PocketBase release (auto-detects version)
RUN RUN curl -sSL https://dist.pocketbase.io/pocketbase_0.22.5_linux_amd64.zip -o /tmp/pb.zip

# Persistent storage
VOLUME /pb_data

# Run
EXPOSE 8080
CMD ["pocketbase", "serve", "--http=0.0.0.0:8080", "--dir=/pb_data"]
