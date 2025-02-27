# Copyright (C) 2013 The CyanogenMod Project
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

LOCAL_PATH:= $(call my-dir)
# HAL module implemenation stored in
# hw/<COPYPIX_HARDWARE_MODULE_ID>.<ro.board.platform>.so
include $(CLEAR_VARS)

LOCAL_CFLAGS += \
    -Wno-unused-parameter \
    -Wno-unused-function

ifeq ($(BOARD_HAVE_GENERIC_BLN),true)
    LOCAL_CFLAGS += -DGENERIC_BLN
endif

ifeq ($(BOARD_HAVE_MULTI_COLOR_LED),true)
    LOCAL_CFLAGS += -DMULTI_COLOR_LED
endif

LOCAL_SRC_FILES := lights.c

LOCAL_MODULE_RELATIVE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw

LOCAL_SHARED_LIBRARIES := liblog

LOCAL_MODULE := lights.montblanc

LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
