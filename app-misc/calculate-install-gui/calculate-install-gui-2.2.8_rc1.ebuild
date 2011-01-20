# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit git

EGIT_COMMIT="e45b8b0a6e4eb402b3832c6fab25c3c674bfe9ac"
EGIT_REPO_URI="git://git.calculate.ru/calculate-install-gui.git"

DESCRIPTION="GUI frontend for the program of installation Calculate Linux"
HOMEPAGE="http://www.calculate-linux.org/main/en/calculate2"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="~sys-apps/calculate-install-2.2.8_rc1
	x11-libs/qtermwidget
	x11-libs/qt-core"

RDEPEND="${DEPEND}"

src_configure() {
	CMAKE_PREFIX_PATH=/usr  cmake .
}

src_compile() {
	emake || die "make failed"
}

src_install() {
	emake DESTDIR="${D}" install || die 'make install failed'
	dodoc README
}
