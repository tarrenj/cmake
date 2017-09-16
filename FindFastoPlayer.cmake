# FindFastoPlayer.cmake - Try to find the player library
# Once done this will define
#
#  FASTO_PLAYER_FOUND - System has player
#  FASTO_PLAYER_INCLUDE_DIR - The player include directory
#  FASTO_PLAYER_LIBRARIES - The libraries needed to use player

FIND_PATH(FASTO_PLAYER_INCLUDE_DIR NAMES player/types.h
 HINTS /usr /usr/local /opt PATH_SUFFIXES include
)

FIND_LIBRARY(FASTO_PLAYER_MEDIA_LIBRARY NAMES fastoplayer_media
 HINTS /usr /usr/local /opt
)

FIND_LIBRARY(FASTO_PLAYER_LIBRARY NAMES fastoplayer
 HINTS /usr /usr/local /opt
)

SET(FASTO_PLAYER_LIBRARIES ${FASTO_PLAYER_LIBRARIES} ${FASTO_PLAYER_MEDIA_LIBRARY})

IF(FASTO_PLAYER_LIBRARY)
  SET(FASTO_PLAYER_LIBRARIES ${FASTO_PLAYER_LIBRARIES} ${FASTO_PLAYER_LIBRARY})
ENDIF(FASTO_PLAYER_LIBRARY)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(fastoplayer DEFAULT_MSG FASTO_PLAYER_LIBRARIES FASTO_PLAYER_INCLUDE_DIR)
MARK_AS_ADVANCED(FASTO_PLAYER_INCLUDE_DIR FASTO_PLAYER_LIBRARIES)
