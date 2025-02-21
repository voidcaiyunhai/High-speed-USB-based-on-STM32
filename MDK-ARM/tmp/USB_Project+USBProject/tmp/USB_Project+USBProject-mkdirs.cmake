# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "E:/project/USB_Project/MDK-ARM/tmp/USB_Project+USBProject"
  "E:/project/USB_Project/MDK-ARM/tmp/1"
  "E:/project/USB_Project/MDK-ARM/tmp/USB_Project+USBProject"
  "E:/project/USB_Project/MDK-ARM/tmp/USB_Project+USBProject/tmp"
  "E:/project/USB_Project/MDK-ARM/tmp/USB_Project+USBProject/src/USB_Project+USBProject-stamp"
  "E:/project/USB_Project/MDK-ARM/tmp/USB_Project+USBProject/src"
  "E:/project/USB_Project/MDK-ARM/tmp/USB_Project+USBProject/src/USB_Project+USBProject-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "E:/project/USB_Project/MDK-ARM/tmp/USB_Project+USBProject/src/USB_Project+USBProject-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "E:/project/USB_Project/MDK-ARM/tmp/USB_Project+USBProject/src/USB_Project+USBProject-stamp${cfgdir}") # cfgdir has leading slash
endif()
