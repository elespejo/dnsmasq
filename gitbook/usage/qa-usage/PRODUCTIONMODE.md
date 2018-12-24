# Production mode
### Run test cases on x86

* Download packages
```
make -f basic.mk download
```

* Set test project and arch
```
make -f basic.mk set_arch ARCH=x86
make -f manage_prod.mk set_img_pkg
```

* Generate configuration 

	Update a info.yml file in current directory
```
make -f manage_prod.mk gen_proj_conf 
```

* Run test cases
```
make -f prod.mk test_install
make -f prod.mk test_reinstall
make -f prod.mk test_reuninstall
make -f prod.mk test_installafteruninstall
make -f prod.mk test_reboot_p1
make -f prod.mk test_reboot_p2
make -f prod.mk test_poweroff_p1
make -f prod.mk test_poweroff_p2
make -f prod.mk test_update
```
* Clean test environment
```
make -f build_dev_pkg.mk clean_dev_env_x86 
```



### Run test cases on armv6
* Set test project
```
make -f basic.mk set_proj TEST_PROJ=../..
```
* Build image and packages locally
```
make -f build_dev_pkg.mk build_dev_env_armv6
```

* Generate configuration 
```
make -f build_dev_pkg.mk gen_proj_conf 
```



* Run test cases
```
make -f prod.mk test_install
make -f prod.mk test_reinstall
make -f prod.mk test_reuninstall
make -f prod.mk test_installafteruninstall
make -f prod.mk test_reboot_p1
make -f prod.mk test_reboot_p2
make -f prod.mk test_poweroff_p1
make -f prod.mk test_poweroff_p2
make -f prod.mk test_update
```


* Clean test environment
```
make -f basic.mk rm_download
make -f manage_prod.mk del_proj_conf
```
