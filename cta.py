import sys
import requests
from bs4 import BeautifulSoup
f = open('./.cta-api.key', 'r')
apikey = "?key=" + f.read(25)
f.close()

apicmd = "getpredictions"
apiargv = "&rt=20&stpid=456"
apiargv = "&rt=78&stpid=11321"

print 'http://www.ctabustracker.com/bustime/api/v1/' + apicmd + apikey + apiargv
r = requests.get('http://www.ctabustracker.com/bustime/api/v1/' + apicmd + apikey + apiargv)




print r
print r.text
#soup = BeautifulSoup(r.text)
#print soup


print apikey
