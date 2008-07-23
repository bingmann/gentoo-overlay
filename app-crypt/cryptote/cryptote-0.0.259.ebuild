# Copyright 2008 Timo Bingmann
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/audacity/audacity-1.3.5.ebuild,v 1.4 2008/07/15 16:23:42 ken69267 Exp $

WX_GTK_VER="2.8"

inherit eutils wxwidgets flag-o-matic fdo-mime

DESCRIPTION="Text editor with built-in strong cryptographic functions"
HOMEPAGE="http://idlebox.net/2008/cryptote/"
SRC_URI="http://idlebox.net/2008/cryptote/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86"
IUSE=""

DEPEND="=x11-libs/wxGTK-2.8*
	app-arch/bzip2
	sys-libs/zlib"

src_unpack() {

	need-wxwidgets unicode

	unpack ${A}
}

src_compile() {

	# this fixes a QA warning about bad code in wxWidgets
	append-flags -Wno-strict-aliasing

        econf || die "econf failed"
        emake  || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	dodoc README AUTHORS ChangeLog
}

pkg_postinst() {
        fdo-mime_desktop_database_update
}

pkg_postrm() {
        fdo-mime_desktop_database_update
}
