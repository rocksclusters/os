#
# $Id: Makefile,v 1.24 2012/11/27 00:49:11 phil Exp $
#
# @Copyright@
# 
# 				Rocks(r)
# 		         www.rocksclusters.org
# 		         version 6.2 (SideWinder)
# 		         version 7.0 (Manzanita)
# 
# Copyright (c) 2000 - 2017 The Regents of the University of California.
# All rights reserved.	
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
# 
# 1. Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
# 
# 2. Redistributions in binary form must reproduce the above copyright
# notice unmodified and in its entirety, this list of conditions and the
# following disclaimer in the documentation and/or other materials provided 
# with the distribution.
# 
# 3. All advertising and press materials, printed or electronic, mentioning
# features or use of this software must display the following acknowledgement: 
# 
# 	"This product includes software developed by the Rocks(r)
# 	Cluster Group at the San Diego Supercomputer Center at the
# 	University of California, San Diego and its contributors."
# 
# 4. Except as permitted for the purposes of acknowledgment in paragraph 3,
# neither the name or logo of this software nor the names of its
# authors may be used to endorse or promote products derived from this
# software without specific prior written permission.  The name of the
# software includes the following terms, and any derivatives thereof:
# "Rocks", "Rocks Clusters", and "Avalanche Installer".  For licensing of 
# the associated name, interested parties should contact Technology 
# Transfer & Intellectual Property Services, University of California, 
# San Diego, 9500 Gilman Drive, Mail Code 0910, La Jolla, CA 92093-0910, 
# Ph: (858) 534-5815, FAX: (858) 534-7345, E-MAIL:invent@ucsd.edu
# 
# THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS''
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
# IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# 
# @Copyright@
#
# $Log: Makefile,v $
# Revision 1.24  2012/11/27 00:49:11  phil
# Copyright Storm for Emerald Boa
#
# Revision 1.23  2012/05/06 05:49:18  phil
# Copyright Storm for Mamba
#
# Revision 1.22  2011/07/23 02:31:15  phil
# Viper Copyright
#
# Revision 1.21  2010/09/07 23:53:24  bruno
# star power for gb
#
# Revision 1.20  2009/05/01 19:07:21  mjk
# chimi con queso
#
# Revision 1.19  2008/10/31 16:34:56  bruno
# convert more rolls to use new development environment
#
# Revision 1.18  2008/10/18 00:56:13  mjk
# copyright 5.1
#
# Revision 1.17  2008/08/06 21:06:57  bruno
# fixes to build OS roll
#
# Revision 1.16  2008/04/03 15:41:55  bruno
# automate OS roll building
#
# Revision 1.15  2008/03/06 23:41:56  mjk
# copyright storm on
#
# Revision 1.14  2008/02/26 21:37:05  bruno
# tweaks
#
# Revision 1.13  2008/02/26 19:52:55  bruno
# can finally make the OS roll
#
# Revision 1.12  2007/06/23 04:03:55  mjk
# mars hill copyright
#
# Revision 1.11  2006/09/11 22:49:56  mjk
# monkey face copyright
#
# Revision 1.10  2006/08/10 00:11:42  mjk
# 4.2 copyright
#
# Revision 1.9  2006/07/02 20:45:58  bruno
# make sure graphs/default exists
#
# Revision 1.8  2006/06/26 22:24:02  bruno
# tweaks in order to build OS roll for rocks 4.2
#
# Revision 1.7  2005/10/12 18:10:32  mjk
# final copyright for 4.1
#
# Revision 1.6  2005/09/16 01:04:10  mjk
# updated copyright
#
# Revision 1.5  2005/05/24 21:23:28  mjk
# update copyright, release is not any closer
#
# Revision 1.4  2005/04/29 01:14:27  mjk
# Get everything in before travel.  Rocks-roll is looking pretty good and
# can now build the os roll (centos with updates).  It looks like only the
# first CDROM of our os/centos roll is needed with 3 extra disks.
#
# - rocks-dist cleanup (tossed a ton of code)
# - rocks-roll growth (added 1/2 a ton of code)
# - bootable rolls do not work
# - meta rolls are untested
# - rocks-dist vs. rocks-roll needs some redesign but fine for 4.0.0
#
# Revision 1.3  2005/03/24 23:01:47  bruno
# the os roll needs the base roll in order to build correctly
#
# Revision 1.2  2005/03/21 23:43:28  bruno
# tweaks
#
#

-include $(ROLLSROOT)/etc/Rolls.mk
include Rolls.mk

default: roll

pretar:: graph.py
	-mkdir -p graphs/default
	./graph.py > graphs/default/os.xml
	./yumconf.sh > yum.conf
	-mkdir -p $(ROLLDIR)/CentOS/$(CENTOS_VERSION)/$(ARCH)/RedHat/base
ifeq ($(VERSION.MAJOR), 6)
	cp $(ROLLDIR)/kernel/$(KERNEL_VERSION)/$(ARCH)/RedHat/base/comps.xml \
		$(ROLLDIR)/CentOS/$(CENTOS_VERSION)/$(ARCH)/RedHat/base
endif	
ifeq ($(VERSION.MAJOR), 7)
	rocks create distro
	cp  rocks-dist/$(ARCH)/RedHat/base/comps.xml \
		$(ROLLDIR)/CentOS/$(CENTOS_VERSION)/$(ARCH)/RedHat/base
	-/bin/rm -rf rocks-dist
endif	


clean::
	rm -f graphs/default/os.xml yum.conf yum.log
	rm -f comps.xml comps.xml.orig
	rm -f _arch
	rm -rf rocks-dist-all rocks-dist-os
	rm -rf cache

