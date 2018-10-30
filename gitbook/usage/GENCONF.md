# Generate configuration

### Download the configuration generator
You can download the generator package from web page or command line.

* From web:  
    Go to the [release page](https://github.com/elespejo/dnsmasq/releases) of this project and download `dnsmasq-confgenerator-[VERSION].zip`.

* From command line:  
    ```bash
    wget https://github.com/elespejo/dnsmasq/releases/download/[VERSION]/dnsmasq-confgenerator-[VERSION].zip
    ```
    e.g, download configuration generator of version 0.5.6
    ```bash
    wget https://github.com/elespejo/dnsmasq/releases/download/0.5.6/dnsmasq-confgenerator-0.5.6.zip
    ```

### Unzip
```bash
unzip dnsmasq-confgenerator-[VERSION].zip
```
e.g,
```bash
unzip dnsmasq-confgenerator-0.5.6.zip
```

### Generate configuration

* Modify the conf-info  
    Modify the conf-info `conf-info-template.yml`. The meaning of each option see [here](http://www.thekelleys.org.uk/dnsmasq/docs/dnsmasq-man.html).

* Generate the configuration directory
    ```
    python -m confgenerator.cli [conf-info path] -d [configuration path]
    ```
    * [conf-info path] : the path of conf-info file.
    * [configuration path] : the directory path of generated configuration. (This is optional, the default path is `$PWD/dnsmasq_conf`) 

    e.g,
    ```
    python -m confgenerator.cli $PWD/conf-info-template.yml
    ```
    The configurations are generated in `$PWD/dnsmasq_conf/`. And `config.env` is generated in `$PWD/`.