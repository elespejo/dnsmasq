# Generate configuration

### Download the configuration generator
You can download the generator package from web page or command line.

* From web:  
    Go to the [release page](https://github.com/elespejo/dnsmasq/releases) of this project and download `dnsmasq-confgenerator-[VERSION].zip`.

* From command line:  
    ```bash
    wget https://github.com/elespejo/dnsmasq/releases/download/[VERSION]/dnsmasq-confgenerator-[VERSION].zip
    ```
    e.g, download configuration generator of version 0.8.3
    ```bash
    wget https://github.com/elespejo/dnsmasq/releases/download/0.8.3/dnsmasq-confgenerator-0.8.3.zip
    ```

### Unzip
```bash
unzip dnsmasq-confgenerator-[VERSION].zip
```
e.g,
```bash
unzip dnsmasq-confgenerator-0.8.3.zip
cd dnsmasq-confgenerator/
```

### Generate configuration

* Modify the conf-info  
    The template conf-info is the `dnsmasq-info.yml` in unzipped confgenerator package.
    ```bash
    ls dnsmasq-confgenerator/
    confgenerator  dnsmasq-info.yml
    ```
    Modify the conf-info `dnsmasq-info.yml`. The meaning of each option see [here](http://www.thekelleys.org.uk/dnsmasq/docs/dnsmasq-man.html).
    ```yaml
    # dnsmasq-info.yml
    dhcp-range: 192.168.0.5,192.168.0.150,12h

    dhcp-option: 6,192.168.0.1

    cache-size: 3000

    domain: powter

    local: /powter/

    dns-server:
      - ip: 1.1.1.1
        ports:
          start-port: 16350
          end-port: 16370

      - ip: 2.2.2.2
        ports:
          start-port: 16350
          end-port: 16370
    ```

* Generate the configuration directory
    ```
    python -m confgenerator.cli -f [conf-info path] -d [configuration path]
    ```
    * [conf-info path] : the absolute path of conf-info file.
    * [configuration path] : the directory path of generated configuration. (This is optional, the default path is `$PWD/dnsmasq`) 

    e.g,
    ```
    python -m confgenerator.cli -f $PWD/dnsmasq-info.yml
    ```
    The configurations are generated in `$PWD/dnsmasq/`.