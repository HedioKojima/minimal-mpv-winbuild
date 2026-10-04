ExternalProject_Add(mingw-w64-headers
    DEPENDS
        mingw-w64
    DOWNLOAD_COMMAND ""
    SOURCE_DIR ${MINGW_SRC}
    CONFIGURE_COMMAND ${EXEC} CONF=1 <SOURCE_DIR>/mingw-w64-headers/configure
        --host=${TARGET_ARCH}
        --prefix=${MINGW_INSTALL_PREFIX}
    BUILD_COMMAND ""
    INSTALL_COMMAND ${MAKE} install
    LOG_CONFIGURE 1 LOG_INSTALL 1
)

cleanup(mingw-w64-headers install)
