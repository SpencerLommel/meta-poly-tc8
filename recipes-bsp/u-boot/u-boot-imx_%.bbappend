FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

# We only need the DTS, the patch, and the imx-boot config file
SRC_URI_append = " \
    file://imx8mm-poly-lcc-proto.dts \
    file://0001-add-poly-tc8-dtb.patch \
    file://imx8mm_poly_tc8_sd_config \
"

# Set the U-Boot configuration for the sd/emmc build
UBOOT_CONFIG = "sd"

# For the 'poly-tc8' machine, use the defconfig we are creating in the patch
UBOOT_CONFIG[sd] = "imx8mm_poly_tc8_defconfig,sd"

# For the 'poly-tc8' machine, tell imx-boot to use our imx-boot config file
IMX_BOOT_CONF_poly-tc8 = "imx8mm_poly_tc8_sd_config"
