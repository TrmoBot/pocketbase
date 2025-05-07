# Base image (lightweight Linux)
FROM alpine:latest

# Install required tools
RUN apk add --no-cache wget unzip

# Download and extract PocketBase
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.22.4/pocketbase_0.22.4_linux_amd64.zip -O pb.zip \
    && unzip -o pb.zip \
    && chmod +x /pocketbase \
    && rm pb.zip

# Expose the network port
EXPOSE 8080

# Run command when container starts
CMD ["/pocketbase", "serve", "--http=0.0.0.0:8080"]
