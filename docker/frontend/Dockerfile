FROM node:18-alpine3.15

ENV NODE_OPTIONS=--openssl-legacy-provider
ENV RECAPTCHA_SITE_KEY=""
ENV NUXT_HOST="0.0.0.0"
ENV NUXT_PORT=3000

RUN adduser -D faucet && npm install -g npm@8.10.0

USER faucet

COPY --chown=faucet:faucet ../frontend /app

WORKDIR /app

RUN npm install

EXPOSE 3000

CMD npm run build ; npm run start