<p align="center">
  <img width="250" src="LOGO">
</p>

<h1 align="center"> dnsmasq </h1>
<p align="center">
  <b >Dnsmasq docker image for x86 and armv6</b>
</p>
<br>

[![GitHub release](https://img.shields.io/github/release/elespejo/dnsmasq.svg)](https://github.com/elespejo/dnsmasq/releases)
![Github All Releases](https://img.shields.io/github/downloads/elespejo/dnsmasq/total.svg)
[![Docker Pulls](https://img.shields.io/docker/pulls/elespejo/dnsmasq.svg)](https://hub.docker.com/r/elespejo/dnsmasq/tags/)
![Travis (.org) branch](https://img.shields.io/travis/elespejo/dnsmasq/master.svg)
[![Docker Automated build](https://img.shields.io/docker/automated/elespejo/dnsmasq.svg)](https://hub.docker.com/r/elespejo/dnsmasq/)
[![Docker Build Status](https://img.shields.io/docker/build/elespejo/dnsmasq.svg)](https://hub.docker.com/r/elespejo/dnsmasq/builds/)
![GitHub](https://img.shields.io/github/license/elespejo/dnsmasq.svg)

# Dependence

1. Install docker 18.06 : [reference](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

2. Install `docker-compose` command :  
For x86 : docker-compose 1.22.0 [reference](https://docs.docker.com/compose/install/)  
For armv6 : `pip install docker-compose`

# Deployment

  - Pull the code from github.
    ```bash
    $ git clone https://github.com/elespejo/dnsmasq.git
    ```

  - According to your machine's architecture ( x86 or armv6 ) , Select the compose file.  
    For example :  
    You want to deployment on your x86 machine. Choose the the compose file : `docker-compose-x86.yml` and modify the image tag with `latest`.
    
  - Start the dnsmasq service.
    ```bash
    $ docker-compose -f docker-compose-x86.yml up -d 
    ```

  - Check the status.
    ```bash
    $ ./check_status.sh
    ```

  - Stop the dnsmasq service.
    ```bash
    $ docker-compose -f docker-compose-x86.yml down
    ```


# Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

### Prerequisites
  - Pull the code from github.
    ```bash
    $ git clone https://github.com/elespejo/dnsmasq.git
    ```

### Build
```bash
./build.sh ARCH
```
`ARCH` is `x86` or `armv6`.

### Built With
  - docker 
  - travis

# Logistics

### Contributing

Please read [CONTRIBUTING.md](https://github.com/elespejo/dnsmasq/blob/master/docs/CONTRIBUTING.md) for contributing.
For details on our [code of conduct](https://github.com/elespejo/dnsmasq/blob/master/docs/CODE_OF_CONDUCT.md), and the process for submitting pull requests to us.

### Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the tags on this repository.

### Authors

* **AUTHOR** - *Initial work* - [AP1001](https://github.com/AP1001)
* **AUTHOR** - *Improvement* - [Valerio-Perez](https://github.com/Valerio-Perez)

See also the list of [contributors](https://github.com/elespejo/dnsmasq/graphs/contributors) who participated in this project.

### Acknowledgments

See [Acknowledgments](https://github.com/elespejo/dnsmasq/blob/master/docs/ACKNOWLEDGMENTS.md).


### License

This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/elespejo/dnsmasq/blob/master/LICENSE.md) file for details.

