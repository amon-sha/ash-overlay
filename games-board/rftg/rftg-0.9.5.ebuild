# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools games

DESCRIPTION="\"Race for the Galaxy\" card game."
HOMEPAGE="https://github.com/bnordli/rftg"
SRC_URI="https://github.com/bnordli/rftg/archive/${PV}.tar.gz"

RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 amd64"
IUSE=""

DEPEND="x11-libs/gtk+:2"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}/src"

src_prepare()
{
	eautoreconf
}
