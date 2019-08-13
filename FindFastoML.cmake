# FindFastoML.cmake - Try to find the player library
# Once done this will define
#
#  FASTOML_FOUND - System has player
#  FASTOML_INCLUDE_DIR - The player include directory
#  FASTOML_LIBRARIES - The libraries needed to use player

FIND_PATH(FASTOML_INCLUDE_DIRS NAMES fastoml/config.h
 HINTS /usr /usr/local /opt PATH_SUFFIXES include
)

FIND_LIBRARY(FASTOML_LIBRARY NAMES fastoml
 HINTS /usr /usr/local /opt
)

SET(FASTOML_LIBRARIES ${FASTOML_LIBRARIES} ${FASTOML_LIBRARY})

FIND_PATH(FASTOML_GST_INCLUDE_DIRS NAMES fastoml/gst/config.h
 HINTS /usr /usr/local /opt PATH_SUFFIXES include
)

FIND_LIBRARY(FASTOML_GST_LIBRARY NAMES fastoml_backends
 HINTS /usr /usr/local /opt
)

IF (FASTOML_GST_INCLUDE_DIRS AND FASTOML_GST_LIBRARY)
  SET(FASTOML_LIBRARIES ${FASTOML_LIBRARIES} ${FASTOML_GST_LIBRARY})
ENDIF (FASTOML_GST_INCLUDE_DIRS AND FASTOML_GST_LIBRARY)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(fastoml DEFAULT_MSG FASTOML_LIBRARIES FASTOML_INCLUDE_DIRS)
MARK_AS_ADVANCED(FASTOML_INCLUDE_DIRS FASTOML_LIBRARIES)

