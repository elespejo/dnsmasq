# dnsmasq-x86
Docker x86 image of dnsmasq 

## Dependence

* docker ce 18.06 : [reference](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

* docker-compose 1.22.0 : [reference](https://docs.docker.com/compose/install/)

## Preparation

* Pull the code
    
    ```
    git clone https://github.com/meninasx86/dnsmasq-x86.git
    ```

* Modify the configuration
    
    For quick start, skip this step.

    ```
    cd dnsmasq-x86
    vim dnsmasq_conf/dnsmasq/dnsmasq.conf
    vim dnsmasq_conf/dnsmasq.d/xxx.conf
    ```
    See dnsmasq configuration reference [here](https://wiki.debian.org/HowTo/dnsmasq)

    Attention :
        
    The last line of dnsmasq.conf is specified the expanded configuration. The option is like this :

    ```
    conf-dir=/etc/dnsmasq.d/,*.conf
    ```
    Please don't modify the path which is mounted in container.

## Quick start

* Clean the environment

    ```
    $ ./clean.sh
    ```
    This script down the docker compose, checkout all the changes and remove the dnsmasq image.

* Start the dnsmasq

    ```
    $ docker-compose up -d
    ```

* Stop the dnsmasq

    ```
    $ docker-compose down
    ```

* check status

    ```
    $ ./check_status.sh
    ```