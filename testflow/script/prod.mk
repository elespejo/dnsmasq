.PHONY: test_install
test_install:
	make -s -f basic.mk hint CONTENT="make install"
	make test_config
	make test_start
	make -f ns_lookup.mk ns_lookup
	make test_stop
	make test_remove
	make -f ns_lookup.mk ns_lookup
.PHONY: test_reinstall
test_reinstall:
	make -s -f basic.mk hint CONTENT="make reinstall"
	make test_config
	make test_start
	make test_config
	make test_start
	make -f ns_lookup.mk ns_lookup
	make test_stop
	make test_remove
	make -f ns_lookup.mk ns_lookup
.PHONY: test_reuninstall
test_reuninstall:
	make -s -f basic.mk hint CONTENT="make reuninstall"
	make test_config
	make test_start
	make test_stop
	make test_stop
	make test_remove
	make test_remove
	make -f ns_lookup.mk ns_lookup
.PHONY: test_installafteruninstall
test_installafteruninstall:
	make -s -f basic.mk hint CONTENT="make installafteruninstall"
	make test_config
	make test_start
	make test_stop
	make test_remove
	make test_config
	make test_start
	make -f ns_lookup.mk ns_lookup
	make test_stop
	make test_remove
	make -f ns_lookup.mk ns_lookup
.PHONY: test_reboot_p1
test_reboot_p1:
	make -s -f basic.mk hint CONTENT="make reboot_p1"
	make test_config
	make test_start
	make -f basic.mk re_boot
.PHONY: test_reboot_p2
test_reboot_p2:
	make -s -f basic.mk hint CONTENT="make reboot_p2"
	make test_status
	make -f ns_lookup.mk ns_lookup
	make test_stop
	make test_remove
.PHONY: test_poweroff_p1
test_poweroff_p1:
	make -s -f basic.mk hint CONTENT="make poweroff_p1"
	make test_config
	make test_start
	make -s -f basic.mk hint CONTENT='Please power off the machine'
.PHONY: test_poweroff_p2
test_poweroff_p2:
	make -s -f basic.mk hint CONTENT="make poweroff_p2"
	make test_status
	make -f ns_lookup.mk ns_lookup
	make test_stop
	make test_remove
	make -f ns_lookup.mk ns_lookup
.PHONY: test_update
test_update:
	make -s -f basic.mk hint CONTENT="make update"
	make test_config
	make test_start
	make test_stop
	make test_config
	make test_start
	make test_list
	make -f ns_lookup.mk ns_lookup
	make test_stop
	make test_remove
	make -f ns_lookup.mk ns_lookup
