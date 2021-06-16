# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="\"Race for the Galaxy\" card game."
HOMEPAGE="https://github.com/bnordli/rftg"
SRC_URI="https://github.com/bnordli/rftg/archive/${PV}.tar.gz"

RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 amd64"

DEPEND="x11-libs/gtk+:2"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}/src"

src_prepare()
{
	default
	eautoreconf
}
