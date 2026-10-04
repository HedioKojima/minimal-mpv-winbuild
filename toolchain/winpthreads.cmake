ExternalProject_Add(winpthreads
    DEPENDS
        mingw-w64-crt
    DOWNLOAD_COMMAND ""
    SOURCE_DIR ${MINGW_SRC}
    CONFIGURE_COMMAND ${EXEC} CONF=1 <SOURCE_DIR>/mingw-w64-libraries/winpthreads/configure
        --host=${TARGET_ARCH}
        --prefix=${MINGW_INSTALL_PREFIX}
        --disable-shared
    BUILD_COMMAND ${MAKE} LTO=0 GC=0
    INSTALL_COMMAND ${MAKE} install
    LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

cleanup(winpthreads install)
