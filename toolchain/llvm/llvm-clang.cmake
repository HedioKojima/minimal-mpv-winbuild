# workflow for clang compilation:
# mingw's header+crt -> compiler-rt builtins -> libcxx
ExternalProject_Add(llvm-clang
    DEPENDS
        llvm-libcxx
        winpthreads
        cppwinrt
    DOWNLOAD_COMMAND ""
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
    COMMENT "Dummy target to setup target toolchain"
)
