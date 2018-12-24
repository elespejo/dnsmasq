# Development mode
### Run test cases on x86
* Set test project
```
cd testflow/script
make -f basic.mk set_proj TEST_PROJ=../..
```
* Build image and packages locally
```
make -f manage_dev.mk build_dev_env_x86
```

* Generate configuration 

	Update `USER` in testflow/script/build_pkg/dnsmasq-confgenerator/dnsmasq-info.yml, add a new directory according to dnsconf-dir setting
```
make -f manage_dev.mk gen_proj_conf 
```

* Run test cases

	**Please run `sudo systemctl stop systemd-resolved.service` if ubuntu 18.04 is used for testing**
```
make -f dev.mk test_install
make -f dev.mk test_reinstall
make -f dev.mk test_reuninstall
make -f dev.mk test_installafteruninstall
make -f dev.mk test_reboot_p1
make -f dev.mk test_reboot_p2
make -f dev.mk test_poweroff_p1
make -f dev.mk test_poweroff_p2
make -f dev.mk test_update
```
* Clean test environment
```
make -f manage_dev.mk clean_dev_env_x86 
```



### Run test cases on armv6
* Set test project
```
make -f basic.mk set_proj TEST_PROJ=../..
```
* Build image and packages locally
```
make -f manage_dev.mk build_dev_env_armv6
```

* Generate configuration 
```
make -f manage_dev.mk gen_proj_conf 
```



* Run test cases
```
make -f dev.mk test_install
make -f dev.mk test_reinstall
make -f dev.mk test_reuninstall
make -f dev.mk test_installafteruninstall
make -f dev.mk test_reboot_p1
make -f dev.mk test_reboot_p2
make -f dev.mk test_poweroff_p1
make -f dev.mk test_poweroff_p2
make -f dev.mk test_update
```


* Clean test environment
```
make -f manage_dev.mk clean_dev_env_armv6
```
