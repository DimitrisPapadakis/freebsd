.include <src.opts.mk>

SUBDIR= ibaddr ibnetdiscover ibping ibportstate ibroute ibsendtrap ibstat \
	ibsysstat ibtracert opensm perfquery saquery \
	sminfo smpdump smpquery vendstat

SUBDIR.${MK_TESTS}+= osmtest

SUBDIR_PARALLEL=

.include <bsd.subdir.mk>
