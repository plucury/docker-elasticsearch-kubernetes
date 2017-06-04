This package contains generated TLS certificates to be used with Search Guard.

Structure:                                                             

search-guard-certificates-<UUID>.tar.gz 
│
└─── client-certificates
│        Contains two client certificates named 'admin' and 'demouser'
│        The admin certificate can be used with sgadmin and the REST API. 
│        The CN of this certificate is 'sgadmin'. The demouser certificate can be used 
│        for HTTPS client authentication. 
└─── node-certificates
│        Contains the certificates in jks, p12 and pem format to be used 
│        on your Elasticsearch nodes. You will fin certificates for all 
│        hostnames you specified when submitting the form.
└─── root-ca
│        Contains the root CA certificate and private key.
└─── config
│        Same as above, but for the signing CA
└─── truststore.jks
│        The truststore containing the certificate chain
│        of the root and signing CA. Can be used on all nodes.
                                                             
                                                             
Passwords:                                                             

CA password: 698d358847d0ccad87d73e3385b9aa084a08ab29                                       
Truststore password: 5137bbec2b594ce379f4                               
Admin keystore password: 7920aebbd1d978993753                       
Demouser keystore password: fd516efef73f2a556c75               
                                                              
                                                             
                                                             
Host: waiverforeverk8s.com                                                 
waiverforeverk8s.com keystore password: 514e4edd5962c21a0402                           
                                                             
searchguard.authcz.admin_dn:                                
  - CN=sgadmin  
