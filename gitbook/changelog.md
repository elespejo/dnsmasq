# 0.8.7: Add dnsconf-dir to info

### Update confgenerator:
1. add setting `dnsconf-dir`
2. update conf generator

### Update gitbook:
1. update GENCONF.md
2. update version


# 0.8.6: Add test interface

### Update imageAPI:
1. add target 'test_config' to validate compose file.
2. only show the last 100 line of dnsmasq log.
1. add target 'test_config'
2. add target 'test_start'
3. add target 'test_stop'
4. add target 'test_restart'
5. add target 'test_remove'

### Update gitbook:
1. update version to 0.8.3
2. add target 'test_config' in deployment doc
3. add work flow doc for developer
4. add changelog doc

# 0.8.2: Update confgenerator

### Update confgenerator:
1. fix typo of 'no-resolv' and 'no-hosts'.
2. fix typo of local key in conf-info.
3. update interface: add -f to replace directly input conf-info
4. not generate config.env,only generate conf files
5. rename conf info name from conf-info-template.yml to dnsmasq-info.yml

### Update image API makefile:
1. stay true when service stop

### Update gitbook:
1. update version to 0.8.2
2. update congen:
   1) add details in modifing conf-info
   2) update the interface of confgenerator
3. update deployment
   1) fix typo
4. update zip package name
5. fix typo of env name when config

### Other:
1. add imageAPI to release package