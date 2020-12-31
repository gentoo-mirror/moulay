# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )
inherit python-r1

DESCRIPTION="A simple Blue Light Filter for X"
HOMEPAGE="https://github.com/jumper149/blugon"
if [[ ${PV} == 9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/jumper149/blugon"
else
	SRC_URI="https://github.com/jumper149/${PN}/archive/${PV}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="Apache-2.0"
SLOT="0"
IUSE="xgamma"

DEPEND="
	x11-libs/libX11
	x11-libs/libXrandr
	xgamma? ( x11-apps/xgamma )
"
RDEPEND="${DEPEND}"

PATCHES=( ${FILESDIR}/${PN}-no-manpage-compression.patch )