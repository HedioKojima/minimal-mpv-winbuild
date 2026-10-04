ExternalProject_Add(rustup
    DOWNLOAD_COMMAND ""
    SOURCE_DIR rustup-prefix/src
    CONFIGURE_COMMAND ${EXEC}
        curl -sSf https://sh.rustup.rs |
        sh -s -- -y --target ${RUST_TARGET} --no-modify-path --profile minimal
    BUILD_COMMAND ${EXEC} rustup update
    INSTALL_COMMAND ""
    LOG_CONFIGURE 1 LOG_BUILD 1
)

cleanup(rustup install)
