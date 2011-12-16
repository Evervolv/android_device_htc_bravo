# Inherit AOSP device configuration for bravo.
$(call inherit-product, device/htc/bravo/full_bravo.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Include GSM stuff
$(call inherit-product, vendor/cm/config/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cm_bravo
PRODUCT_BRAND := htc_wwe
PRODUCT_DEVICE := bravo
PRODUCT_MODEL := HTC Desire
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=GRI40 PRODUCT_NAME=htc_bravo BUILD_FINGERPRINT=htc_wwe/htc_bravo/bravo:2.3.3/GRI40/96875.1:user/release-keys TARGET_BUILD_TYPE=userdebug BUILD_VERSION_TAGS=release-keys PRIVATE_BUILD_DESC="3.14.405.1 CL96875 release-keys"

PRODUCT_PACKAGES += \
    Camera

#Temp packages
PRODUCT_PACKAGES += \
    bash vim nano libncurses ssh rsync \
    Stk CMSettings \
    e2fsck resize2fs mke2fs \
    libext2_com_err libext2_profile libext2_blkid libext2_e2p libext2_uuid libext2fs

#Disable HWAccel for now
ADDITIONAL_BUILD_PROPERTIES += \
    ro.config.disable_hw_accel=true

#tryout ril workaround
ADDITIONAL_BUILD_PROPERTIES += \
    ro.telephony.ril.v3=signalstrength #skipbrokendatacall

# Extra RIL settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.oem.nosim.ecclist=911,112,113,115,117,999,000,08,118,120,122,110,119,995 \
    ro.ril.emc.mode=2

# Release name and versioning
PRODUCT_RELEASE_NAME := Desire
PRODUCT_VERSION_DEVICE_SPECIFIC := -drewis
-include vendor/cyanogen/products/common_versions.mk

#Get eng stuff on our userdebug builds
# Turn on checkjni for non-user builds.
ADDITIONAL_BUILD_PROPERTIES += ro.kernel.android.checkjni=1
# Set device insecure for non-user builds.
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
# Allow mock locations by default for non user builds
ADDITIONAL_DEFAULT_PROPERTIES += ro.allow.mock.location=1
# Disable visual strict mode, even on eng builds
PRODUCT_DEFAULT_PROPERTY += persist.sys.strictmode.visual=0

#My extras
$(call inherit-product-if-exists, device/htc/passion/extras/extras.mk)

#Get some Gapps
#$(call inherit-product-if-exists, gapps/gapps.mk)
