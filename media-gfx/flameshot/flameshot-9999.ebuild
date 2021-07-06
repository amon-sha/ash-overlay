# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake desktop xdg git-r3

DESCRIPTION="Powerful yet simple to use screenshot software"
HOMEPAGE="https://flameshot.org https://github.com/flameshot-org/flameshot"

EGIT_REPO_URI="https://github.com/flameshot-org/${PN}"
SRC_URI=""

KEYWORDS=""

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	=dev-qt/qtsingleapplication-2.6*[qt5(+),X]
	dev-qt/qtwidgets:5
	dev-qt/qtsvg:5
	dev-qt/qtnetwork:5
	dev-qt/qtdbus:5
	sys-apps/dbus
	dev-libs/spdlog
"
BDEPEND="
	dev-qt/linguist-tools:5
"
RDEPEND="${DEPEND}"
PATCHES=(
	"${FILESDIR}/remove_shell_completions.patch"
	"${FILESDIR}/dont-force-ccache.patch"
)

src_prepare() {
	rm -r external/spdlog || die
	rm -r external/singleapplication || die

	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DUSE_EXTERNAL_SPDLOG=1
		-DUSE_EXTERNAL_SINGLEAPPLICATION=1
	)

	cmake_src_configure
}
