# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="An automation and configuration management platform"
HOMEPAGE="https://github.com/PowerShell/PowerShell"
SRC_URI="https://github.com/PowerShell/PowerShell/releases/download/v${PV}/${P}-linux-x64.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="
	sys-libs/libunwind
	net-misc/curl
	dev-libs/openssl
	dev-libs/icu
"
RDEPEND="${DEPEND}"

RESTRICT="strip"

src_unpack() {
	mkdir ${S}
	cd ${S}
	unpack ${A}
}

src_prepare() {
	eapply_user
	rm -f DELETE_ME_TO_DISABLE_CONSOLEHOST_TELEMETRY
}

src_configure() {
	einfo "src_configure skipped"
}

src_compile() {
	einfo "src_compile skipped"
}

src_install() {
	dodir /opt/microsoft/powershell/${PV}
	insinto /opt/microsoft/powershell/${PV}
	exeinto /opt/microsoft/powershell/${PV}
	doins -r *
	doexe pwsh
	dosym /opt/microsoft/powershell/${PV}/pwsh /usr/bin/pwsh
}
