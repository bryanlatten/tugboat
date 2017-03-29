# Check multiple SANs in your CSR with OpenSSL
# openssl req -text -noout -in pro2.dev0.be.lan.csr | less

define ASCILOGO
  ▄████ ▓█████  ███▄    █ ▓█████  ██▀███   ▄▄▄     ▄▄▄█████▓▓█████     ▄████▄  ▓█████  ██▀███  ▄▄▄█████▓  ██████
 ██▒ ▀█▒▓█   ▀  ██ ▀█   █ ▓█   ▀ ▓██ ▒ ██▒▒████▄   ▓  ██▒ ▓▒▓█   ▀    ▒██▀ ▀█  ▓█   ▀ ▓██ ▒ ██▒▓  ██▒ ▓▒▒██    ▒
▒██░▄▄▄░▒███   ▓██  ▀█ ██▒▒███   ▓██ ░▄█ ▒▒██  ▀█▄ ▒ ▓██░ ▒░▒███      ▒▓█    ▄ ▒███   ▓██ ░▄█ ▒▒ ▓██░ ▒░░ ▓██▄
░▓█  ██▓▒▓█  ▄ ▓██▒  ▐▌██▒▒▓█  ▄ ▒██▀▀█▄  ░██▄▄▄▄██░ ▓██▓ ░ ▒▓█  ▄    ▒▓▓▄ ▄██▒▒▓█  ▄ ▒██▀▀█▄  ░ ▓██▓ ░   ▒   ██▒
░▒▓███▀▒░▒████▒▒██░   ▓██░░▒████▒░██▓ ▒██▒ ▓█   ▓██▒ ▒██▒ ░ ░▒████▒   ▒ ▓███▀ ░░▒████▒░██▓ ▒██▒  ▒██▒ ░ ▒██████▒▒
 ░▒   ▒ ░░ ▒░ ░░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒▓ ░▒▓░ ▒▒   ▓▒█░ ▒ ░░   ░░ ▒░ ░   ░ ░▒ ▒  ░░░ ▒░ ░░ ▒▓ ░▒▓░  ▒ ░░   ▒ ▒▓▒ ▒ ░
  ░   ░  ░ ░  ░░ ░░   ░ ▒░ ░ ░  ░  ░▒ ░ ▒░  ▒   ▒▒ ░   ░     ░ ░  ░     ░  ▒    ░ ░  ░  ░▒ ░ ▒░    ░    ░ ░▒  ░ ░
░ ░   ░    ░      ░   ░ ░    ░     ░░   ░   ░   ▒    ░         ░      ░           ░     ░░   ░   ░      ░  ░  ░
      ░    ░  ░         ░    ░  ░   ░           ░  ░           ░  ░   ░ ░         ░  ░   ░                    ░
                                                                      ░
=======================================
endef

export ASCILOGO

# http://misc.flogisoft.com/bash/tip_colors_and_formatting

RED=\033[0;31m
GREEN=\033[0;32m
ORNG=\033[38;5;214m
BLUE=\033[38;5;81m
NC=\033[0m

export RED
export GREEN
export NC
export ORNG
export BLUE

help:
	@printf "\033[1m$$ASCILOGO $$NC\n"
	@printf "\033[21m\n\n"
	@printf "=======================================\n"
	@printf "\n"
	@printf "Primary Commands :\n"
	@printf "$$GREEN make regenerate-dev0$$NC             Create Key(key), Certificate Request(csr), and Cert(crt) for *.dev0.be.lan \n"
	@printf "$$GREEN make regenerate-pro2$$NC             Create Key(key), Certificate Request(csr), and Cert(crt) for *.pro2.dev0.be.lan \n"
	@printf "$$GREEN make regenerate-net$$NC              Create Key(key), Certificate Request(csr), and Cert(crt) for *.net.dev0.be.lan \n"
	@printf "\n"
	@printf "\033[21m\n\n"
	@printf "=======================================\n"
	@printf "\n"
	@printf "Info Commands :\n"
	@printf "$$GREEN make view-pro2-csr$$NC             View *.pro2.dev0.be.lan csr file\n"
	@printf "$$GREEN make view-pro2-crt$$NC             View *.pro2.dev0.be.lan crt file\n"
	@printf "$$GREEN make view-pro2-key$$NC             View *.pro2.dev0.be.lan key file\n"
	@printf "\n"
	@printf "$$GREEN make view-net-csr$$NC              View *.net.dev0.be.lan csr file\n"
	@printf "$$GREEN make view-net-crt$$NC              View *.net.dev0.be.lan crt file\n"
	@printf "$$GREEN make view-net-key$$NC              View *.net.dev0.be.lan key file\n"
	@printf "\n"
	@printf "$$GREEN make view-dev0-csr$$NC              View *.dev0.be.lan csr file\n"
	@printf "$$GREEN make view-dev0-crt$$NC              View *.dev0.be.lan crt file\n"
	@printf "$$GREEN make view-dev0-key$$NC              View *.dev0.be.lan key file\n"

default:
	@printf "default:\n"

regenerate-all: regenerate-dev0 regenerate-pro2 regenerate-net

regenerate-dev0:
	@openssl req -newkey rsa:2048 -nodes -keyout dev0.be.lan.key -out dev0.be.lan.csr -config dev0_openssl.cnf
	@openssl ca -create_serial -config ca_signing_openssl.cnf -extensions server_cert -days 3650 -notext -md sha256 -in dev0.be.lan.csr -out dev0.be.lan.crt
	@make view-dev0-csr
	@make view-dev0-crt
	@make view-dev0-key

regenerate-pro2:
	@openssl req -newkey rsa:2048 -nodes -keyout pro2.dev0.be.lan.key -out pro2.dev0.be.lan.csr -config pro2_openssl.cnf
	@openssl ca -create_serial -config ca_signing_openssl.cnf -extensions server_cert -days 3650 -notext -md sha256 -in pro2.dev0.be.lan.csr -out pro2.dev0.be.lan.crt
	@make view-pro2-csr
	@make view-pro2-crt
	@make view-pro2-key

regenerate-net:
	@openssl req -newkey rsa:2048 -nodes -keyout net.dev0.be.lan.key -out net.dev0.be.lan.csr -config net_openssl.cnf
	@openssl ca -create_serial -config ca_signing_openssl.cnf -extensions server_cert -days 3650 -notext -md sha256 -in net.dev0.be.lan.csr -out net.dev0.be.lan.crt
	@make view-net-csr
	@make view-net-crt
	@make view-net-key

view-pro2-csr:
	@printf "$$BLUE View pro2.dev0.be.lan.csr:\n"
	@openssl req -text -noout -verify -in pro2.dev0.be.lan.csr

view-pro2-crt:
	@printf "$$BLUE View pro2.dev0.be.lan.crt:\n"
	@openssl x509 -in pro2.dev0.be.lan.crt -text -noout

view-pro2-key:
	@printf "$$BLUE View pro2.dev0.be.lan.key:\n"
	@openssl rsa -in pro2.dev0.be.lan.key -check

view-net-csr:
	@printf "$$BLUE View net.dev0.be.lan.csr:\n"
	@openssl req -text -noout -verify -in net.dev0.be.lan.csr

view-net-crt:
	@printf "$$BLUE View net.dev0.be.lan.crt:\n"
	@openssl x509 -in net.dev0.be.lan.crt -text -noout

view-net-key:
	@printf "$$BLUE View net.dev0.be.lan.key:\n"
	@openssl rsa -in net.dev0.be.lan.key -check

view-dev0-csr:
	@printf "$$BLUE View dev0.be.lan.csr:\n"
	@openssl req -text -noout -verify -in dev0.be.lan.csr

view-dev0-crt:
	@printf "$$BLUE View dev0.be.lan.crt:\n"
	@openssl x509 -in dev0.be.lan.crt -text -noout

view-dev0-key:
	@printf "$$BLUE View dev0.be.lan.key:\n"
	@openssl rsa -in dev0.be.lan.key -check
