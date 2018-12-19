#!/usr/bin/env python3.6

import os
import yaml
from shutil import copy
import argparse
import confgenerator.generator.generator as gen

pwd = os.path.dirname(os.path.realpath(__file__))

parser = argparse.ArgumentParser(description='Generate the dnsmasq configuration.')
parser.add_argument('-f', dest='info')
parser.add_argument('-d', '--destination', dest='path', default=pwd+'/../dnsmasq')

args = vars(parser.parse_args())
info = args['info']
path = args['path']

info_dict = yaml.load(open(info, 'r'))

os.makedirs(path)
copy(pwd+'/accelerated-domains.china.conf', path)

# copy files from [dnsconf-dir] to [path]
conf_dir=info_dict.pop('dnsconf-dir')
files = os.listdir(conf_dir)
for file in files:
    full_file_name = os.path.join(conf_dir, file)
    if (os.path.isfile(full_file_name)):
        copy(full_file_name, path)

for key, val in info_dict.items():
    generator = getattr(gen, "Gen_"+key.replace('-', '_'))
    generator(val, path).write()
