FROM squidfunk/mkdocs-material AS builder

WORKDIR /docs
COPY . .
RUN mkdocs build


FROM nginx:alpine

COPY --from=builder /docs/site /usr/share/nginx/html

