#!make
include .env
CONF_DIR=projconf

.PHONY: gen_proj_conf del_proj_conf read_proj_conf
gen_proj_conf:
	cd ${PROJECT}-confgenerator && python3 -m confgenerator.cli -f ${PWD}/info.yml -d ${PWD}/${CONF_DIR}
	ls ${CONF_DIR}

read_proj_conf:
	ls ${CONF_DIR}

del_proj_conf:
	rm -rf ${CONF_DIR}

.PHONY: set_img_pkg
set_img_pkg:
	sed -i '/IMG_PKG/c\export IMG_PKG=${PROJECT}-imageAPI-${TEST_ARCH}' .env
	cat .env | grep "export IMG_PKG"



