set(EXPORT
    "CROSS=${TARGET_ARCH}-
    TARGET_SYS=Windows
    BUILDMODE=static
    FILE_T=luajit.exe
    INSTALL_DEP=src/luajit.exe
    XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT'
    PREFIX=${MINGW_INSTALL_PREFIX} Q="
)

ExternalProject_Add(luajit
    GIT_REPOSITORY https://github.com/LuaJIT/LuaJIT.git
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_CLONE_FLAGS "--sparse --filter=tree:0"
    GIT_CLONE_POST_COMMAND "sparse-checkout set --no-cone /* !/doc"
    GIT_REMOTE_NAME origin
    GIT_TAG v2.1
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ${MAKE} -C <SOURCE_DIR>/src ${EXPORT} amalg
    INSTALL_COMMAND ${MAKE} ${EXPORT} install
    BUILD_IN_SOURCE 1
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

# Strip Libs.private (-Wl,-E -lm -ldl), not needed for Windows
ExternalProject_Add_Step(luajit strip-pc
    DEPENDEES install
    COMMAND ${EXEC} sed -i [['/^Libs\.private/d']] ${MINGW_INSTALL_PREFIX}/lib/pkgconfig/luajit.pc
)

force_rebuild_git(luajit)
cleanup(luajit strip-pc)
