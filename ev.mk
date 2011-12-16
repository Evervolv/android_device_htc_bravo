$(call inherit-product, device/htc/bravo/full_bravo.mk)

# Inherit some common evervolv stuff.
$(call inherit-product, vendor/ev/config/common_full_phone.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := ev_bravo
PRODUCT_BRAND := htc_wwe
PRODUCT_DEVICE := bravo
PRODUCT_MODEL := HTC Desire
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=GRI40 PRODUCT_NAME=htc_bravo BUILD_FINGERPRINT=htc_wwe/htc_bravo/bravo:2.3.3/GRI40/96875.1:user/release-keys TARGET_BUILD_TYPE=userdebug BUILD_VERSION_TAGS=release-keys PRIVATE_BUILD_DESC="3.14.405.1 CL96875 release-keys"

#
# Set up the product codename, build version & MOTD.
#
#FIXME Find a clever codename
PRODUCT_CODENAME := Desire
PRODUCT_VERSION_DEVICE_SPECIFIC := p1

PRODUCT_MOTD :="\n\n\n--------------------MESSAGE---------------------\nThank you for choosing Evervolv for your HTC Desire\nPlease visit us at \#evervolv on irc.freenode.net\nFollow @preludedrew for the latest Evervolv updates\nGet the latest rom at evervolv.com\n------------------------------------------------\n"

#
# Extra Packages
#
PRODUCT_PACKAGES += \
    Camera \
    Stk

# Extra RIL settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.oem.nosim.ecclist=911,112,999,000,08,118,120,122,110,119,995 \
    ro.ril.emc.mode=2

# Copy hdpi specific bootanimation
#PRODUCT_COPY_FILES +=  \
#    vendor/ev/prebuilt/hvga/media/bootanimation.zip:system/media/bootanimation.zip
# Use the n1 stock boot animation until we get a custom evervolv one.
$(call inherit-product-if-exists, device/htc/passion/extras/extras.mk)

# Get some gapps
ifdef ($(GAPPS),true)
$(call inherit-product, vendor/ev/prebuilt/gapps/gapps.mk)
endif
