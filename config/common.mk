PRODUCT_BRAND ?= androidx

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.config.ringtone=Orion.ogg \
    ro.config.notification_sound=tweeters.ogg \
    ro.config.alarm_alert=Krypton.ogg \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

# Disable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=0

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/androidx/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/androidx/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/androidx/prebuilt/common/bin/50-hosts.sh:system/addon.d/50-hosts.sh \
    vendor/androidx/prebuilt/common/bin/blacklist:system/addon.d/blacklist

# init.d support
PRODUCT_COPY_FILES += \
    vendor/androidx/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/androidx/prebuilt/common/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/androidx/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# androidx-specific init file
PRODUCT_COPY_FILES += \
    vendor/androidx/prebuilt/common/etc/init.androidx.rc:root/init.androidx.rc

# Bring in camera effects
PRODUCT_COPY_FILES +=  \
    vendor/androidx/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/androidx/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Proprietary latinime lib needed for swyping
PRODUCT_COPY_FILES += \
    vendor/androidx/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so

# Required androidx packages
PRODUCT_PACKAGES += \
    Camera \
    Development \
    LatinIME \
    Launcher3

# Optional androidx packages
PRODUCT_PACKAGES += \
    audio_effects.conf \
    Basic

# Extra tools in androidx
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
    bash \
    vim \
    nano \
    htop \
    powertop \
    lsof \
    systembinsh

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync

# emoji
PRODUCT_PACKAGES += \
    libemoji

# Screen recorder
PRODUCT_PACKAGES += \
    ScreenRecorder \
    libscreenrecorder

# Chromium Prebuilt
ifeq ($(PRODUCT_PREBUILT_WEBVIEWCHROMIUM),yes)
-include prebuilts/chromium/$(TARGET_DEVICE)/chromium_prebuilt.mk
endif

PRODUCT_PACKAGE_OVERLAYS += vendor/androidx/overlay/dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/androidx/overlay/common
