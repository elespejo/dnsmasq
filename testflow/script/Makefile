#!make
include .env
.PHONY: test_config
test_config:
	make -s -f basic.mk hint CONTENT="make config"
	make -C ${IMG_PKG} config CONFIG=${PWD}/dnsconf NAME=dns
	make -C ${IMG_PKG} status NAME=dns
	make -s -f basic.mk confirm
.PHONY: test_start
test_start:
	make -s -f basic.mk hint CONTENT="make start"
	make -C ${IMG_PKG} start NAME=dns
	make -C ${IMG_PKG} status NAME=dns
	make -s -f basic.mk confirm
.PHONY: test_stop
test_stop:
	make -s -f basic.mk hint CONTENT="make stop"
	make -C ${IMG_PKG} stop NAME=dns
	make -C ${IMG_PKG} status NAME=dns
	make -s -f basic.mk confirm
.PHONY: test_restart
test_restart:
	make -s -f basic.mk hint CONTENT="make restart"
	make -C ${IMG_PKG} restart NAME=dns
	make -C ${IMG_PKG} status NAME=dns
	make -s -f basic.mk confirm
.PHONY: test_list
test_list:
	make -s -f basic.mk hint CONTENT="make list"
	make -C ${IMG_PKG} list
	make -C ${IMG_PKG} status NAME=dns
	make -s -f basic.mk confirm
.PHONY: test_remove
test_remove:
	make -s -f basic.mk hint CONTENT="make remove"
	make -C ${IMG_PKG} remove NAME=dns
	make -C ${IMG_PKG} status NAME=dns
	make -s -f basic.mk confirm
