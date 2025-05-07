FROM alpine:3.19

# Install dependencies
RUN apk add --no-cache wget unzip

# Download and install PocketBase (using ZIP instead of tar.gz)
RUN wget -q https://github.com/pocketbase/pocketbase/releases/download/v0.22.4/pocketbase_0.22.4_linux_amd64.zip -O /tmp/pb.zip \
    && unzip -q /tmp/pb.zip -d /usr/local/bin/ \
    && rm /tmp/pb.zip \
    && chmod +x /usr/local/bin/pocketbase

# Set up persistent storage
VOLUME /pb_data

# Expose port
EXPOSE 8080

# Start command
CMD ["pocketbase", "serve", "--http=0.0.0.0:8080", "--dir=/pb_data"]
