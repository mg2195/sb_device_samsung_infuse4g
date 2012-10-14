# Copyright (C) 2007 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# BoardConfig.mk
#
# Product-specific compile-time definitions.
#

# Set this up here so that BoardVendorConfig.mk can override it
BOARD_USES_GENERIC_AUDIO := false

BOARD_USES_LIBSECRIL_STUB := true

# Use the non-open-source parts, if they're present
-include vendor/samsung/infuse4g/BoardConfigVendor.mk

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_PROVIDES_INIT := true
TARGET_BOARD_PLATFORM := s5pc110
TARGET_BOOTLOADER_BOARD_NAME := aries
TARGET_RECOVERY_INITRC := device/samsung/aries-common/recovery.rc

BOARD_MOBILEDATA_INTERFACE_NAME = "pdp0"

# Releasetools
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./device/samsung/aries-common/releasetools/aries_ota_from_target_files
TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := ./device/samsung/aries-common/releasetools/aries_img_from_target_files

TARGET_PROVIDES_LIBAUDIO := true

# Sensors
TARGET_PROVIDES_LIBSENSORS := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

BOARD_HAS_VIBRATOR_IMPLEMENTATION := ../../device/samsung/infuse4g/vibrator/tspdrv.c

# Video Devices
BOARD_V4L2_DEVICE := /dev/video1
BOARD_CAMERA_DEVICE := /dev/video0
BOARD_SECOND_CAMERA_DEVICE := /dev/video2
TARGET_PROVIDES_LIBCAMERA := true

BOARD_NAND_PAGE_SIZE := 4096
BOARD_NAND_SPARE_SIZE := 128
BOARD_KERNEL_BASE := 0x32000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_CMDLINE := console=ttySAC2,115200 loglevel=4

TARGET_KERNEL_SOURCE := kernel/samsung/dempsey
TARGET_KERNEL_CONFIG := aries_infuse4g_defconfig

BOARD_BOOTIMAGE_PARTITION_SIZE := 7864320
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 300417024
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2013265920
BOARD_FLASH_BLOCK_SIZE := 4096

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_BOOTANIMATION_USE_RGB565 := true

# Wifi
BOARD_LEGACY_NL80211_STA_EVENTS	 := true
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_WLAN_DEVICE_REV            := bcm4330_b1
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/vendor/firmware/bcm4330_sta.bin"
WIFI_DRIVER_FW_PATH_AP           := "/vendor/firmware/bcm4330_aps.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/vendor/firmware/bcm4330_p2p.bin"
WIFI_DRIVER_MODULE_NAME          := "dhd"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/vendor/firmware/bcm4330_sta.bin nvram_path=/system/vendor/firmware/nvram_net.txt"
WIFI_BAND                        := 802_11_ABG

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/usb_mass_storage/lun%d/file"

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/aries-common/shbootimg.mk
TARGET_RECOVERY_PRE_COMMAND := "echo 1 > /cache/.startrecovery; sync;"
BOARD_CUSTOM_GRAPHICS := ../../../device/samsung/infuse4g/recovery/graphics.c
BOARD_USES_BML_OVER_MTD := true

# Charging mode
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/charging_mode_booting
BOARD_BATTERY_DEVICE_NAME := "battery"
BOARD_CHARGER_RES := device/samsung/infuse4g/res/charger

# header overrides
TARGET_SPECIFIC_HEADER_PATH := device/samsung/infuse4g/overlay/include

# While our kernel doesn't support MMC ERASE, we do have a defective eMMC
# chipset.  Suppress ERASE by recovery and update-binary just to be sure
BOARD_SUPPRESS_EMMC_WIPE := true

# legacy ts support
BOARD_USE_LEGACY_TOUCHSCREEN := true

# Hardware rendering
USE_OPENGL_RENDERER := true

# TARGET_DISABLE_TRIPLE_BUFFERING can be used to disable triple buffering
# on per target basis. On crespo it is possible to do so in theory
# to save memory, however, there are currently some limitations in the
# OpenGL ES driver that in conjunction with disable triple-buffering
# would hurt performance significantly (see b/6016711)
TARGET_DISABLE_TRIPLE_BUFFERING := false
BOARD_ALLOW_EGL_HIBERNATION := true

# hwcomposer: custom vsync ioctl
BOARD_CUSTOM_VSYNC_IOCTL := true

# Suspend in charger to disable capacitive keys
BOARD_ALLOW_SUSPEND_IN_CHARGER := true

# skia
BOARD_USE_SKIA_LCDTEXT := true

# Include aries specific stuff
-include device/samsung/aries-common/Android.mk

TARGET_OTA_ASSERT_DEVICE := aries,infuse4g,SGH-I997,SGH-I997R
