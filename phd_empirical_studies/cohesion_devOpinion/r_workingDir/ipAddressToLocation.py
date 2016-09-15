# First generate the ipAddresses.txt in R
#source("survey_44763_R_syntax_file.R", encoding = "UTF-8")
#write.table(data[,15], file="ipAddresses.txt", row.names=FALSE, col.names=FALSE, quote=FALSE)

import urllib2
f_output = open("ipLocations.csv", "w")

with open("ipAddresses.txt", "r") as f_input:
    for line in f_input:
        response = urllib2.urlopen('http://www.ipaddressapi.com/l/639336000f618f1715c8eb9ad6feb2cd6b6a1c1aeba0?h='+line)        
        f_output.write(response.read()+"\n")

f_output.close
