# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3 linux-info

DESCRIPTION="Wireless daemon for Linux"
HOMEPAGE="https://git.kernel.org/cgit/network/wireless/iwd.git/"
SRC_URI=""
EGIT_REPO_URI_IWD="https://git.kernel.org/pub/scm/network/wireless/iwd.git"
EGIT_REPO_URI_ELL="https://git.kernel.org/pub/scm/libs/ell/ell.git"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""
IUSE=""

CONFIG_CHECK="
	~TIMERFD
	~EVENTFD
	~CRYPTO_USER_API
	~CRYPTO_USER_API_HASH
	~CRYPTO_MD5
	~CRYPTO_SHA1
	"

src_unpack()
{
	EGIT_REPO_URI=${EGIT_REPO_URI_IWD} git-r3_src_unpack
	EGIT_REPO_URI=${EGIT_REPO_URI_ELL} EGIT_CHECKOUT_DIR=${WORKDIR}/ell git-r3_src_unpack
}

src_prepare()
{
	default
	./bootstrap-configure
}
