#!make

.PHONY: ns_lookup
ns_lookup: 
	nslookup www.iqiyi.com 127.0.0.1
	nslookup www.google.com 127.0.0.1
	nslookup www.facebook.com 127.0.0.1
	nslookup www.github.com 127.0.0.1
