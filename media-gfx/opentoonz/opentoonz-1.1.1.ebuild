# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils

DESCRIPTION="An open-source full-featured 2D animation creation software"
HOMEPAGE="https://github.com/opentoonz/opentoonz"
SRC_URI="https://github.com/opentoonz/opentoonz/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=dev-libs/boost-1.55.0:=
	>=dev-util/cmake-3.4.1:=
	>=sci-libs/superlu-4.1:=
	sci-libs/blas-reference:=
	dev-qt/qtcore:5=
	dev-qt/qtgui:5=
	dev-qt/qtsvg:5=
	dev-qt/qtscript:5=
	dev-qt/qtmultimedia:5=
	dev-libs/lzo:2=
	app-arch/lz4:=
	media-libs/libpng:=
	media-libs/libjpeg-turbo:=
	media-libs/glew:=
	media-libs/freetype:2=
	media-libs/freeglut:=
	media-libs/libsdl2:=
	virtual/libusb:1=
"
DPEND="$RDEPEND"

CMAKE_USE_DIR="${S}"/toonz/sources

src_prepare()
{
	default
}

src_configure()
{
	cd thirdparty/tiff-4.0.3 || die
	econf \
		--with-pic \
		--disable-jbig
	emake
	cmake-utils_src_configure
}

pkg_postinst()
{
	elog "It is supposedly optional but some files are"
	elog "actually required to run the executable properly."
	elog
	elog "The .config/OpenToonz/ directory in your home folder"
	elog "will contain your settings, work and other files."
	elog
	elog "We need to create it from the command-line:"
	elog
	elog "$ mkdir -p \$HOME/.config/OpenToonz"
	elog "$ cp -r /usr/share/opentoonz/stuff/ \$HOME/.config/OpenToonz/"
}
