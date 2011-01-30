# Copyright 2009 Timo Bingmann
# Distributed under the terms of the GNU General Public License v2

inherit eutils

DESCRIPTION="Tool to read, verify and update MD5 or SHA digest files."
HOMEPAGE="http://idlebox.net/2009/digup/"
SRC_URI="http://idlebox.net/2009/digup/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND=""

src_unpack() {
	unpack ${A}
}

src_compile() {
        econf || die "econf failed"
        emake || die "emake failed"
}

src_test() {
	emake check || die "emake check failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	dodoc README AUTHORS
}
