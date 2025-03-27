FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
SRC_URI += "file://poly-tc8.dts \
            file://poly-tc8-dts.patch \
"

KERNEL_DEVICETREE += "freescale/poly-tc8.dtb"

do_unpack:append() {
    install -d ${S}/arch/arm64/boot/dts/freescale
    install -m 0644 ${WORKDIR}/poly-tc8.dts ${S}/arch/arm64/boot/dts/freescale/
}

SRC_URI:append = " file://poly-tc8-dts.patch"

