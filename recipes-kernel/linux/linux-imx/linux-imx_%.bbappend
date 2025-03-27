FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://poly-tc8.dts"

KERNEL_DEVICETREE += "freescale/poly-tc8.dtb"

do_configure:prepend() {
    install -d ${S}/arch/arm64/boot/dts/freescale
    install -m 0644 ${WORKDIR}/poly-tc8.dts ${S}/arch/arm64/boot/dts/freescale/
    echo 'dtb-$(CONFIG_ARCH_MXC) += poly-tc8.dtb' >> ${S}/arch/arm64/boot/dts/freescale/Makefile
}
