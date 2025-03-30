FILESEXTRAPATHS:prepend := "${THISDIR}:"

SRC_URI += "file://poly-tc8-fastboot.cfg"
SRC_URI += "file://u-boot-default-env.txt"
SRC_URI += "file://poly-tc8.dts"
SRC_URI += "file://patches/0001-enable-fastboot.patch"
# SRC_URI += "file://patches/0002-u-boot-configs.patch"


DEPENDS += "u-boot-tools-native"

do_configure:append() {
    echo ">>>> Injecting extra U-Boot configs"
    cat ${WORKDIR}/poly-tc8-fastboot.cfg >> ${S}/configs/imx8mm_evk_defconfig
    install -m 0644 ${WORKDIR}/poly-tc8.dts ${S}/arch/arm/dts/
}

do_compile:prepend() {
    export PATH="${STAGING_BINDIR_NATIVE}:${PATH}"
}

do_compile:append() {
    echo ">>>> Generating U-Boot environment binary"
    ${STAGING_BINDIR_NATIVE}/mkenvimage -r -s 0x2000 -o ${S}/u-boot-initial-env ${WORKDIR}/u-boot-default-env.txt
}

do_install:append() {
    install -d ${D}${datadir}
    install -m 0644 ${S}/u-boot-initial-env ${D}${datadir}/u-boot-initial-env
}
