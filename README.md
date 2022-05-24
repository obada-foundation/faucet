## Deploy faucet with Ansible and docker-compose 
### Install required packages

```sh
sudo apt install docker.io make -y
```

If you don't have a **Debian** based distribution, you need to find a way to install such dependencies on your own.

### Add user to the docker group

```sh
sudo usermod -aG docker $USER
```

After execution of this command you need to reboot your provision server.

### Clone the repo

```sh
git clone https://github.com/obada-foundation/faucet
cd faucet
```

### Generate server certificates into **./ssh** folder

```sh
make certificates
```
After the success certificate generation, add **./ssh/ssh_key.pub** to the server that you want to install `taucet`. Below you can find instructions how to add a key for most popular cloud/hosting providers:

- [DigitalOcean](https://docs.digitalocean.com/products/droplets/how-to/add-ssh-keys/to-account/)
- [AWS EC2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)
- You can also do this manually by looking into [this](https://linuxhandbook.com/add-ssh-public-key-to-server/) tutorial

### Generate inventory file
```sh
make deploy/inventory
```

### Deploy faucet application
```bash
make deploy/compose
```

