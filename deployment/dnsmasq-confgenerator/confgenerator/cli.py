#!/usr/bin/env python3.6

import os
import yaml
from shutil import copy
import argparse
import confgenerator.generator.generator as gen

pwd = os.path.dirname(os.path.realpath(__file__))

parser = argparse.ArgumentParser(description='Generate the dnsmasq configuration.')
parser.add_argument('conf-info')
parser.add_argument('-d', '--destination', dest='path', default=pwd+'/../dnsmasq')

args = vars(parser.parse_args())
info = args['conf-info']
path = args['path']

os.makedirs(path+'/dnsmasq_conf')
copy(pwd+'/accelerated-domains.china.conf', path+'/dnsmasq_conf')

info_dict = yaml.load(open(info, 'r'))
for key, val in info_dict.items():
    generator = getattr(gen, "Gen_"+key.replace('-', '_'))
    generator(val, path+'/dnsmasq_conf').write()

f = open(path+'/dns-config.env', 'w')
f.write("CONF_DIR="+path+'/dnsmasq_conf')
f.close