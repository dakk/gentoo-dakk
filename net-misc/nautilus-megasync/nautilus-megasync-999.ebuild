# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils multilib unpacker

DESCRIPTION="Nautilus plugin for using the MEGA account with Megasync"
HOMEPAGE="http://mega.co.nz"
SRC_URI="
	x86? ( https://mega.nz/linux/MEGAsync/Debian_7.0/i386/nautilus-megasync-Debian_7.0_i386.deb )
		amd64? ( https://mega.nz/linux/MEGAsync/Debian_7.0/amd64/nautilus-megasync-Debian_7.0_amd64.deb )
"

LICENSE="MEGA"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="net-misc/megasync
		gnome-base/nautilus"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

pkg_setup(){
	elog "This ebuild installs the binary for MEGAsync nautilus extension. "
	elog "If any problems, please, contact the MEGA team."
}

src_unpack(){
	unpack ${A}
	unpack ./data.tar.gz
	rm -vr control.tar.gz data.tar.gz debian-binary usr/src
}

src_install(){
	insinto /
	doins -r usr
}
