#!make

.PHONY: ns_lookup
ns_lookup: 
	nslookup www.iqiyi.com 127.0.0.1
	nslookup www.google.com 127.0.0.1
	nslookup www.facebook.com 127.0.0.1
	nslookup www.github.com 127.0.0.1
	nslookup www.iqiyi.com 127.0.0.1
	nslookup www.google.com 127.0.0.1
	nslookup www.facebook.com 127.0.0.1
	nslookup www.github.com 127.0.0.1
	make -f test_settings.mk check-cache
	sleep 3
	nslookup www.iqiyi.com 127.0.0.1
	nslookup www.google.com 127.0.0.1
	nslookup www.facebook.com 127.0.0.1
	nslookup www.github.com 127.0.0.1
	make -f test_settings.mk check-cache
	sleep 7
	nslookup www.iqiyi.com 127.0.0.1
	nslookup www.google.com 127.0.0.1
	nslookup www.facebook.com 127.0.0.1
	nslookup www.github.com 127.0.0.1
	make -f test_settings.mk check-cache
	nslookup www.iqiyi.com 127.0.0.1
	nslookup www.google.com 127.0.0.1
	nslookup www.facebook.com 127.0.0.1
	nslookup www.github.com 127.0.0.1
	make -f test_settings.mk check-cache


check-cache:
	make testflow_log | grep cache


domain-hint:
	make -s -f basic.mk hint CONTENT="domain should be forwarded to 144.144.144.144"

new-china:
	nslookup icloud.com 127.0.0.1
	make testflow_log | grep "icloud.com"
	make -f test_settings.mk domain-hint
	nslookup apple.com 127.0.0.1
	make testflow_log | grep "apple.com"
	make -f test_settings.mk domain-hint
	nslookup www.google-analytics.com 127.0.0.1
	make testflow_log | grep "www.google-analytics.com"
	make -f test_settings.mk domain-hint
	nslookup www-google-analytics.l.google.com 127.0.0.1
	make testflow_log | grep "www-google-analytics.l.google.com"
	make -f test_settings.mk domain-hint
	make -f basic.mk confirm

inner-domain:
	nslookup tutu.com 127.0.0.1
	make -s -f basic.mk hint CONTENT="tutu.com shoule be resolved to 192.168.0.1" 
	nslookup xxx.yyy.com 127.0.0.1
	make -s -f basic.mk hint CONTENT="xxx.yyy.com shoule be resolved to 192.168.0.219" 
	nslookup apiv3.x0y1.com 127.0.0.1
	make -s -f basic.mk hint CONTENT="apiv3.* should be resolved to 106.15.205.35" 
	nslookup web.x0y1.com 127.0.0.1
	make -s -f basic.mk hint CONTENT="web.* shoule be resolved to 106.15.205.35" 
	nslookup local 127.0.0.1
	make -s -f basic.mk hint CONTENT="local should be resolved to 127.0.0.1"

static-ip:
	make -s -f basic.mk hint CONTENT="please change static setting and check whether ip changed accordingly!"
