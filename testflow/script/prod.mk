.PHONY: test_install
test_install:
	make -s -f basic.mk hint CONTENT="make install"
	make testflow_config
	make testflow_start
	make -f test_settings.mk inner-domain
	make -f test_settings.mk new-china
	make -f test_settings.mk ns_lookup
	make -f test_settings.mk static-ip
	make testflow_stop
	make testflow_remove
.PHONY: test_reinstall
test_reinstall:
	make -s -f basic.mk hint CONTENT="make reinstall"
	make testflow_config
	make testflow_start
	make testflow_config
	make testflow_start
	make -f test_settings.mk inner-domain
	make -f test_settings.mk new-china
	make -f test_settings.mk ns_lookup
	make -f test_settings.mk static-ip
	make testflow_stop
	make testflow_remove
.PHONY: test_reuninstall
test_reuninstall:
	make -s -f basic.mk hint CONTENT="make reuninstall"
	make testflow_config
	make testflow_start
	make testflow_stop
	make testflow_stop
	make testflow_remove
	make testflow_remove
.PHONY: test_installafteruninstall
test_installafteruninstall:
	make -s -f basic.mk hint CONTENT="make installafteruninstall"
	make testflow_config
	make testflow_start
	make testflow_stop
	make testflow_remove
	make testflow_config
	make testflow_start
	make -f test_settings.mk inner-domain
	make -f test_settings.mk new-china
	make -f test_settings.mk ns_lookup
	make -f test_settings.mk static-ip
	make testflow_stop
	make testflow_remove
.PHONY: test_reboot_p1
test_reboot_p1:
	make -s -f basic.mk hint CONTENT="make reboot_p1"
	make testflow_config
	make testflow_start
	make -f basic.mk re_boot
.PHONY: test_reboot_p2
test_reboot_p2:
	make -s -f basic.mk hint CONTENT="make reboot_p2"
	make testflow_status
	make -f test_settings.mk inner-domain
	make -f test_settings.mk new-china
	make -f test_settings.mk ns_lookup
	make -f test_settings.mk static-ip
	make testflow_stop
	make testflow_remove
.PHONY: test_poweroff_p1
test_poweroff_p1:
	make -s -f basic.mk hint CONTENT="make poweroff_p1"
	make testflow_config
	make testflow_start
	make -s -f basic.mk hint CONTENT='Please power off the machine'
.PHONY: test_poweroff_p2
test_poweroff_p2:
	make -s -f basic.mk hint CONTENT="make poweroff_p2"
	make testflow_status
	make -f test_settings.mk inner-domain
	make -f test_settings.mk new-china
	make -f test_settings.mk ns_lookup
	make -f test_settings.mk static-ip
	make testflow_stop
	make testflow_remove
.PHONY: test_update
test_update:
	make -s -f basic.mk hint CONTENT="make update"
	make testflow_config
	make testflow_start
	make testflow_stop
	make testflow_config
	make testflow_start
	make testflow_list
	make -f test_settings.mk inner-domain
	make -f test_settings.mk new-china
	make -f test_settings.mk ns_lookup
	make -f test_settings.mk static-ip
	make testflow_stop
	make testflow_remove
