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
	mkdir -p ext/yui lib/yui

	mv yui.rb lib
	mv extconf.rb ext/yui

	sed '/yui\/version/ d' yui/yui.rb > lib/yui/yui.rb
	sed "s/@VERSION@/${PV}/" yui.gemspec.in > yui.gemspec

	swig -I/usr/include -c++ -ruby -autorename -o ext/yui/ruby_yui.cxx ../yui.i
}

each_ruby_configure() {
	ruby -Cext/yui extconf.rb
}

each_ruby_compile() {
	emake -Cext/yui V=1
	mv ext/yui/_yui$(get_modname) lib/yui || die
}
