import sys
import requests
from bs4 import BeautifulSoup
apikey = "?key=KEYKEYKEY"
apicmd = "gettime"
apiargv = ""

r = requests.get('http://www.ctabustracker.com/bustime/api/v1/' + apicmd + apikey + apiargv)
print r
print r.text
soup = BeautifulSoup(r.text)
print soup

