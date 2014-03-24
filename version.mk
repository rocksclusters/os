ROLLNAME	= os
RELEASE		= 0
COLOR		= white
OSNAME		= CentOS
ifeq ($(VERSION.MAJOR), 5)
OSVERSION	= 5.8
else
OSVERSION 	= 6.5
endif

UPDATESNAME	= Updates-$(OSNAME)-$(OSVERSION)

ROLLDIR		= $(shell rocks report distro)/rolls

CENTOS_VERSION	= \
	$(shell rocks list roll $(OSNAME) output-header=no output-col=version)
UPDATES_VERSION	= \
	$(shell rocks list roll $(UPDATESNAME) output-header=no output-col=version)
KERNEL_VERSION	= \
	$(shell rocks list roll kernel output-header=no output-col=version)

ROLLS		= $(OSNAME),$(CENTOS_VERSION) $(UPDATESNAME),$(UPDATES_VERSION)
REDHAT.ROOT	= $(PWD)

