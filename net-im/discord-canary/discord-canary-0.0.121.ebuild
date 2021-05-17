# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils desktop

DESCRIPTION="All-in-one voice and text chat"
HOMEPAGE="https://discordapp.com/"
SRC_URI="https://dl-canary.discordapp.net/apps/linux/${PV}/${P}.tar.gz"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror bindist"

RDEPEND="
	dev-libs/expat
	dev-libs/nss
	media-gfx/graphite2
	media-libs/alsa-lib
	media-libs/libpng
	net-print/cups
	net-libs/gnutls
	sys-libs/zlib
	x11-libs/gtk+
	x11-libs/libnotify
	x11-libs/libxcb
	x11-libs/libXtst
	media-libs/opus
"

S=${WORKDIR}/DiscordCanary

QA_PREBUILT="
	opt/${PN}/DiscordCanary
	opt/${PN}/libEGL.so
	opt/${PN}/libGLESv2.so
	opt/${PN}/libffmpeg.so
	opt/${PN}/swiftshader/libEGL.so
	opt/${PN}/swiftshader/libGLESv2.so
	opt/${PN}/swiftshader/libvk_swiftshader.so
"

src_install() {
	local destdir="/opt/${PN}"

	insinto $destdir
	doins -r locales resources swiftshader *.dat *.pak *.png *.bin *.so

	exeinto $destdir
	doexe DiscordCanary

	dosym $destdir/DiscordCanary "/usr/bin/${PN}"
	make_desktop_entry "${PN}" "Discord Canary" \
		"/opt/${PN}/discord.png" \
		Network
}
