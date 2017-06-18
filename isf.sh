#!/bin/bash

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
for file in bootloader*.img; do fastboot flash bootloader $file; done
fastboot reboot-bootloader
sleep 5
for file in radio*.img; do fastboot flash radio $file; done
fastboot reboot-bootloader
sleep 5
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
for file in vendor*.img; do fastboot flash vendor $file; done
fastboot reboot-bootloader
sleep 5
for file in twrp*.img; do fastboot flash recovery $file; done
fastboot boot twrp*.img
wait-for-device
adb reboot recovery
wait-for-device
sleep 10
for file in ABC*.zip GApps*.zip superuser.zip ADB.zip SSM.zip ADS.zip; do adb push $file /sdcard; done
adb shell twrp install ABC*.zip
adb shell twrp install GApps*.zip
adb shell twrp install superuser.zip
adb shell twrp install ADB.zip
adb shell twrp install SSM.zip
adb shell twrp install ADS.zip
adb shell twrp wipe dalvik 
adb shell twrp wipe cache
adb reboot



exit
