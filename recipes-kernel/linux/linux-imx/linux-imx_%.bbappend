FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI += "file://poly-tc8.dts"

KERNEL_DEVICETREE += "freescale/poly-tc8.dtb"
