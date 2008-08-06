RELEASE		= 0
COLOR		= white

ROLLDIR		= $(shell rocks report distro)/rolls

CENTOS_VERSION	= \
	$(shell rocks list roll CentOS output-header=no output-col=version)
UPDATES_VERSION	= \
	$(shell rocks list roll updates output-header=no output-col=version)
KERNEL_VERSION	= \
	$(shell rocks list roll kernel output-header=no output-col=version)

ROLLS		= CentOS,$(CENTOS_VERSION) updates,$(UPDATES_VERSION)
REDHAT.ROOT	= $(PWD)

