FROM obada/fullcore:develop as bin-cli

FROM ghcr.io/tendermint/faucet

ENV CLI_NAME=/home/faucet/fullcored
ENV NODE="node.alpha.obada.io:26656"
ENV PORT=8000
ENV DENOMS=aobd

RUN adduser -D faucet

USER faucet

COPY --from=bin-cli /home/obada/fullcored /home/faucet