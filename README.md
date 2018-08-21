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

* download docker-compose

    See reference [here](https://docs.docker.com/compose/install/)

## Usage

* Start the dnsmasq

    ```
    $ docker-compose up
    ```

* Stop the dnsmasq

    ```
    $ docker-compose down
    ```

* check log

    ```
    $ docker log router_dnsmasq
    ```

* Check the functionality

    ```
    $ nslookup <domain> 127.0.0.1
    ```