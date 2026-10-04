ExternalProject_Add(mpv
    DEPENDS
        amf-headers
        curl
        ffmpeg
        lcms2
        libarchive
        libass
        libbluray
        libiconv
        libjpeg
        libplacebo
        libzimg
        luajit
        nvcodec-headers
        shaderc
        spirv-cross
        subrandr
        uchardet
        vulkan
        zlib
    GIT_REPOSITORY https://github.com/mpv-player/mpv.git
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_CLONE_FLAGS "--sparse --filter=tree:0"
    GIT_CLONE_POST_COMMAND "sparse-checkout set --no-cone /* !/fuzzers !/test"
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ${EXEC} CONF=1 meson setup <BINARY_DIR> <SOURCE_DIR>
        --prefix=${MINGW_INSTALL_PREFIX}
        --cross-file=${MESON_CROSS}
        --buildtype=release
        --prefer-static
        -Damf=enabled
        -Dcdda=disabled
        -Dcplugins=disabled
        -Dcuda-hwaccel=enabled
        -Dcuda-interop=enabled
        -Dd3d-hwaccel=enabled
        -Dd3d11=enabled
        -Dd3d9-hwaccel=disabled
        -Ddirect3d=disabled
        -Ddvdnav=disabled
        -Dgl=disabled
        -Diconv=enabled
        -Djavascript=disabled
        -Djpeg=enabled
        -Dlcms2=enabled
        -Dlibarchive=enabled
        -Dlibavdevice=enabled
        -Dlibbluray=enabled
        -Dlibcurl=enabled
        -Dlibmpv=false
        -Dlua=luajit
        -Dmanpage-build=disabled
        -Drubberband=disabled
        -Dshaderc=enabled
        -Dspirv-cross=enabled
        -Dsubrandr=enabled
        -Duchardet=enabled
        -Dvapoursynth=disabled
        -Dvector=enabled
        -Dvulkan=enabled
        -Dwasapi=enabled
        -Dwin32-smtc=enabled
        -Dzimg=enabled
        -Dzlib=enabled
    BUILD_COMMAND ${EXEC} LTO_JOB=1 ninja -C <BINARY_DIR>
    INSTALL_COMMAND ${EXEC} meson install -C <BINARY_DIR> --no-rebuild --tags runtime
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(mpv)
force_meson_configure(mpv)
cleanup(mpv install)
