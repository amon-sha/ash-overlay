# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs eutils versionator

DESCRIPTION="A LALR(1) parser generator."
HOMEPAGE="http://www.hwaci.com/sw/lemon/"
LICENSE="public-domain"

SRC_PV="$(printf "%u%02u%02u%02u" $(get_version_components))"

SRC_URI="https://sqlite.org/2018/sqlite-src-${SRC_PV}.zip"

KEYWORDS="x86 amd64"
SLOT="0"

S="${WORKDIR}/sqlite-src-${SRC_PV}"

PATCHES="${FILESDIR}/gentoo.patch"

src_configure() {
	true
}

src_compile() {
	"$(tc-getCC)" -o lemon tool/lemon.c || die
}

src_install() {
	dodir /usr/share/lemon/
	insinto /usr/share/lemon/
	doins tool/lempar.c
	dobin lemon
}
