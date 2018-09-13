# ESET Tools by Robbie Ferguson

## Install MDC on ERA OVA (v6) or ESMC OVA (v7)

Activate your ERA or ESMC server as a standard management server, and then SSH to the appliance and run the following command to add ESET Mobile Device Connector to it. This removes the need to have a separate ESET Mobile Connector virtual appliance running on your hypervisor and puts both components on the same virtual server.

```
yes | yum install git && mkdir -p /root/eset_installers/thirdparty/ && cd /root/eset_installers/thirdparty/ && git clone https://github.com/Cat5TV/eset && /root/eset_installers/thirdparty/eset/eramdc prep
```

Following installation, you must:

1. Create a ESET Mobile Device Connector certificate. Use your appliance's LAN IP address as the hostname.
2. Create a ESET Mobile Device policy. Add the certificate, and assign it to your ERA/ESMC appliance.
