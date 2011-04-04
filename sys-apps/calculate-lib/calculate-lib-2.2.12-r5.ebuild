# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit distutils eutils

SRC_URI="ftp://ftp.calculate.ru/pub/calculate/calculate2/${PN}/${P}.tar.bz2"

DESCRIPTION="The library for Calculate 2"
HOMEPAGE="http://www.calculate-linux.org/main/en/calculate2"
LICENSE="Apache-2.0"
SLOT="2.2"
KEYWORDS="amd64 x86"
IUSE="minimal"
DEPEND="~sys-apps/calculate-templates-2.2.12
	!<sys-apps/calculate-lib-2.1.8-r1
	!=sys-apps/calculate-lib-2.1.9
	!=sys-apps/calculate-lib-2.1.10
	!minimal? ( dev-python/py-smbpasswd )
	>=dev-python/pyxml-0.8
	sys-apps/file[python]"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack "${A}"
	cd "${S}"

	# fix trackback fall in detect initrd
	epatch "${FILESDIR}/calculate-lib-2.2.12-fix_traceback_initrd.patch"
	# fix get type by magic module
	epatch "${FILESDIR}/calculate-lib-2.2.12-fix_magic_type.patch"
	# add exec option for template
	epatch "${FILESDIR}/calculate-lib-2.2.12-exec_option.patch"
	# fix plasma format
	epatch "${FILESDIR}/calculate-lib-2.2.12-fix_plasma_format.patch"
}
