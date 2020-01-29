# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Dynamic menu library and client program inspired by dmenu."
HOMEPAGE="https://github.com/Cloudef/bemenu"
SRC_URI="https://github.com/Cloudef/${PN}/archive/${PV}.tar.gz"

LICENSE="GPL-3 LGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="ncurses wayland X"
REQUIRED_USE="|| ( ncurses wayland X )"

RDEPEND="
	ncurses? ( sys-libs/ncurses )
	wayland? (
			 dev-libs/wayland
			 x11-libs/cairo
			 x11-libs/pango
			 x11-libs/libxkbcommon
	)
	X? (
	   x11-libs/libX11
	   x11-libs/cairo[X]
	   x11-libs/pango[X]
	)
"
DEPEND="${RDEPEND}"

src_configure() {
	local mycmakeargs=(
		-DBEMENU_CURSES_RENDERER=$(usex ncurses ON OFF )
		-DBEMENU_WAYLAND_RENDERER=$(usex wayland ON OFF)
		-DBEMENU_X11_RENDERER=$(usex X ON OFF)
	)
	cmake-utils_src_configure
}
