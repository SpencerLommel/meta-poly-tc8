FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://poly-tc8.dts \
            file://patches/poly-tc8-makefile.patch"

KERNEL_DEVICETREE += "freescale/poly-tc8.dtb"

do_install:prepend() {
    echo ">>>> Copying poly-tc8.dts manually..."
    install -d ${S}/arch/arm64/boot/dts/freescale
    install -m 0644 ${WORKDIR}/poly-tc8.dts ${S}/arch/arm64/boot/dts/freescale/
    cat ${S}/arch/arm64/boot/dts/freescale/Makefile | grep poly || echo "MISSING MAKEFILE LINE"
}
