MACRO(VersionConf prjName from_file to_file iconname)
  SET(COMPANYNAME "\"${PROJECT_COMPANYNAME}\"")
  SET(filecontent "
    SET(ICON_FILE ${ICON_FILE})
    SET(MAJOR_VER   ${PROJECT_VERSION_MAJOR} )
    SET(MINOR_VER1  ${PROJECT_VERSION_MINOR})
    SET(MINOR_VER2  ${PROJECT_VERSION_PATCH})
    SET(PRODUCTNAME ${PROJECT_NAME_LOWERCASE})
    SET(COMPANYNAME ${COMPANYNAME})
    SET(PRODUCTDOMAIN ${PROJECT_DOMAIN})
    SET(SHORTPRODUCTNAME ${prjName})
    SET(ICONNAME ${iconname})
    SET(PRODUCTCOPYRIGHT ${PROJECT_COPYRIGHT})
    CONFIGURE_FILE(${from_file} ${to_file})
  ")
  FILE(WRITE "${CMAKE_CURRENT_BINARY_DIR}/versionConfFile.cmake" "${filecontent}")
  ADD_CUSTOM_TARGET(VersionConf ALL DEPENDS ${to_file})
  ADD_CUSTOM_COMMAND(OUTPUT ${to_file} COMMAND ${CMAKE_COMMAND} -DSOURCE_DIR=${CMAKE_CURRENT_SOURCE_DIR} -P ${CMAKE_CURRENT_BINARY_DIR}/versionConfFile.cmake)
    SET_SOURCE_FILES_PROPERTIES(${to_file} PROPERTIES GENERATED TRUE #HEADER_FILE_ONLY TRUE
  )
  ADD_DEPENDENCIES(${prjName} VersionConf)
ENDMACRO(VersionConf)
