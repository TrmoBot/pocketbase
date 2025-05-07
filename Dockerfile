FROM alpine:3.19

RUN apk add --no-cache wget unzip

# Use v0.22.3 (confirmed working as of June 2025)
RUN wget -q https://github.com/pocketbase/pocketbase/releases/download/v0.22.3/pocketbase_0.22.3_linux_amd64.zip -O /tmp/pb.zip \
    && unzip /tmp/pb.zip -d /usr/local/bin/ \
    && chmod +x /usr/local/bin/pocketbase \
    && rm /tmp/pb.zip

VOLUME /pb_data
EXPOSE 8080
CMD ["pocketbase", "serve", "--http=0.0.0.0:8080", "--dir=/pb_data"]
