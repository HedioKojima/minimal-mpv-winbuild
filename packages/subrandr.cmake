ExternalProject_Add(subrandr
    DEPENDS
        freetype2
        harfbuzz
    GIT_REPOSITORY https://github.com/afishhh/subrandr.git
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_CLONE_FLAGS "--filter=tree:0"
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ${EXEC}
        LD_PRELOAD=
        CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
        ${cargo_lto_rustflags}
        cargo xtask install
        --prefix ${MINGW_INSTALL_PREFIX}
        --target ${RUST_TARGET}
        --shared-library false
        --static-library true
    BUILD_IN_SOURCE 1
    INSTALL_COMMAND ""
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(subrandr)
cleanup(subrandr install)
