# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\apptable_control_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\apptable_control_autogen.dir\\ParseCache.txt"
  "apptable_control_autogen"
  )
endif()
