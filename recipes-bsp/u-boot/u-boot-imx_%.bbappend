FILESEXTRAPATHS:prepend := "${THISDIR}:"

SRC_URI += "file://poly-tc8-fastboot.cfg"

do_configure:append() {
    echo ">>>> Injecting extra U-Boot configs"
    cat ${WORKDIR}/poly-tc8-fastboot.cfg >> ${S}/configs/imx8mm_evk_defconfig
}
