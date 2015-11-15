import vim,os,platform,subprocess,webbrowser,json,re,string,time,sys
import urllib2 as request
from urllib2 import HTTPError
from itertools import groupby

URL = "localhost"
PORT = 8124
TIMEOUT = 10000
opener = request.build_opener(request.ProxyHandler({}))
def makeRequest(doc):
    payload = json.dumps(doc)
    try:
        requrl = "http://"+URL+":"+str(PORT)+"/"
        print(requrl,payload )
        req = opener.open(requrl,payload,TIMEOUT)
        result = req.read()
        vim.command('let s:py_result = '+result)
    except HTTPError as error:
        print(error)
        return None

