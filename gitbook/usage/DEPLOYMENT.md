# Deployment

### Download the deployment package
    
You can download the deployment package from web page or command line.

* From web:  
Go to the [release page](https://github.com/elespejo/dnsmasq/releases) of this project. Select the package according to the architecture of your machine.

* From command line:  
  ```bash
  wget https://github.com/elespejo/dnsmasq/releases/download/[VERSION]/dnsmasq-imageAPI-[ARCH]-[VERSION].zip
  ```
    * VERSION : the release tag  
    * ARCH : the architecture of your machine 

  e.g : Deploy a dnsmasq on a x86 machine with the release 0.8.3 by executing
  ```bash
  wget https://github.com/elespejo/dnsmasq/releases/download/0.8.3/dnsmasq-imageAPI-x86-0.8.3.zip
  ```

### Unzip

```bash
unzip dnsmasq-imageAPI-[ARCH]-[VERSION].zip
cd dnsmasq-imageAPI-[ARCH]/
```

### Generate the docker compose file

Docker compose file is used for dnsmasq deployment. Its generation requires two parameters:
* [CONFIG] : The absolute path of the configuration that is specified when generate configuration.   
* [NAME] : The name of compose file. This name is used to control the service. Must be **uniqueness**.

```bash
make config CONFIG=[PATH] NAME=[NAME]
```

e.g : Generate a compose file named `dns.yml` with the configuration in `~/dnsmasq_conf/`.
```bash
cd dnsmasq-imageAPI-x86/
make config CONFIG=~/dnsmasq_conf/ NAME=dns
```
Therefore a compose file named `dns.yml` is generated in `~/dnsmasq-imageAPI-x86/compose/`.
```yaml
# dns.yml
services:
  router_dnsmasq:
    cap_add:
    - NET_ADMIN
    image: elespejo/dnsmasq-x86:0.8.3
    network_mode: host
    restart: always
    volumes:
    - source: ~/dnsmasq_conf/
      target: /etc/dnsmasq.d
      type: bind
version: '3.2'
```
For testing configed instance , use another makefile target 'test_config':
```bash
make test_config NAME=[NAME]
```

### Start the service
Start the service with the name you specified in the config step above.
```bash 
make start NAME=[NAME]
```
e.g: start service `dns`
```bash
cd dnsmasq-imageAPI-x86/
make start NAME=dns
```
After starting the service successfully, you may see the output similar with the following: 
```
docker-compose -p dns -f ~/dnsmasq-imageAPI-x86/compose/dns.yml up -d
Pulling router_dnsmasq (elespejo/dnsmasq-x86:0.8.3)...
0.8.3: Pulling from elespejo/dnsmasq-x86
4fe2ade4980c: Already exists
5a492975f351: Pull complete
070fe1f3f59a: Pull complete
Digest: sha256:f4682be5a4eb5b740d865eef6bb79f537410739f233e495292f09ffeba1b6344
Status: Downloaded newer image for elespejo/dnsmasq-x86:0.8.3
Creating dns_router_dnsmasq_1 ... done
```

### Restart the service
```bash
make restart NAME=[NAME]
```
e.g
```bash
make restart NAME=dns
```
After restarting the service successfully, you may see the output similar with the following:
```
docker-compose -p dns -f ~/dnsmasq-imageAPI-x86/compose/dns.yml up -d --force-recreate
Recreating dns_router_dnsmasq_1 ... done
```

### Check status of the service
```bash
make status NAME=[NAME]
```
e.g,
```bash
make stop NAME=dns
```
You may see the output similar with the following:
```
docker-compose -p dns -f ~/dnsmasq-imageAPI-x86/compose/dns.yml ps
        Name                Command          State      Ports
-------------------------------------------------------------
dns_router_dnsmasq_1   /bin/sh -c ./init      UP
docker-compose -p dns -f ~/dnsmasq-imageAPI-x86/compose/dns.yml logs
Attaching to dns_router_dnsmasq_1
router_dnsmasq_1  | ...
...
```

### Stop the service
```bash
make stop NAME=[NAME]
```
e.g,
```bash
make stop NAME=dns
```
After stoping the service successfully, you may see the output similar with the following:
```
docker-compose -p dns -f ~/dnsmasq-imageAPI-x86/compose/dns.yml down
Stopping dns_router_dnsmasq_1 ... done
Removing dns_router_dnsmasq_1 ... done
```

### List the services
```bash
make list
```
You may see the output similar with the following:
```
for compose in `ls ~/dnsmasq-imageAPI-x86/compose`;do name=`echo $compose|awk -F "." '{print $1}'`;echo $name;docker-compose -p $name -f ~/dnsmasq-imageAPI-x86/compose/$compose ps;done
dns
Name   Command   State   Ports
------------------------------
...
```

### Remove the compose file
```bash
make remove NAME=[NAME]
```
e.g,
```bash
make remove NAME=dns
```
You may see the output similar with the following:
```
rm ~/dnsmasq-imageAPI-x86/compose/dns.yml
```
Check whether the remove step successfully:
```bash
ls compose | grep dns
```

