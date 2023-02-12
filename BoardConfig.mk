

DEVICE_PATH := device/huawei/dura

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
#TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT := cortex-a53

# Assert
TARGET_OTA_ASSERT_DEVICE := dura

# File systems
EMUI_USE_ERECOVERY_AS_CUSTOM_RECOVERY := true

#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 27739760 # This is the maximum known partition size, but it can be higher, so we just omit it


# TODO: Those are modified partitions so its needed to mod them if you are using stock gpt.bin
BOARD_BOOTIMAGE_PARTITION_SIZE := 25165824
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_ERECOVERYIMAGE_PARTITION_SIZE := 33554432
ifeq ($(EMUI_USE_ERECOVERY_AS_CUSTOM_RECOVERY),true)
  BOARD_RECOVERYIMAGE_PARTITION_SIZE := $(BOARD_ERECOVERYIMAGE_PARTITION_SIZE)
endif
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2684354560
BOARD_CACHEIMAGE_PARTITION_SIZE := 134217728
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11859377664
# BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
# FIN DE EL TODO

# Partitions types

BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor

# Encryption
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
ifeq ($(TW_INCLUDE_CRYPTO),true)
  TW_CRYPTO_FS_TYPE := "f2fs"
  TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/bootdevice/by-name/userdata"
  TW_CRYPTO_MNT_POINT := "/data"
  TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,noatime,discard,inline_data,inline_xattr,data=ordered"
endif

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32S1,32S1 product.type=normal androidboot.selinux=enforcing buildvariant=user
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/zImage-dtb
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x05000000
BOARD_KERNEL_TAGS_OFFSET := 0x04000000
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_HEADER_ARCH := arm
TARGET_KERNEL_SOURCE := kernel/huawei/dura
TARGET_KERNEL_CONFIG := dura_defconfig

#TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

# Platform
TARGET_BOARD_PLATFORM := mt6739

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := mt6739

# system informations
PLATFORM_SECURITY_PATCH := 2019-03-01
VENDOR_SECURITY_PATCH := 2019-03-01
PLATFORM_VERSION := 8.1.0

# App
TW_EXCLUDE_SUPERSU := true

# TWRP Configuration
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
BOARD_SUPPRESS_SECURE_ERASE := true
TW_HAS_MTP := true
TW_INCLUDE_NTFS_3G := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TARGET_USES_MKE2FS := true
TW_EXCLUDE_TWRPAPP := true
TW_IGNORE_MISC_WIPE_DATA := true
HAVE_SELINUX := true
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_DEFAULT_BRIGHTNESS := 62
TW_MAX_BRIGHTNESS := 255
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_NO_SCREEN_BLANK := true
BOARD_HAS_NO_SELECT_BUTTON := true
PRODUCT_COPY_FILES += device/huawei/dura/recovery.fstab:recovery/root/etc/twrp.fstab
TARGET_RECOVERY_FSTAB := device/huawei/dura/recovery.fstab
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_CUSTOM_BATTERY_PATH := /sys/class/power_supply/battery
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone0/temp

TW_INPUT_BLACKLIST := "hbtp_vm"
TW_NO_EXFAT := false
TW_USE_TOOLBOX := false
TW_USE_BUSYBOX := true

# resetprop and magiskboot
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true

# Paths
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
