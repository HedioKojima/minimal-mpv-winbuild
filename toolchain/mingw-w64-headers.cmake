ExternalProject_Add(mingw-w64-headers
    DEPENDS
        mingw-w64
    DOWNLOAD_COMMAND ""
    SOURCE_DIR ${MINGW_SRC}
    CONFIGURE_COMMAND <SOURCE_DIR>/mingw-w64-headers/configure
        --host=${TARGET_ARCH}
        --prefix=${MINGW_INSTALL_PREFIX}
        --enable-idl
    BUILD_COMMAND ""
    INSTALL_COMMAND make install-strip
    LOG_CONFIGURE 1 LOG_INSTALL 1
)

cleanup(mingw-w64-headers install)
