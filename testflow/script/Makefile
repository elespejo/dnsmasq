#!make
include .env
.PHONY: testflow_config
testflow_config:
	make -s -f basic.mk hint CONTENT="make config"
	make -C ${IMG_PKG} config CONFIG=${PWD}/conf_gened NAME=dns
	make -s -f basic.mk hint CONTENT="make test_config"
	make -C ${IMG_PKG} test_config NAME=dns
	make -s -f basic.mk confirm
.PHONY: testflow_start
testflow_start:
	make -s -f basic.mk hint CONTENT="make start"
	make -C ${IMG_PKG} start NAME=dns
	make -s -f basic.mk hint CONTENT="make test_start"
	make -C ${IMG_PKG} test_start NAME=dns
	make -s -f basic.mk confirm
.PHONY: testflow_stop
testflow_stop:
	make -s -f basic.mk hint CONTENT="make stop"
	make -C ${IMG_PKG} stop NAME=dns
	make -s -f basic.mk hint CONTENT="make test_stop"
	make -C ${IMG_PKG} test_stop NAME=dns
	make -s -f basic.mk confirm
.PHONY: testflow_restart
testflow_restart:
	make -s -f basic.mk hint CONTENT="make restart"
	make -C ${IMG_PKG} restart NAME=dns
	make -s -f basic.mk hint CONTENT="make test_restart"
	make -C ${IMG_PKG} test_restart NAME=dns
	make -s -f basic.mk confirm
.PHONY: testflow_list
testflow_list:
	make -s -f basic.mk hint CONTENT="make list"
	make -C ${IMG_PKG} list
	make -s -f basic.mk confirm
.PHONY: testflow_remove
testflow_remove:
	make -s -f basic.mk hint CONTENT="make remove"
	make -C ${IMG_PKG} remove NAME=dns
	make -s -f basic.mk hint CONTENT="make test_remove"
	make -C ${IMG_PKG} test_remove NAME=dns
	make -s -f basic.mk confirm
.PHONY: testflow_status
testflow_status:
	make -s -f basic.mk hint CONTENT="make status"
	make -C ${IMG_PKG} status NAME=dns
	make -s -f basic.mk confirm
.PHONY: testflow_log
testflow_log:
	make -s -f basic.mk hint CONTENT="make status_dnsmasq_log"
	make -C ${IMG_PKG} status_dnsmasq_log NAME=dns
	make -s -f basic.mk confirm
