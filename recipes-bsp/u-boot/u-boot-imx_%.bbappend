FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " \
    file://imx8mm-poly-lcc-proto.dts \
    file://0001-add-poly-tc8-dtb.patch \
"
