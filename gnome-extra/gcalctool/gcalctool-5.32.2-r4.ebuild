# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/gnome-extra/gcalctool/gcalctool-5.32.2.ebuild,v 1.10 2013/05/14 20:51:53 pacho Exp $

EAPI="7"
GNOME_TARBALL_SUFFIX="bz2"
GNOME2_EAUTORECONF=yes

inherit gnome2

DESCRIPTION="A calculator application for GNOME"
HOMEPAGE="http://live.gnome.org/Gcalctool http://calctool.sourceforge.net/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm ia64 ppc ppc64 sh sparc x86 ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND=">=x11-libs/gtk+-2.18:2
	>=dev-libs/glib-2.25.10:2
	dev-libs/libxml2:2
	!<gnome-extra/gnome-utils-2.3
	!gnome-extra/gnome-calculator
"
DEPEND="${RDEPEND}
	sys-devel/gettext
	>=dev-util/intltool-0.35
	virtual/pkgconfig
"
PATCHES=(
	"${FILESDIR}/${P}-missing-header.patch"
	"${FILESDIR}/${P}-no-help.patch"
)

src_prepare() {
	gnome2_src_prepare
}

src_configure() {
	DOCS="AUTHORS ChangeLog* NEWS README"
	gnome2_src_configure \
		--with-gtk=2.0
}
