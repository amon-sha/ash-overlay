# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# modified from ebuild available in the touchfish-os overlay

EAPI=8
MULTILIB_COMPAT=(abi_x86_{32,64})
inherit multilib-minimal

_internal_name=GE-Proton${PV/./-}
DESCRIPTION="A fancy custom distribution of Valves Proton with various patches"
HOMEPAGE="https://github.com/GloriousEggroll/proton-ge-custom"
SRC_URI="https://github.com/GloriousEggroll/proton-ge-custom/releases/download/${_internal_name}/${_internal_name}.tar.gz -> ${P}.tar.gz"
LICENSE="BSD LGPL zlib MIT MPL OFL Proton GPL MSPL"
SLOT="11"
KEYWORDS="~amd64"
RESTRICT="mirror strip"

RDEPEND="
	dev-libs/libxml2-compat[${MULTILIB_USEDEP}]
	dev-libs/openssl-compat:1.1.1[${MULTILIB_USEDEP}]
	media-video/ffmpeg-compat:4
	media-libs/libtheora[${MULTILIB_USEDEP}]
	media-libs/gst-plugins-base[${MULTILIB_USEDEP}]
	media-libs/graphene
	media-libs/gst-plugins-bad
	dev-libs/libgudev[${MULTILIB_USEDEP}]
	media-libs/libjpeg-turbo[${MULTILIB_USEDEP}]
	dev-libs/libusb[${MULTILIB_USEDEP}]
	media-libs/libva[${MULTILIB_USEDEP}]
	x11-libs/libvdpau[${MULTILIB_USEDEP}]
	media-sound/mpg123[${MULTILIB_USEDEP}]
	media-libs/speex[${MULTILIB_USEDEP}]
	media-libs/openal[${MULTILIB_USEDEP}]
	app-emulation/vkd3d-proton[${MULTILIB_USEDEP}]
	net-libs/libsoup
	dev-lang/python
	media-libs/mesa[vulkan,${MULTILIB_USEDEP}]
	media-libs/vulkan-loader[${MULTILIB_USEDEP}]"

QA_PREBUILT={*}
S="${WORKDIR}"

src_install() {
	insinto "/usr/share/steam/compatibilitytools.d/"
	dodir "/usr/share/steam/compatibilitytools.d/${_internal_name}"
	doins -r "${S}/${_internal_name}"

	sed -i "s%\"install_path\" \".\"%\"install_path\" \"/usr/share/steam/compatibilitytools.d/${_internal_name}\"%" "${D}/usr/share/steam/compatibilitytools.d/${_internal_name}/compatibilitytool.vdf" || die

	# need to keep empty dirs or else failures occur when copying base prefix?
	# find GE-Proton8-4 -depth -empty | sed 's/GE-Proton8-4/keepdir \"\/usr\/share\/steam\/compatibilitytools.d\/\/\$\{_internal_name\}/g' | sed 's/$/\"/g'
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/lib/i386-w64-mingw32"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/lib/x86_64-w64-mingw32"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/lib/cmake/kaldi"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/lib/x86_64-linux-gnu/cmake/libxml2"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/lib/x86_64-linux-gnu/cmake/openxr"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/lib/x86_64-linux-gnu/graphene-1.0/include"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/lib/x86_64-linux-gnu/fst"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/lib/x86_64-linux-gnu/glslang"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/lib/x86_64-linux-gnu/pkgconfig"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/lib/pkgconfig"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/lib/i386-linux-gnu/cmake/libxml2"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/lib/i386-linux-gnu/graphene-1.0/include"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/lib/i386-linux-gnu/fst"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/lib/i386-linux-gnu/glslang"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/lib/i386-linux-gnu/pkgconfig"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/windows/logs"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/windows/Fonts"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/windows/system32/catroot"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/windows/system32/spool/printers"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/windows/system32/tasks"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/windows/system32/mui"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/windows/syswow64/mui"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/windows/tasks"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/windows/help"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/windows/security"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/windows/Microsoft.NET/DirectX for Managed Code"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/windows/performance/winsat/datastore"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/windows/temp"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Videos"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/LocalLow"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Local/Microsoft/Windows/History"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Local/Microsoft/Windows/INetCookies"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Local/Microsoft/Windows/INetCache"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Local/Temp"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Roaming/Microsoft/Windows/AccountPictures"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/StartUp"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Administrative Tools"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Roaming/Microsoft/Windows/Themes"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Roaming/Microsoft/Windows/Templates"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Roaming/Microsoft/Windows/Printer Shortcuts"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Roaming/Microsoft/Windows/Network Shortcuts"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Roaming/Microsoft/Windows/SendTo"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/AppData/Roaming/Microsoft/Windows/Recent"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Searches"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Links"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Saved Games"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Contacts"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Pictures/Screenshots"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Favorites"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Music"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Downloads"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Desktop"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Documents/Videos"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Documents/Templates"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Documents/Pictures"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Documents/Music"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/steamuser/Documents/Downloads"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/Public/Videos"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/Public/Pictures"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/Public/Music"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/Public/Desktop"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/users/Public/Documents"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/Program Files/Common Files/Microsoft Shared/TextConv"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/ProgramData/Microsoft/Windows/Start Menu/Programs/StartUp"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/ProgramData/Microsoft/Windows/Start Menu/Programs/Administrative Tools"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/drive_c/ProgramData/Microsoft/Windows/Templates"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/default_pfx/dosdevices"
	keepdir "/usr/share/steam/compatibilitytools.d/${_internal_name}/files/share/wine/mono/wine-mono-11.0.0/lib/mono/4.0"
}

pkg_postinst() {
	einfo "changing permission of proton executables"
	find  "${EPREFIX}"/usr/share/steam/compatibilitytools.d/${_internal_name}/proton -exec chmod ugo+x "{}" \;
	find  "${EPREFIX}"/usr/share/steam/compatibilitytools.d/${_internal_name}/files/bin -type f -exec chmod ugo+x "{}" \;
	find  "${EPREFIX}"/usr/share/steam/compatibilitytools.d/${_internal_name}/protonfixes/winetricks -exec chmod ugo+x "{}" \;
	chmod +x "${EPREFIX}"/usr/share/steam/compatibilitytools.d/${_internal_name}/files/lib/wine/{i386,x86_64}-unix/wine{,64}{,-preloader}
}
