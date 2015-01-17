#!/usr/bin/python
# extract all links from provided URL(s)
# ray@truedays 01/15/2015
import sys
import requests
from bs4 import BeautifulSoup

apikey = KEYKEYKEY
#print sys.argv

if len(sys.argv) < 2:
 print "Please provide at least one URL!"
 r = requests.get('http://localhost:8080/bustime/api/v1/gettime?key=KEYKEYKEY')
# print r.status_code
 soup = BeautifulSoup(r.text)
 links = soup.find_all('a')
 linkCount = str(len(links))

 print " ----- " + linkCount + " links extracted ----- "
 #print soup.find_all('a')
 for link in links:
  print link.get('href')

