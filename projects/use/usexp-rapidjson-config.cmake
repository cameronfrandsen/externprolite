# RAPIDJSON_FOUND - RapidJSON was found
# RAPIDJSON_VER - RapidJSON version
# RAPIDJSON_INCLUDE_DIR - the RapidJSON include directory
set(prj rapidjson)
# this file (-config) installed to share/cmake
get_filename_component(XP_ROOTDIR ${CMAKE_CURRENT_LIST_DIR}/../.. ABSOLUTE)
get_filename_component(XP_ROOTDIR ${XP_ROOTDIR} ABSOLUTE) # remove relative parts
string(TOUPPER ${prj} PRJ)
set(${PRJ}_VER "@VER@ [@PROJECT_NAME@]")
set(verDir /${prj}_@VER@)
unset(${PRJ}_INCLUDE_DIR CACHE)
find_path(${PRJ}_INCLUDE_DIR rapidjson/rapidjson.h PATHS ${XP_ROOTDIR}/include${verDir} NO_DEFAULT_PATH)
set(reqVars ${PRJ}_VER ${PRJ}_INCLUDE_DIR)
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(${prj} REQUIRED_VARS ${reqVars})
mark_as_advanced(${reqVars})
