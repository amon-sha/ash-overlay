# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_RECIPE_DOC="none"
RUBY_FAKEGEM_RECIPE_TEST="none"

inherit ruby-fakegem

SRC_URI="https://github.com/libyui/libyui-bindings/archive/v${PV}.tar.gz -> ${P}.tar.gz"
DESCRIPTION="Ruby client bindings for libyui"
HOMEPAGE="https://github.com/libyui/libyui-bindings"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND+=">=x11-libs/libyui-3.2.5"
DEPEND+="${RDEPEND} dev-lang/swig"

RUBY_S="libyui-bindings-${PV}/swig/ruby"

all_ruby_prepare() {
	mkdir -p lib/yui
	swig -I/usr/include -c++ -ruby -autorename -o ruby_yui.cxx ../yui.i
}

each_ruby_configure() {
	ruby extconf.rb
}

each_ruby_compile() {
	emake V=1
	mv _yui$(get_modname) lib/yui$(get_modname) || die
}
