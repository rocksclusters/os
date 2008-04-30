echo "[main]
cachedir=$PWD/cache
keepcache=0
debuglevel=2
logfile=$PWD/yum.log
pkgpolicy=newest
distroverpkg=redhat-release
tolerant=1
exactarch=1
obsoletes=1
gpgcheck=0
plugins=0
metadata_expire=1800
reposdir=$PWD

[rocks-dist-os]
name=rocks-dist-os
baseurl=file://$PWD/rocks-dist-os/lan/\$basearch"
