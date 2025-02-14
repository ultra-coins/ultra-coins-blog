FROM ghcr.io/getzola/zola:v0.17.1 as builder

LABEL version="0.0.1"
LABEL descripttion="Ultra-Coins Blog"
LABEL maintainer="Ultra-Coins"

COPY . /project
WORKDIR /project
RUN ["zola", "build"]

FROM nginx:1.25.3
COPY --from=builder /project/public /usr/share/nginx/html
EXPOSE 80
