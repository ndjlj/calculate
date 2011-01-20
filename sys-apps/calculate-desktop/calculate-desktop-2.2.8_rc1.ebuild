# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit distutils git

EGIT_COMMIT="32f22e8f1d1fa93017502c40e4044ede01889203"
EGIT_REPO_URI="git://git.calculate.ru/calculate-desktop.git"

DESCRIPTION="The program of the desktop configuration Calculate Linux"
HOMEPAGE="http://www.calculate-linux.org/main/en/calculate2"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="kde xfce gnome"

DEPEND="~sys-apps/calculate-lib-2.2.8_rc1
	!<sys-apps/calculate-client-2.2.0
	>=dev-python/python-ldap-2.0[ssl]
	xfce? ( x11-misc/xdialog )
	gnome? ( x11-misc/xdialog )
	kde? ( kde-base/kdialog )"

RDEPEND="${DEPEND}"

src_unpack() {
	git_src_unpack
	cd "${S}"

	#bugfix wrong chromium configure
	#epatch "${FILESDIR}/calculate-desktop-2.2.0.0_rc1-r1.patch"
}

pkg_postinst() {
	#${EROOT}/usr/lib/calculate-2.2/calculate-desktop/bin/install
	einfo "For configure calculate-desktop perform:"
	einfo "  cl-desktop --install"
	if use kde || use xfce || use gnome
	then
		einfo "  /etc/init.d/xdm restart"
	fi
}

pkg_prerm() {
	:
	#${EROOT}/usr/lib/calculate-2.2/calculate-desktop/bin/uninstall
}
