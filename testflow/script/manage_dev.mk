#!make
include .env
IMG_VERSION=latest

build_image_x86:
	make -C ${TEST_PROJ} mk-image ARCH=x86


clean_image_x86:
	docker rmi ${ORG}/${PROJECT}-x86:${IMG_VERSION} || true

build_image_armv6:
	make -C ${TEST_PROJ} mk-image ARCH=armv6

clean_image_armv6:
	docker rmi ${ORG}/${PROJECT}-armv6:${IMG_VERSION} || true


build_imgAPI_x86:
	make -C ${TEST_PROJ} mk-deployment-x86 VERSION=${IMG_VERSION}
	mkdir ${BUILD_PKG} || true 
	mv ${TEST_PROJ}/${PROJECT}-imageAPI-x86-${IMG_VERSION}.zip ${BUILD_PKG}/
	unzip ${BUILD_PKG}/${PROJECT}-imageAPI-x86-${IMG_VERSION}.zip -d ${BUILD_PKG}

build_imgAPI_armv6:
	make -C ${TEST_PROJ} mk-deployment-armv6 VERSION=${IMG_VERSION}
	mkdir ${BUILD_PKG} || true 
	mv ${TEST_PROJ}/${PROJECT}-imageAPI-armv6-${IMG_VERSION}.zip ${BUILD_PKG}/
	unzip ${BUILD_PKG}/${PROJECT}-imageAPI-armv6-${IMG_VERSION}.zip -d ${BUILD_PKG}


build_confgen:
	make -C ${TEST_PROJ} mk-confgenerator VERSION=${IMG_VERSION}
	mkdir ${BUILD_PKG} || true 
	mv ${TEST_PROJ}/${PROJECT}-confgenerator-${IMG_VERSION}.zip ${BUILD_PKG}/
	unzip ${BUILD_PKG}/${PROJECT}-confgenerator-${IMG_VERSION}.zip -d ${BUILD_PKG}


build_dev_env_x86: build_image_x86 build_imgAPI_x86 build_confgen status
	sed -i '/export TEST_ARCH/c\export TEST_ARCH=x86' .env

build_dev_env_armv6: build_image_armv6 build_imgAPI_armv6 build_confgen status 
	sed -i '/export TEST_ARCH/c\export TEST_ARCH=armv6' .env

clean_pkg:
	rm -rf ${BUILD_PKG} || true
	rm -rf dnsconf || true
	make -f build_dev_pkg.mk status 

clean_dev_env_x86: clean_image_x86 clean_pkg 
	make -f basic.mk set_arch ARCH=x86
clean_dev_env_armv6: clean_image_armv6 clean_pkg
	make -f basic.mk set_arch ARCH=armv6

status: 
	ls ${BUILD_PKG} || true
	ls dnsconf || true
	docker images | grep ${PROJECT}


.PHONY: gen_proj_conf del_proj_conf read_proj_conf
gen_proj_conf:
	cd ${BUILD_PKG}/dnsmasq-confgenerator && python3 -m confgenerator.cli -f ${PWD}/${BUILD_PKG}/dnsmasq-confgenerator/dnsmasq-info.yml -d ${PWD}/dnsconf
	ls dnsconf

read_proj_conf:
	ls dnsconf

del_proj_conf:
	rm -rf dnsconf




