ExternalProject_Add(harfbuzz
    DEPENDS
        freetype2
    GIT_REPOSITORY https://github.com/harfbuzz/harfbuzz.git
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_TAG main
    GIT_REMOTE_NAME origin
    GIT_CLONE_FLAGS "--sparse --filter=tree:0"
    GIT_CLONE_POST_COMMAND "sparse-checkout set --no-cone /* !/docs !/perf !/test !/util"
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ${EXEC} CONF=1 meson setup <BINARY_DIR> <SOURCE_DIR>
        --prefix=${MINGW_INSTALL_PREFIX}
        --cross-file=${MESON_CROSS}
        --buildtype=release
        --default-library=static
        -Dcairo=disabled
        -Dchafa=disabled
        -Ddocs=disabled
        -Dfreetype=enabled
        -Dglib=disabled
        -Dgobject=disabled
        -Dgpu=disabled
        -Dicu=disabled
        -Dpng=disabled
        -Draster=disabled
        -Dsubset=disabled
        -Dtests=disabled
        -Dutilities=disabled
        -Dvector=disabled
        -Dzlib=disabled
    BUILD_COMMAND ${EXEC} ninja -C <BINARY_DIR>
    INSTALL_COMMAND ${EXEC} ninja -C <BINARY_DIR> install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(harfbuzz)
force_meson_configure(harfbuzz)
cleanup(harfbuzz install)
