# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_6 python3_7 )

: ${CMAKE_MAKEFILE_GENERATOR:=ninja}
inherit git-r3 cmake-utils python-single-r1

DESCRIPTION="CAD from a parallel universe"
HOMEPAGE="http://www.mattkeeter.com/projects/antimony/3/"
EGIT_REPO_URI="https://github.com/mkeeter/antimony.git"

LICENSE="MIT"

SLOT="0"

KEYWORDS=""

IUSE="python"

DEPEND="
	dev-util/lemon
	dev-util/ninja
	sys-devel/flex
	dev-libs/boost[python]
	media-libs/libpng
	dev-qt/qtcore:5
	python? ( ${PYTHON_DEPS} )
	"
RDEPEND="${DEPEND}"

PATCHES="${FILESDIR}/gentoo.patch"

pkg_setup() {
	use python && python-single-r1_pkg_setup
}
