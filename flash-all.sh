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


for file in bootloader*.img; do fastboot flash bootloader $file; done
fastboot reboot-bootloader
sleep 5
for file in radio*.img; do fastboot flash radio $file; done
fastboot reboot-bootloader
sleep 5
for file in image*.zip; do fastboot -w update $file; done

exit
