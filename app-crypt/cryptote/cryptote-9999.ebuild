# Copyright 2012 Timo Bingmann
# Distributed under the terms of the GNU General Public License v2

EAPI=4
WX_GTK_VER="2.8"

inherit eutils wxwidgets flag-o-matic fdo-mime git-2

DESCRIPTION="Text editor with integrated strong cryptography"
HOMEPAGE="http://idlebox.net/2009/cryptote/"
EGIT_REPO_URI="https://github.com/bingmann/cryptote"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm ~x86 ~amd64"
IUSE=""

DEPEND="=x11-libs/wxGTK-2.8*
	app-arch/bzip2
	sys-libs/zlib"

src_unpack() {
	need-wxwidgets unicode
	git-2_src_unpack
}

src_compile() {

	# this fixes a QA warning about bad code in wxWidgets
	append-flags -Wno-strict-aliasing

        econf || die "econf failed"
        emake || die "emake failed"
}

src_test() {
	emake check || die "emake check failed"
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
