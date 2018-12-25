const dns = require('dns')

dns.setServers(["127.0.0.1"])

i=0

while (i< 500) { 

dns.resolve("www.google.com", (err,records) => {
        if(err) 
					console.log(err)
				else        
					console.log("addresses:" +  records)

})

i++;
}
