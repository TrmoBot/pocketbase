FROM alpine:3.19

# Install dependencies
RUN apk add --no-cache wget unzip

# Download the LATEST PocketBase release (auto-detects version)
RUN wget -q $(wget -qO- https://api.github.com/repos/pocketbase/pocketbase/releases/latest | grep -o "https://.*linux_amd64.zip") -O /tmp/pb.zip \
    && unzip /tmp/pb.zip -d /usr/local/bin/ \
    && chmod +x /usr/local/bin/pocketbase \
    && rm /tmp/pb.zip

# Persistent storage
VOLUME /pb_data

# Run
EXPOSE 8080
CMD ["pocketbase", "serve", "--http=0.0.0.0:8080", "--dir=/pb_data"]
