# Copyright 2008 Calculate Pack, http://www.calculate-linux.ru
# Distributed under the terms of the GNU General Public License v2

inherit distutils subversion

ESVN_REPO_URI="http://svn.calculate.ru/calculate2/calculate-lib/trunk/"

DESCRIPTION="The library for Calculate 2"
HOMEPAGE="http://www.calculate-linux.ru/Calculate2"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-python/python-ldap-2.0[ssl]
        >=dev-python/pyxml-0.8"
