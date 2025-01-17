# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dtc"
PKG_VERSION="1.6.1"
PKG_LICENSE="GPL"
PKG_SITE="https://git.kernel.org/pub/scm/utils/dtc/dtc.git/"
PKG_URL="https://git.kernel.org/pub/scm/utils/dtc/dtc.git/snapshot/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_HOST="toolchain:host"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="The Device Tree Compiler"

PKG_MAKE_OPTS_TARGET="dtc fdtput fdtget libfdt"
PKG_MAKE_OPTS_HOST="dtc libfdt"

makeinstall_host() {
  mkdir -p ${TOOLCHAIN}/bin
    cp -P ${PKG_BUILD}/dtc ${TOOLCHAIN}/bin
  mkdir -p ${TOOLCHAIN}/lib
    cp -P ${PKG_BUILD}/libfdt/libfdt.so ${TOOLCHAIN}/lib
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin
    cp -P ${PKG_BUILD}/dtc ${INSTALL}/usr/bin
    cp -P ${PKG_BUILD}/fdtput ${INSTALL}/usr/bin/
    cp -P ${PKG_BUILD}/fdtget ${INSTALL}/usr/bin/
  mkdir -p ${INSTALL}/usr/lib
    cp -P ${PKG_BUILD}/libfdt/libfdt.so ${INSTALL}/usr/lib/
}
