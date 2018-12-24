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

	Update path for other_info in info.yml
```
make -f manage_dev.mk gen_proj_conf 
```

* Run test cases

	**Please run `sudo systemctl disable systemd-resolved.service` if ubuntu 18.04 is used for testing**
```
make -f dev.mk test_install
make -f dev.mk test_reinstall
make -f dev.mk test_reuninstall
make -f dev.mk test_installafteruninstall
make -f dev.mk test_reboot_p1
make -f dev.mk test_reboot_p2
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
```


* Clean test environment
```
make -f manage_dev.mk clean_dev_env_armv6
```
