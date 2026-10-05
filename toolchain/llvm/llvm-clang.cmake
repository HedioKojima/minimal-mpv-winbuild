# workflow for clang compilation:
# mingw's header+crt -> compiler-rt builtins -> libcxx
ExternalProject_Add(llvm-clang
    DEPENDS
        cppwinrt
        llvm-libcxx
        winpthreads
    DOWNLOAD_COMMAND ""
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
)
