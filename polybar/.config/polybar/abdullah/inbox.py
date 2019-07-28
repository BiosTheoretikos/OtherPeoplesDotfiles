#!/usr/bin/env python

import os
import imaplib
import subprocess
import argparse
import time
import pathlib
from httplib2 import ServerNotFoundError
import urllib.error
from oauth2client import client, file

parser = argparse.ArgumentParser()
parser.add_argument('-b', '--badge', default='\uf0e0')
parser.add_argument('-c', '--color', default='#ff69b4')
parser.add_argument('-m', '--mute', action='store_true')
args = parser.parse_args()

passwordstore = subprocess.check_output(['which', 'pass'])
unread_badge = '%{F' + args.color + '}' + args.badge + ' %{F-}'
error_badge = '%{F' + args.color + '}\uf06a %{F-}'
count_was = 0

def update(count_was):
    completed_process = subprocess.run(['pass', 'mail/abdullah'], check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, encoding="utf-8");
    password = completed_process.stdout[:-1]
    obj = imaplib.IMAP4_SSL('mail.abdullah.today',993)
    obj.login('abdullah', password)
    obj.select()
    count = len(obj.search(None, 'UnSeen')[1][0].split())
    if count>0:
        print(unread_badge + str(count), flush=True)
    else:
        print(args.badge, flush=True)
    if not args.mute and count_was < count and count > 0:
        subprocess.run(['mpv', '--really-quiet', '/home/abdullah/bin/music4scripts/wakhtoona.ogg'])
    return count

while True:
    try:
        if b'/usr/bin/pass\n' in passwordstore:
            count_was = update(count_was)
            time.sleep(10)
        else:
            print(error_badge + 'pass is not installed', flush=True)
            time.sleep(2)
    except (urllib.error.HTTPError, ServerNotFoundError, OSError) as error:
        print(error_badge + str(error), flush=True)
        time.sleep(5)
