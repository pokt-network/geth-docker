FROM ethereum/client-go

EXPOSE 8546
EXPOSE 8545

ENV GETH_ALLOW_EXTERNAL_DOMAIN ${GETH_ALLOW_EXTERNAL_DOMAIN}
ENV GETH_ENVIRONMENT  ${GETH_ENVIRONMENT}

COPY entrypoint.sh .
COPY cmd.sh .

RUN apk update && apk upgrade && apk add bash

ENTRYPOINT ["geth"]

# Beware this node it's open to the world and it should be deployed behind a private subnet with exclusive access to desired API

CMD ["--rinkeby", "--datadir", "/.rinkeby", "--cache", "512", "--rpc", "--rpcapi", "db,net,personal,eth,network", "--rpcaddr", "0.0.0.0", "--rpcport", "8545", "--rpcvhosts=*" ,"--syncmode", "fast"] 

