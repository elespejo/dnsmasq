# Work flow
### Download the project
```bash
git clone https://github.com/elespejo/dnsmasq.git
cd dnsmasq/
```

### Build docker image
After modifying the Dockerfile, use the command below to build the docker  image:
```bash
make mk-image ARCH=[arch]
```
The `arch` can be `x86` or `armv6`.
This action build a docker image named `elespejo/sskcp-[arch]:latest` by using the resource in directory `image`.

### Clean docker image
```bash
make clean-image ARCH=[arch]
```
This action remove the docker image named `elespejo/sskcp-[arch]:latest`.

### Build dnsmasq x86 image API
```bash
make mk-deployment-x86 VERSION=[version]
```

### Build dnsmasq armv6 image API
```bash
make mk-deployment-armv6 VERSION=[version]
```

### Build configuration generator
```bash
make mk-confgenerator VERSION=[version]
```

### Build all package
```bash
make mk-deployment VERSION=[version]
```

### Build gitbook
```bash
make mk-book