ExternalProject_Add(spirv-cross
    GIT_REPOSITORY https://github.com/KhronosGroup/SPIRV-Cross.git
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_TAG main
    GIT_CLONE_FLAGS "--sparse --filter=tree:0"
    GIT_CLONE_POST_COMMAND "sparse-checkout set --no-cone /* !/reference !/samples !/shaders* !/tests-other"
    UPDATE_COMMAND ""
    PATCH_COMMAND ${EXEC} git am --3way ${CMAKE_CURRENT_SOURCE_DIR}/spirv-cross-0001-static-linking-hacks.patch
    CONFIGURE_COMMAND ${EXEC} CONF=1 ${CMAKE_COMMAND} -H<SOURCE_DIR> -B<BINARY_DIR>
        -G Ninja
        -DCMAKE_BUILD_TYPE=Release
        -DCMAKE_TOOLCHAIN_FILE=${TOOLCHAIN_FILE}
        -DCMAKE_INSTALL_PREFIX=${MINGW_INSTALL_PREFIX}
        -DSPIRV_CROSS_CLI=OFF
        -DSPIRV_CROSS_ENABLE_CPP=OFF
        -DSPIRV_CROSS_ENABLE_MSL=OFF
        -DSPIRV_CROSS_ENABLE_REFLECT=OFF
        -DSPIRV_CROSS_EXCEPTIONS_TO_ASSERTIONS=ON
        -DSPIRV_CROSS_SHARED=ON
        -DSPIRV_CROSS_STATIC=OFF
    BUILD_COMMAND ${EXEC} ninja -C <BINARY_DIR>
    INSTALL_COMMAND ${EXEC} ninja -C <BINARY_DIR> install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(spirv-cross)
cleanup(spirv-cross install)
