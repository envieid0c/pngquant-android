LOCAL_PATH := $(call my-dir)

SRC_PATH := pngquant/lib

include $(CLEAR_VARS)
LOCAL_MODULE := imagequant
LOCAL_SRC_FILES := \
    $(SRC_PATH)/blur.c \
    $(SRC_PATH)/libimagequant.c \
    $(SRC_PATH)/mediancut.c \
    $(SRC_PATH)/mempool.c \
    $(SRC_PATH)/nearest.c \
    $(SRC_PATH)/pam.c \
    $(SRC_PATH)/viter.c 

LOCAL_C_INCLUDES := pngquant/lib

LOCAL_CFLAGS += -O3 -fno-math-errno -funroll-loops -fomit-frame-pointer -Wall -std=c99 -fopenmp
LOCAL_LDFLAGS += -fopenmp #use only when building shared library

ifeq ($(TARGET_ARCH_ABI),x86)
    LOCAL_CFLAGS += -mtune=atom -msse -mfpmath=sse -mssse3 -DUSE_SSE=1
endif

include $(BUILD_SHARED_LIBRARY)

