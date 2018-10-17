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

```bash
cd dnsmasq-confgenerator
./gen_dns-server.sh [SERVER_IP] [START_PORT] [END_PORT]
```
in which,
* [SERVER_IP]: the public ip of your dns server  
* [START_PORT]: the start port for resolve domain 
* [END_PORT]: the end port for resolve domain 

e.g, generate dnsmasq configuration
```bash
./gen_dns-server.sh 123.45.67.89 12340 12350
``` 

You can validate the result by `cat dns-server.conf`, with successful output similar with the following,
```
server=123.45.67.89#12340
server=123.45.67.89#12341
server=123.45.67.89#12342
server=123.45.67.89#12343
server=123.45.67.89#12344
server=123.45.67.89#12345
server=123.45.67.89#12346
server=123.45.67.89#12347
server=123.45.67.89#12348
server=123.45.67.89#12349
server=123.45.67.89#12350
```
