#!make 
include .env
LIB=".env"

.PHONY: download rm_download
download: $(addprefix download-, $(PAK_SEQ))
download-%:
	wget https://github.com/${ORG}/${PROJECT}/releases/download/${PROJ_VERSION}/$*.zip
	unzip $*.zip

rm_download:
	rm -rf ${PROJECT}*


.PHONY: test_integrity
test_integrity:
	md5sum -c ${PROJECT}-testflow-${PROJ_VERSION}.md5

.PHONY: set_proj read_proj
set_proj: 
	sed -i '/TEST_PROJ/c\export TEST_PROJ=${TEST_PROJ}' ${LIB}


read_proj:
	cat ${LIB} | grep "TEST_PROJ"

.PHONY: reset_proj
reset_proj:
	sed -i '/TEST_PROJ/c\export TEST_PROJ=../' ${LIB}
	sed -i '/TESTMODE/c\export TESTMODE=dev' ${LIB}
	cat ${LIB}

.PHONY: set_mod read_mod 
set_mod:
	sed -i '/TESTMODE/c\export TESTMODE=${TESTMODE}' ${LIB}
read_mod:
	printenv TESTMODE

.PHONY: set_arch 
set_arch:
	sed -i '/export TEST_ARCH/c\export TEST_ARCH=${ARCH}' .env
	cat ${LIB} | grep "export TEST_ARCH"


.PHONY: hint confirm re_boot
hint:
		GREEN='\033[0;32m'
		NC='\033[0m' # No Color
		printf "${GREEN}=================================${NC}\n"
		printf "${GREEN}${CONTENT}${NC}\n"
		printf "${GREEN}=================================${NC}\n"

confirm:
		@( read -p "Are you sure?!? [y/N]: " sure && case "$$sure" in [yY]) true;; *) false;; esac )

re_boot:
		make -s -f basic.mk hint CONTENT="You are going to reboot"
		make -f basic.mk confirm
		sudo reboot


