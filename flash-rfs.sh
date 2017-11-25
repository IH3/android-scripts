#!/bin/bash
# Copyright (C) 2017 'icrunchbanger' icrunchbanger@gmail.com

# This software is licensed under the terms of the GNU General Public
# License version 2, as published by the Free Software Foundation, and
# may be copied, distributed, and modified under those terms.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

function wait-for-device {
    until adb shell true 2> /dev/null
    do
        sleep 1
    done
}

fastboot erase recovery 
fastboot erase boot
fastboot erase cache
fastboot erase system
fastboot erase userdata
fastboot erase vendor
fastboot reboot-bootloader
sleep 5
fastboot erase recovery 
fastboot erase boot
fastboot format cache
fastboot format system
fastboot format userdata
fastboot format vendor
fastboot reboot-bootloader
sleep 5
for file in twrp*.img; do fastboot flash recovery $file; done
fastboot boot twrp*.img
wait-for-device
adb reboot recovery
wait-for-device
sleep 5
for file in miui*.zip rom*.zip open_gapps-arm64*.zip Magisk*.zip iYTBPforMagisk*.zip Font*.zip ADS*.zip; do adb push $file /sdcard; done
sleep 3
adb shell twrp install /sdcard/miui*.zip
sleep 3
adb shell twrp install /sdcard/rom*.zip
sleep 3
adb shell twrp install /sdcard/open_gapps-arm64*.zip
sleep 3
adb shell twrp install /sdcard/Magisk*.zip
sleep 3
adb shell twrp install /sdcard/iYTBPforMagisk*.zip
sleep 3
adb shell twrp install /sdcard/Font*.zip
sleep 3
adb shell twrp install /sdcard/ADS*.zip
sleep 3
adb shell twrp wipe dalvik 
adb shell twrp wipe cache
adb reboot



exit
