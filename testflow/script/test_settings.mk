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
	make -s -f basic.mk hint CONTENT="first cache log"
	sleep 3
	nslookup www.iqiyi.com 127.0.0.1
	nslookup www.google.com 127.0.0.1
	nslookup www.facebook.com 127.0.0.1
	nslookup www.github.com 127.0.0.1
	make -f test_settings.mk check-cache
	make -s -f basic.mk hint CONTENT="second cache log,cache time should be diff from first cache"
	sleep 7
	nslookup www.iqiyi.com 127.0.0.1
	nslookup www.google.com 127.0.0.1
	nslookup www.facebook.com 127.0.0.1
	nslookup www.github.com 127.0.0.1
	make -f test_settings.mk check-cache
	make -s -f basic.mk hint CONTENT="No new cache log, cache time should be same with second cache"
	nslookup www.iqiyi.com 127.0.0.1
	nslookup www.google.com 127.0.0.1
	nslookup www.facebook.com 127.0.0.1
	nslookup www.github.com 127.0.0.1
	make -f test_settings.mk check-cache
	make -s -f basic.mk hint CONTENT="new cache log, cache time should be diff with second cache"

.PHONY: check-cache
check-cache:
	make testflow_log | grep cache

.PHONY: domain-hint
domain-hint:
	make -s -f basic.mk hint CONTENT="domain should be forwarded to 144.144.144.144"

.PHONY: new-china
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

.PHONY: inner-domain
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

.PHONY: static-ip
static-ip:
	make -s -f basic.mk hint CONTENT="please change static setting before resarting dns"
	make -f basic.mk confirm
	make -f manage_prod.mk gen_proj_conf
	make testflow_restart
	make -s -f basic.mk hint CONTENT="Please connect the pc behind dns and check static ip"
	make -f basic.mk confirm
	make -s -f basic.mk hint CONTENT="please omit static setting before resarting dns to test dhcp-range"
	make -f basic.mk confirm
	make -f manage_prod.mk gen_proj_conf
	make testflow_restart
	make -s -f basic.mk hint CONTENT="Please connect the pc behind dns and check dynamic ip"
	make -f basic.mk confirm

.PHONY: 
dns-forward-concurrent:
	make -s -f basic.mk hint CONTENT="Please set dns-forward-max to 15 and cache-size to 0"
	make -f basic.mk confirm
	make -f manage_prod.mk gen_proj_conf
	make testflow_restart
	node dnsquery.js
	make testflow_log | grep concu
	make -s -f basic.mk hint CONTENT="You should see a log 'Maximum number of concurrent DNS queries reached (max: 15)'"
	make -s -f basic.mk hint CONTENT="Please set dns-forward-max to 500 and cache-size to 0"
	make -f basic.mk confirm
	make -f manage_prod.mk gen_proj_conf
	make testflow_restart
	node dnsquery.js
	make testflow_log | grep concu
	make -s -f basic.mk hint CONTENT="You should not see any logs about 'Maximum number of concurrent DNS queries reached (max: 500)'"
	

