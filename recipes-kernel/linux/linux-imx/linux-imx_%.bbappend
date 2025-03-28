FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://poly-tc8.dts \
            file://patches/poly-tc8-makefile.patch"

SRC_URI[md5sum] = ""
SRC_URI[sha256sum] = ""

KERNEL_DEVICETREE += "freescale/poly-tc8.dtb"

do_configure:prepend() {
    echo ">>>> Copying poly-tc8.dts manually..."
    install -d ${S}/arch/arm64/boot/dts/freescale
    install -m 0644 ${WORKDIR}/poly-tc8.dts ${S}/arch/arm64/boot/dts/freescale/
}
