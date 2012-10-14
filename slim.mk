## Specify phone tech before including full_phone
$(call inherit-product, vendor/slim/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := I997

# Inherit some common slim stuff.
$(call inherit-product, vendor/slim/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/infuse4g/full_infuse4g.mk)

# Inherit device settings
$(call inherit-product, vendor/slim/config/common_sgs.mk)

#copy kernel and modules
PRODUCT_COPY_FILES += \
	device/samsung/infuse4g/prebuilt/kernel/boot.img:system/slimkernel/boot.img \
	device/samsung/infuse4g/prebuilt/kernel/boot.img:kernel \
	device/samsung/infuse4g/prebuilt/kernel/modem.bin:modem.bin \
        device/samsung/infuse4g/recovery.fstab:ramdisk.img \
        device/samsung/infuse4g/recovery.fstab:recovery/root/etc/recovery.fstab \
	device/samsung/infuse4g/prebuilt/kernel/system/lib/modules/ansi_cprng.ko:system/lib/modules/ansi_cprng.ko \
	device/samsung/infuse4g/prebuilt/kernel/system/lib/modules/dhd.ko:system/lib/modules/dhd.ko \
	device/samsung/infuse4g/prebuilt/kernel/system/lib/modules/vibrator.ko:system/lib/modules/vibrator.ko \
	device/samsung/infuse4g/prebuilt/kernel/system/lib/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
	device/samsung/infuse4g/prebuilt/kernel/utilities/busybox:utilities/busybox \
	device/samsung/infuse4g/prebuilt/kernel/utilities/erase_image:utilities/erase_image \
	device/samsung/infuse4g/prebuilt/kernel/utilities/flash_image:utilities/flash_image \
	device/samsung/infuse4g/prebuilt/kernel/utilities/make_ext4fs:utilities/make_ext4fs 

PRODUCT_COPY_FILES += \
vendor/slim/prebuilt/hdpi/bootanimation.zip:system/media/bootanimation.zip

PRODUCT_PROPERTY_OVERRIDES += \
ro.camera.res=8MP

#copy 00check
PRODUCT_COPY_FILES += \
device/samsung/infuse4g/prebuilt/kernel/system/etc/init.d/00check:system/etc/init.d/00check

#copy 00check
PRODUCT_COPY_FILES += \
device/samsung/infuse4g/prebuilt/kernel/system/etc/init.d/00check:system/etc/init.d/00check

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := infuse4g
PRODUCT_NAME := slim_infuse4g
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SGH-I997

#Set build fingerprint / ID / Prduct Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SGH-I997 TARGET_DEVICE=SGH-I997 BUILD_FINGERPRINT=samsung/SGH-I997/SGH-I997:4.1.2/JZO54K:user/release-keys PRIVATE_BUILD_DESC="SGH-I997-userdebug 4.1.2 JZO54K user.ar.20120828.002056 release-keys"
