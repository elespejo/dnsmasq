#!make
include .env

.PHONY: gen_proj_conf del_proj_conf read_proj_conf
gen_proj_conf:
	cd ${PROJECT}-confgenerator && python3 -m confgenerator.cli -f ${PWD}/${TEST_INFO} -d ${PWD}/${TEST_CONF}
	ls ${TEST_CONF}

read_proj_conf:
	ls ${TEST_CONF}

del_proj_conf:
	rm -rf ${TEST_CONF}

.PHONY: set_img_pkg
set_img_pkg:
	sed -i '/IMG_PKG/c\export IMG_PKG=${PROJECT}-imageAPI-${TEST_ARCH}' .env
	cat .env | grep "export IMG_PKG"



