FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

# The SRC_URI now only needs to apply our single, comprehensive patch 
# and the separate imx-boot configuration file.
# The patch handles creating the .dts file, so we don't list it here.
SRC_URI_append = " \
    file://0001-poly-tc8-board-support.patch \
    file://imx8mm_poly_tc8_sd_config \
"

# Set the U-Boot configuration for the sd/emmc build
UBOOT_CONFIG = "sd"

# For the 'poly-tc8' machine, use the defconfig we are creating in the patch
UBOOT_CONFIG[sd] = "imx8mm_poly_tc8_defconfig,sd"

# For the 'poly-tc8' machine, tell imx-boot to use our imx-boot config file
IMX_BOOT_CONF_poly-tc8 = "imx8mm_poly_tc8_sd_config"
