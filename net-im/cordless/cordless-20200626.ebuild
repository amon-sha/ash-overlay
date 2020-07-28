# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGO_VENDOR=(
"github.com/Bios-Marcel/discordemojimap v1.0.1"
"github.com/Bios-Marcel/discordgo c4db4289dc2f"
"github.com/Bios-Marcel/femto a733a9347742"
"github.com/Bios-Marcel/goclipimg d0f7b06fbe82"
"github.com/Bios-Marcel/shortnotforlong v1.1.1"
"github.com/Bios-Marcel/tview 9e022c4dffcd"
"github.com/alecthomas/chroma v0.6.6"
"github.com/atotto/clipboard v0.1.2"
"github.com/gdamore/tcell bac2bbc5b394"
"github.com/gen2brain/beeep aa3d7c1499fd"
"github.com/godbus/dbus v4.1.0"
"github.com/google/go-github/v29 v29.0.2 github.com/google/go-github"
"github.com/gopherjs/gopherwasm v1.1.0"
"github.com/gorilla/websocket v1.4.2"
"github.com/mattn/go-runewidth v0.0.7"
"github.com/mdp/qrterminal/v3 v3.0.0 github.com/mdp/qrterminal"
"github.com/nu7hatch/gouuid 179d4d0c4d8d"
"github.com/pkg/errors v0.8.1"
"github.com/robertkrimen/otto 15f95af6e78d"
"github.com/tadvi/systray 11a2b8fa57af"
"golang.org/x/crypto 75b288015ac9 github.com/golang/crypto"
"golang.org/x/sys ed371f2e16b4 github.com/golang/sys"
"gopkg.in/sourcemap.v1 v1.0.5 github.com/go-sourcemap/sourcemap"
"gopkg.in/toast.v1 0a84660828b2 github.com/go-toast/toast"
"rsc.io/qr v0.2.0 github.com/rsc/qr"
"github.com/danwakefield/fnmatch cbb64ac3d964"
"github.com/dlclark/regexp2 v1.1.6"
"github.com/gdamore/encoding v1.0.0"
"github.com/lucasb-eyer/go-colorful v1.0.3"
"github.com/rivo/uniseg v0.1.0"
"github.com/sergi/go-diff v1.1.0"
"github.com/google/go-querystring v1.0.0"
"golang.org/x/text v0.3.2 github.com/golang/text"
)

inherit golang-build golang-vcs-snapshot
EGO_PN="github.com/Bios-Marcel/cordless/"

MY_PV="${PV::4}-${PV:4:2}-${PV:6:2}"

DESCRIPTION="The Discord terminal client you never knew you wanted."
HOMEPAGE="https://github.com/Bios-Marcel/cordless"
SRC_URI="https://github.com/Bios-Marcel/cordless/archive/2020-06-26.tar.gz -> ${PN}-${MY_PV}.tar.gz
	${EGO_VENDOR_URI}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
RESTRICT="mirror"

src_install() {
	dobin cordless
}


pkg_postinst() {
	einfo "type cordless to start"
	einfo "for manual press ALT+Dot and type 'manual'"
}
