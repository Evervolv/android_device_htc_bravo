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
# inherit common defines for all qsd8k devices
include device/htc/qsd8k-common/BoardConfigCommon.mk

TARGET_BOOTLOADER_BOARD_NAME := bravo

BOARD_KERNEL_CMDLINE := no_console_suspend=1 msmsdcc_sdioirq=1 wire.search_count=5
BOARD_KERNEL_BASE := 0x20000000
BOARD_KERNEL_NEW_PPPOX := true

TARGET_KERNEL_CONFIG    := evervolv_bravo_defconfig
TARGET_PREBUILT_KERNEL  := device/htc/bravo/prebuilt/kernel

# to enable the GPS HAL
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := bravo

# AMSS version to use for GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 3200

# Pull all dictionaries
TARGET_USE_KEYBOARD := international

# Use legacy touchscreen
BOARD_USE_LEGACY_TOUCHSCREEN := true

# Hacks
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file
BOARD_USE_LEGACY_TRACKPAD := true

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
