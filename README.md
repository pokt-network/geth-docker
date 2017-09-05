# geth-rinkeby-docker

> Run a [geth](https://github.com/ethereum/go-ethereum) node that syncs up with [rinkeby](https://www.rinkeby.io/) testnet in a [Docker](https://www.docker.com/) container.

# Usage

```bash
docker-compose up
```

## Ports

RPC URL

```
http://{docker_ip}:8545/
```

WebSocket URL

```
ws://{docker_ip}:8546/
```

## Running in EC2

Make sure to select an instance type with enough memory.

Install and run instructions:

```bash
sudo yum update -y
sudo yum install -y docker
sudo yum install -y git
curl -L https://github.com/docker/compose/releases/download/1.12.0/docker-compose-`uname -s`-`uname -m` > ./docker-compose
sudo mv ./docker-compose /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo docker-compose up --build -d
```

Check syncing status:

```bash
sudo docker exec -it {container_id} geth attach ipc:/.rinkeby/geth.ipc

> eth.syncing
{
  currentBlock: 405371,
  highestBlock: 837461,
  knownStates: 272806,
  pulledStates: 269942,
  startingBlock: 271758
}
```

Edit the EC2 instance security group inbound rules to allow ports `8545` and `8546`.

# License

MIT
