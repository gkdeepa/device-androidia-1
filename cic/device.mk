# ----------------- BEGIN MIX-IN DEFINITIONS -----------------
# Mix-In definitions are auto-generated by mixin-update
##############################################################
# Source: device/intel/mixins/groups/boot-arch/project-celadon/product.mk
##############################################################
TARGET_UEFI_ARCH := x86_64

# Android Kernelflinger uses the OpenSSL library to support the
# bootloader policy
KERNELFLINGER_SSL_LIBRARY := boringssl

##############################################################
# Source: device/intel/mixins/groups/audio/aic/product.mk
##############################################################
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-service \
    android.hardware.audio@2.0-impl \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.broadcastradio@1.0-impl \
    android.hardware.soundtrigger@2.0-impl \

PRODUCT_COPY_FILES += \
    frameworks/av/media/libeffects/data/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    frameworks/av/services/audiopolicy/config/surround_sound_configuration_5_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/surround_sound_configuration_5_0.xml \
    $(LOCAL_PATH)/audiopolicy/config/a2dp_audio_policy_configuration.xml:system/vendor/etc/a2dp_audio_policy_configuration.xml \
    $(LOCAL_PATH)/audiopolicy/config/audio_policy_configuration.xml:system/vendor/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audiopolicy/config/audio_policy_configuration_mt.xml:system/vendor/etc/audio_policy_configuration_mt.xml \
    $(LOCAL_PATH)/audiopolicy/config/audio_policy_configuration_pt.xml:system/vendor/etc/audio_policy_configuration_pt.xml \
    $(LOCAL_PATH)/audiopolicy/config/usb_audio_policy_configuration.xml:system/vendor/etc/usb_audio_policy_configuration.xml \
    $(LOCAL_PATH)/audiopolicy/config/hdmi_audio_policy_configuration.xml:system/vendor/etc/hdmi_audio_policy_configuration.xml \
    $(LOCAL_PATH)/audiopolicy/config/mixer_paths_0.xml:system/vendor/etc/mixer_paths_0.xml \
    $(LOCAL_PATH)/audiopolicy/config/default_volume_tables.xml:system/vendor/etc/default_volume_tables.xml \
    $(LOCAL_PATH)/audiopolicy/config/audio_policy_volumes.xml:system/vendor/etc/audio_policy_volumes.xml


# Audio Primary HAL
PRODUCT_PACKAGES += \
    audio.primary.$(TARGET_PRODUCT)

# Extended Audio HALs
PRODUCT_PACKAGES += \
    audio.r_submix.default \
    audio.usb.default \
    audio.usb.$(TARGET_PRODUCT) \
    audio_policy.default.so \
    audio_configuration_files
##############################################################
# Source: device/intel/mixins/groups/device-specific/cic/product.mk
##############################################################
PRODUCT_PACKAGES += \
    docker \
    cpio \
    aic-build \

PRODUCT_PACKAGES += \
    sh_vendor \
    vintf \
    toybox_vendor \
    sdcard-fuse \

PRODUCT_COPY_FILES += \
    out/target/product/$(TARGET_PRODUCT)/system/bin/sdcard-fuse:system/bin/sdcard

PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service \

ifeq ($(TARGET_DM_VERITY_SUPPORT), true)
PRODUCT_PACKAGES += build_verity_img.py
endif

PRODUCT_PROPERTY_OVERRIDES += \
    service.adb.tcp.port=5555
##############################################################
# Source: device/intel/mixins/groups/graphics/aic_mdc/product.mk
##############################################################
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:system/etc/permissions/android.software.freeform_window_management.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/vendor/etc/permissions/android.hardware.opengles.aep.xml \

PRODUCT_PACKAGES += \
    egl.cfg \
    lib_renderControl_enc \
    libGLESv2_enc \
    libOpenglSystemCommon \
    libGLESv1_enc \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.mapper@2.0-impl \
    hwcomposer.goldfish \
    hwcomposer.ranchu \
    android.hardware.drm@1.0-service \
    android.hardware.drm@1.0-impl \

ifeq ($(TARGET_USE_GRALLOC_VHAL), true)
PRODUCT_COPY_FILES += \
    $(INTEL_PATH_VENDOR_CIC_GRAPHIC)/edge/system/vendor/bin/gralloc1_test:system/vendor/bin/gralloc1_test \
    $(INTEL_PATH_VENDOR_CIC_GRAPHIC)/edge/system/vendor/bin/test_lxc_server:system/vendor/bin/test_lxc_server \
    $(INTEL_PATH_VENDOR_CIC_GRAPHIC)/edge/system/vendor/bin/test_lxc_client:system/vendor/bin/test_lxc_client \
    $(INTEL_PATH_VENDOR_CIC_GRAPHIC)/edge/system/vendor/lib/hw/gralloc.intel.so:system/vendor/lib/hw/gralloc.intel.so \
    $(INTEL_PATH_VENDOR_CIC_GRAPHIC)/edge/system/vendor/lib64/hw/gralloc.intel.so:system/vendor/lib64/hw/gralloc.intel.so \
    $(INTEL_PATH_VENDOR_CIC_GRAPHIC)/edge/system/vendor/lib/liblxc_util.so:system/vendor/lib/liblxc_util.so \
    $(INTEL_PATH_VENDOR_CIC_GRAPHIC)/edge/system/vendor/lib64/liblxc_util.so:system/vendor/lib64/liblxc_util.so
endif

PRODUCT_PACKAGES += \
    libGLES_mesa \
    libdrm \
    libdrm_intel \
    libsync \
    Browser2 \
    RemoteIME \
    ServiceAgent \
    auto_start_apk.sh

ifeq ($(TARGET_USE_GRALLOC_VHAL), true)
PRODUCT_PACKAGES += gralloc_imp.intel
else
PRODUCT_PACKAGES += gralloc.intel
endif

ifeq ($(TARGET_USE_HWCOMPOSER_VHAL), true)
PRODUCT_COPY_FILES += \
    vendor/intel/cic/target/graphics/edge/system/vendor/lib/hw/hwcomposer.remote.so:system/vendor/lib/hw/hwcomposer.remote.so \
    vendor/intel/cic/target/graphics/edge/system/vendor/lib64/hw/hwcomposer.remote.so:system/vendor/lib64/hw/hwcomposer.remote.so
else
PRODUCT_PACKAGES += hwcomposer.intel
endif


PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.gralloc=intel \
    ro.hardware.gralloc_imp=intel \
    ro.opengles.version=196610

ifeq ($(TARGET_USE_HWCOMPOSER_VHAL), true)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.hwcomposer=remote
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.hwcomposer=intel
endif

##############################################################
# Source: device/intel/mixins/groups/usb/acc/product.mk
##############################################################
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.usb.accessory.xml:vendor/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# usb accessory
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

##############################################################
# Source: device/intel/mixins/groups/wlan/mac80211_hwsim/product.mk
##############################################################
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
	wpa_supplicant \
	hostapd \

PRODUCT_COPY_FILES += \
    $(INTEL_PATH_VENDOR_CIC_HAL)/wifi/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant.conf \
    $(INTEL_PATH_VENDOR_CIC_HAL)/wifi/WifiConfigStore.xml:data/misc/wifi/WifiConfigStore.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml
##############################################################
# Source: device/intel/mixins/groups/houdini/true/product.mk
##############################################################
# Houdini support
TARGET_SUPPORTS_64_BIT_APPS := true
$(call inherit-product, device/intel/project-celadon/$(TARGET_PRODUCT)/houdini.mk)

PRODUCT_PACKAGES += libhoudini Houdini
PRODUCT_PROPERTY_OVERRIDES += ro.dalvik.vm.isa.arm=x86 ro.enable.native.bridge.exec=1

ENABLE_NATIVEBRIDGE_64BIT := false
ifeq ($(BOARD_USE_64BIT_USERSPACE),true)
  ENABLE_NATIVEBRIDGE_64BIT = true
else
  ifeq ($(TARGET_SUPPORTS_64_BIT_APPS),true)
    ENABLE_NATIVEBRIDGE_64BIT = true
  endif
endif
ifeq ($(ENABLE_NATIVEBRIDGE_64BIT),true)
  PRODUCT_PACKAGES += houdini64
  PRODUCT_PROPERTY_OVERRIDES += ro.dalvik.vm.isa.arm64=x86_64 ro.enable.native.bridge.exec64=1
endif
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.dalvik.vm.native.bridge=libhoudini.so
##############################################################
# Source: device/intel/mixins/groups/usb-gadget/cic-configfs/product.mk
##############################################################
PRODUCT_COPY_FILES += \
    $(INTEL_PATH_COMMON)/usb-gadget/uvc-gadget:system/vendor/bin/uvc-gadget \
    $(INTEL_PATH_COMMON)/usb-gadget/1080p.txt:system/vendor/etc/1080p.txt
##############################################################
# Source: device/intel/mixins/groups/media/mesa/product.mk
##############################################################
# libstagefrighthw
PRODUCT_PACKAGES += \
    libstagefrighthw

# Media SDK and OMX IL components
PRODUCT_PACKAGES += \
    libmfxhw32 \
    libmfx_omx_core \
    libmfx_omx_components_hw

# Open source media_driver
PRODUCT_PACKAGES += i965_drv_video
PRODUCT_PACKAGES += libigfxcmrt
PRODUCT_PACKAGES += libgrallocclient

# Open source hdcp
PRODUCT_PACKAGES += libhdcpsdk
PRODUCT_PACKAGES += lihdcpcommon

ifeq ($(BOARD_USE_64BIT_USERSPACE),true)
PRODUCT_PACKAGES += \
    libmfxhw64
endif


BOARD_HAVE_MEDIASDK_OPEN_SOURCE := true


PRODUCT_PACKAGES += \
    libpciaccess

PRODUCT_PACKAGES += \
    libva-android \
    libva

##############################################################
# Source: device/intel/mixins/groups/codecs/configurable/product.mk
##############################################################
# Audio/video codec support.
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/vendor/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/vendor/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/extra_files/codecs/media_codecs.xml:system/vendor/etc/media_codecs.xml \
    $(LOCAL_PATH)/extra_files/codecs/media_codecs_performance.xml:system/vendor/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/extra_files/codecs/mfx_omxil_core.conf:system/vendor/etc/mfx_omxil_core.conf \
    $(LOCAL_PATH)/extra_files/codecs/media_profiles_1080p.xml:system/vendor/etc/media_profiles_V1_0.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/extra_files/codecs/media_codecs_performance_bxt.xml:system/vendor/etc/media_codecs_performance.xml
##############################################################
# Source: device/intel/mixins/groups/camera-ext/ext-camera-only/product.mk
##############################################################
# Camera: Device-specific configuration files. Supports only External USB camera, no CSI support
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.external.xml:vendor/etc/permissions/android.hardware.camera.external.xml \
    $(LOCAL_PATH)/extra_files/camera-ext/external_camera_config.xml:vendor/etc/external_camera_config.xml

# External camera service
PRODUCT_PACKAGES += android.hardware.camera.provider@2.4-external-service \
                    android.hardware.camera.provider@2.4-impl

# Only include test apps in eng or userdebug builds.
PRODUCT_PACKAGES_DEBUG += TestingCamera

PRODUCT_PACKAGES += MultiCameraApp
##############################################################
# Source: device/intel/mixins/groups/bluetooth/cic/product.mk
##############################################################
# Bluetooth tools
PRODUCT_PACKAGES += \
    hciconfig \

# Bluetooth tools eng / userdebug
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
    hcitool
endif

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml

PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-service.vbt \
    libbt-vendor
##############################################################
# Source: device/intel/mixins/groups/trusty/true/product.mk
##############################################################

KM_VERSION := 2

ifeq ($(KM_VERSION),2)
PRODUCT_PACKAGES += \
	keystore.trusty
PRODUCT_PROPERTY_OVERRIDES += \
	ro.hardware.keystore=trusty
endif

ifeq ($(KM_VERSION),1)
PRODUCT_PACKAGES += \
	keystore.${TARGET_BOARD_PLATFORM}
endif

PRODUCT_PACKAGES += \
	libtrusty \
	storageproxyd \
	libinteltrustystorage \
	libinteltrustystorageinterface \
	gatekeeper.trusty \
	android.hardware.gatekeeper@1.0-impl \
	android.hardware.gatekeeper@1.0-service \

PRODUCT_PACKAGES_DEBUG += \
	intel-secure-storage-unit-test \
	gatekeeper-unit-tests \
	libscrypt_static \
	scrypt_test \

PRODUCT_PROPERTY_OVERRIDES += \
	ro.hardware.gatekeeper=trusty \
# ------------------ END MIX-IN DEFINITIONS ------------------
