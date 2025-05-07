FROM alpine:3.19

# Install dependencies quietly
RUN apk add --no-cache wget unzip

# Download using the official PocketBase CDN (more reliable than GitHub)
RUN wget -q https://dist.pocketbase.io/pocketbase_0.22.5_linux_amd64.zip -O /tmp/pb.zip \
    && unzip -q /tmp/pb.zip -d /usr/local/bin/ \
    && chmod +x /usr/local/bin/pocketbase \
    && rm /tmp/pb.zip

# Persistent storage
VOLUME /pb_data

# Run
EXPOSE 8080
CMD ["pocketbase", "serve", "--http=0.0.0.0:8080", "--dir=/pb_data"]
