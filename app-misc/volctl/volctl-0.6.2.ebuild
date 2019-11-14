# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6,7} )
inherit distutils-r1

DESCRIPTION="Volume control for GNU/Linux desktops featuring per-app sliders."
HOMEPAGE="https://buzz.github.io/volctl/"
SRC_URI="https://github.com/buzz/${PN}/archive/${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="media-sound/pulseaudio
	dev-python/pygobject:3"
RDEPEND="${DEPEND}"
BDEPEND=""

pkg_postinst() {
	glib-compile-schemas /usr/share/glib-2.0/schemas
}