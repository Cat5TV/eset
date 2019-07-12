# ESET Tools by Robbie Ferguson

These tools are scripts I've written to help me or my customers. They're not necessarily "officially endorsed" by ESET, though ESET may at times use them to support customers. Feel free to use them in your environment. Always have a good backup, because most of these scripts do something that could be destructive. They're here to make usually complicated tasks simple. Hope you enjoy!

## Tool # 1: Install MDC on ERA OVA (v6) or ESMC OVA (v7)

Activate your ERA or ESMC server as a standard management server, and then SSH to the appliance and run the following command to add ESET Mobile Device Connector to it. This removes the need to have a separate ESET Mobile Connector virtual appliance running on your hypervisor and puts both components on the same virtual server.

### For ESET Security Management Center (ESMC v7)
```
yes | yum install git && mkdir -p /root/eset_installers/thirdparty/ && cd /root/eset_installers/thirdparty/ && git clone https://github.com/Cat5TV/eset && /root/eset_installers/thirdparty/eset/esmcmdc prep
```

### For ESET Remote Administrator (ERA v6)
```
yes | yum install git && mkdir -p /root/eset_installers/thirdparty/ && cd /root/eset_installers/thirdparty/ && git clone https://github.com/Cat5TV/eset && /root/eset_installers/thirdparty/eset/eramdc prep
```

Following installation, you must:

1. Create a ESET Mobile Device Connector certificate. Use your appliance's LAN IP address as the hostname.
2. Create a ESET Mobile Device policy. Add the certificate, and assign it to your ERA/ESMC appliance.

## Tool # 2: Uninstall ESET Management Agent / ESET Remote Administrator Agent

Should you need to uninstall your ESET agent without a Client Task (as would be the case if your ERA/ESMC server was no longer available), you can use [uninstallers/eset-uninstall-agent.bat](uninstallers/eset-uninstall-agent.bat) as a GPO, or manually run as administrator.

## Tool # 3: Install ESET Security Management Center on Debian Buster

If a pre-built appliance isn't available for your platform, or you want to port ESMC to a new architecture, this is your chance! All requirements will be met, and your vanilla Debian Buster installation will become an ESET Security Management Center appliance. [installers/esmc_debian](installers/esmc_debian) should only be run on vanilla installs (destructive).

A side effect of this script is that you end up with a much more current ESET Security Management Center appliance running on Debian Buster rather than an old distro with old packages. For example, the official ESMC distributable virtual appliance is based on CentOS 7.5 and uses OpenSSL 1.0 (!!), Tomcat7 and OpenJDK 8. My install uses Debian Buster, OpenSSL 1.1, Tomcat9 and OpenJDK 11.

To install, first deploy your Debian Buster installation.

If using a virtual machine, use a minimum of 2 CPU cores (4 recommended) and 2 GB RAM (4 recommended). If your network has more than 5,000 endpoints, it is suggested to double that: 8 cores, 8 GB RAM. 80 GB hard disk will suffice, and it is recommended to make it thick-provisioned if you have more than 20 endpoints.

Once installed, access your server at https://IPADDRESS:8443/

Your first action should be: More->Users->Administrator->Edit->Set Password

Default password is eraadmin
