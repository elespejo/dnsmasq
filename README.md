# dnsmasq-x86
Docker x86 image of dnsmasq 

## Preparation

* Pull the code
    ```
    git clone https://github.com/meninasx86/dnsmasq-x86.git
    ```

* Modify the configuration in `dnsmasq_conf/dnsmasq` and `dnsmasq_conf/dnsmasq.d`

    ```
    cd dnsmasq-x86
    vim dnsmasq_conf/dnsmasq/dnsmasq.conf
    vim dnsmasq_conf/dnsmasq.d/xxx.conf
    ```
    See dnsmasq configuration reference [here](https://wiki.debian.org/HowTo/dnsmasq)

* Install docker-compose

    See reference [here](https://docs.docker.com/compose/install/)


## Test images

* Check docker image

    ```
    $ docker images
    ```
    Check whether the images ( meninasx86/dnsmasq-x86 ) exist. If exist, use the command to remove.
    ```
    $ docker rmi meninasx86/dnsmasq-x86
    ```

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