FROM node:22-alpine AS base-image
WORKDIR /app
RUN SOURCE_DATE_EPOCH=1720624524 apk add dumb-init
COPY version.txt .
RUN echo "hallo" > welcome.txt

FROM base-image
COPY script.sh .
COPY something.txt .
ENV NODE_ENV=production
ENV PORT=3000
USER node
ENTRYPOINT ["/usr/bin/dumb-init", "/app/script.sh"]
EXPOSE 3000