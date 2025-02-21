
cmake_minimum_required(VERSION 3.15)

set(command "C:/Users/void/.vcpkg/artifacts/2139c4c6/tools.kitware.cmake/3.28.4/bin/cmake.exe;-G;Ninja;-S;E:/project/USB_Project/MDK-ARM/tmp/USB_Project+USBProject;-B;E:/project/USB_Project/MDK-ARM/tmp/1;-DSOLUTION_ROOT=E:/project/USB_Project/MDK-ARM;-DCMSIS_PACK_ROOT=C:/Users/void/AppData/Local/arm/packs;-DCMSIS_COMPILER_ROOT=C:/Users/void/.vcpkg/artifacts/2139c4c6/tools.open.cmsis.pack.cmsis.toolbox/2.6.1/etc")
set(log_merged "")
set(log_output_on_failure "ON")
set(stdout_log "E:/project/USB_Project/MDK-ARM/tmp/USB_Project+USBProject/src/USB_Project+USBProject-stamp/USB_Project+USBProject-configure-out.log")
set(stderr_log "E:/project/USB_Project/MDK-ARM/tmp/USB_Project+USBProject/src/USB_Project+USBProject-stamp/USB_Project+USBProject-configure-err.log")
execute_process(
  COMMAND ${command}
  RESULT_VARIABLE result
  OUTPUT_FILE "${stdout_log}"
  ERROR_FILE "${stderr_log}"
)
macro(read_up_to_max_size log_file output_var)
  file(SIZE ${log_file} determined_size)
  set(max_size 10240)
  if (determined_size GREATER max_size)
    math(EXPR seek_position "${determined_size} - ${max_size}")
    file(READ ${log_file} ${output_var} OFFSET ${seek_position})
    set(${output_var} "...skipping to end...\n${${output_var}}")
  else()
    file(READ ${log_file} ${output_var})
  endif()
endmacro()
if(result)
  set(msg "Command failed: ${result}\n")
  foreach(arg IN LISTS command)
    set(msg "${msg} '${arg}'")
  endforeach()
  if (${log_merged})
    set(msg "${msg}\nSee also\n  ${stderr_log}")
  else()
    set(msg "${msg}\nSee also\n  E:/project/USB_Project/MDK-ARM/tmp/USB_Project+USBProject/src/USB_Project+USBProject-stamp/USB_Project+USBProject-configure-*.log")
  endif()
  if (${log_output_on_failure})
    message(SEND_ERROR "${msg}")
    if (${log_merged})
      read_up_to_max_size("${stderr_log}" error_log_contents)
      message(STATUS "Log output is:\n${error_log_contents}")
    else()
      read_up_to_max_size("${stdout_log}" out_log_contents)
      read_up_to_max_size("${stderr_log}" err_log_contents)
      message(STATUS "stdout output is:\n${out_log_contents}")
      message(STATUS "stderr output is:\n${err_log_contents}")
    endif()
    message(FATAL_ERROR "Stopping after outputting logs.")
  else()
    message(FATAL_ERROR "${msg}")
  endif()
else()
  if(NOT "Ninja" MATCHES "Ninja")
    set(msg "USB_Project+USBProject configure command succeeded.  See also E:/project/USB_Project/MDK-ARM/tmp/USB_Project+USBProject/src/USB_Project+USBProject-stamp/USB_Project+USBProject-configure-*.log")
    message(STATUS "${msg}")
  endif()
endif()
