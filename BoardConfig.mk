# Copyright (C) 2009 The Android Open Source Project
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

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/htc/bravo/BoardConfigVendor.mk

TARGET_BOOTLOADER_BOARD_NAME := bravo
TARGET_NO_BOOTLOADER := true

TARGET_BOARD_PLATFORM := qsd8k
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a8
TARGET_ARCH_VARIANT_FPU := neon
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_VFP := true

TARGET_SPECIFIC_HEADER_PATH := device/htc/bravo/include

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WLAN_DEVICE           := bcm4329
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_PATH_STA     := "/system/vendor/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/vendor/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_MODULE_ARG      := "iface_name=wlan firmware_path=/system/vendor/firmware/fw_bcm4329.bin nvram_path=/proc/calibration"
WIFI_DRIVER_MODULE_NAME     := "bcm4329"

BOARD_USES_GENERIC_AUDIO := false
# prevent breakage from QCOM_HARDWARE in system/audio.h
COMMON_GLOBAL_CFLAGS += -DLEGACY_AUDIO_COMPAT

BOARD_KERNEL_CMDLINE := no_console_suspend=1 msmsdcc_sdioirq=1 wire.search_count=5
BOARD_KERNEL_BASE := 0x20000000
BOARD_KERNEL_NEW_PPPOX := true
TARGET_PREBUILT_KERNEL := device/htc/bravo/prebuilt/kernel

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

BOARD_VENDOR_QCOM_AMSS_VERSION := 3200

BOARD_VENDOR_USE_AKMD := akm8973

# Hardware rendering
BOARD_EGL_CFG           := device/htc/bravo/egl.cfg
USE_OPENGL_RENDERER     := true
TARGET_USES_GENLOCK     := true
# Unnecessary with new egl libs
#COMMON_GLOBAL_CFLAGS   += -DMISSING_EGL_EXTERNAL_IMAGE -DMISSING_EGL_PIXEL_FORMAT_YV12
# We only have 2 buffers so still need to hack it.
COMMON_GLOBAL_CFLAGS    += -DMISSING_GRALLOC_BUFFERS
# Just a safety measure to make sure its all included
COMMON_GLOBAL_CFLAGS    += -DQCOM_HARDWARE
# Force refresh rate since fps calc is broke and reports 0
COMMON_GLOBAL_CFLAGS    += -DREFRESH_RATE=60
# qsd8k: no support for overlay, bypass, or c2d
TARGET_USE_OVERLAY      := false
TARGET_HAVE_BYPASS      := false
TARGET_USES_C2D_COMPOSITION := false
# Allow fallback to ashmem
TARGET_GRALLOC_USES_ASHMEM := true
# Debuging egl
COMMON_GLOBAL_CFLAGS    += -DEGL_TRACE

BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_HARDWARE := true

BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

# RIL
BOARD_USE_NEW_LIBRIL_HTC := true

# Misc
BOARD_USE_OPENSSL_ENGINE := true

# Hacks
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file
BOARD_USE_LEGACY_TRACKPAD := true
TARGET_FORCE_CPU_UPLOAD := true

# # cat /proc/mtd
# dev:    size   erasesize  name
# mtd0: 000a0000 00020000 "misc"
# mtd1: 00500000 00020000 "recovery"
# mtd2: 00280000 00020000 "boot"
# mtd3: 0fa00000 00020000 "system"
# mtd4: 02800000 00020000 "cache"
# mtd5: 093a0000 00020000 "userdata"
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00280000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
BOARD_SYSTEMIMAGE_PARTITION_SIZE :=  262144000 # 0x09100000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 154140672 # 0x093a0000
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_RELEASETOOLS_EXTENSIONS := device/htc/common

# to enable the GPS HAL
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := bravo
# AMSS version to use for GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 3200
