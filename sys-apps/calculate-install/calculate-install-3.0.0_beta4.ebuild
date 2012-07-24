# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit distutils eutils

SRC_URI="ftp://ftp.calculate.ru/pub/calculate/calculate3/${PN}/${P}.tar.bz2"

DESCRIPTION="The program of installation Calculate Linux"
HOMEPAGE="http://www.calculate-linux.org/main/en/calculate2"
LICENSE="Apache-2.0"
SLOT="3"
KEYWORDS="~amd64 ~x86"
IUSE="pxe minimal"

DEPEND="~sys-apps/calculate-lib-3.0.0_beta4
	!<sys-apps/calculate-install-2.2.29
	app-portage/layman
	!app-misc/livecd-tools
	sys-apps/iproute2[-minimal]
	!minimal? ( sys-boot/grub
	sys-apps/gptfdisk
	>=sys-apps/util-linux-2.19.1
	sys-fs/dosfstools
	sys-fs/squashfs-tools
	sys-block/parted )
	pxe? ( sys-apps/calculate-server
	net-ftp/tftp-hpa
	net-misc/dhcp
	net-fs/nfs-utils )"

RDEPEND="${DEPEND}"

pkg_postinst() {
	einfo "For install wsdl for calculate-install perform:"
	einfo "  cl-core --append-variable cl_wsdl=calculate-install"
	einfo "  cl-core --append-variable cl_merges=calculate-install"
}
