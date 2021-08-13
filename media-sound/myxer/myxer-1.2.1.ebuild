# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
anyhow-1.0.38
atk-0.9.0
atk-sys-0.10.0
autocfg-1.0.1
bitflags-1.2.1
cairo-rs-0.9.1
cairo-sys-rs-0.10.0
cc-1.0.67
colorsys-0.6.3
either-1.6.1
futures-0.3.13
futures-channel-0.3.13
futures-core-0.3.13
futures-executor-0.3.13
futures-io-0.3.13
futures-macro-0.3.13
futures-sink-0.3.13
futures-task-0.3.13
futures-util-0.3.13
gdk-0.13.2
gdk-pixbuf-0.9.0
gdk-pixbuf-sys-0.10.0
gdk-sys-0.10.0
gio-0.9.1
gio-sys-0.10.1
glib-0.10.3
glib-macros-0.10.1
glib-sys-0.10.1
gobject-sys-0.10.0
gtk-0.9.2
gtk-sys-0.10.0
heck-0.3.2
itertools-0.9.0
libc-0.2.86
libpulse-binding-2.23.0
libpulse-sys-1.18.0
memchr-2.3.4
num-derive-0.3.3
num-traits-0.2.14
once_cell-1.6.0
pango-0.9.1
pango-sys-0.10.0
pin-project-lite-0.2.4
pin-utils-0.1.0
pkg-config-0.3.19
proc-macro-crate-0.1.5
proc-macro-error-1.0.4
proc-macro-error-attr-1.0.4
proc-macro-hack-0.5.19
proc-macro-nested-0.1.7
proc-macro2-1.0.24
quote-1.0.9
serde-1.0.123
slab-0.4.2
slice_as_array-1.1.0
strum-0.18.0
strum_macros-0.18.0
syn-1.0.60
system-deps-1.3.2
thiserror-1.0.24
thiserror-impl-1.0.24
toml-0.5.8
unicode-segmentation-1.7.1
unicode-xid-0.2.1
version-compare-0.0.10
version_check-0.9.2
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

DESCRIPTION="A modern Volume Mixer for PulseAudio"
HOMEPAGE="https://myxer.aurailus.com/"

if [[ ${PV} == 9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Aurailus/${PN}"
else
	SRC_URI="
		https://github.com/Aurailus/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
		$(cargo_crate_uris $CRATES)
	"
	KEYWORDS=""
	S="${WORKDIR}/${P/m/M}"
fi

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	media-sound/pulseaudio
	x11-libs/gtk+:3
"
DEPEND="${RDEPEND}"

src_unpack() {
	if [[ ${PV} == 9999 ]]
	then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		cargo_src_unpack
	fi
}