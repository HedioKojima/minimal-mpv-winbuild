set(version "v3.31.6")
set(modules_dir ${CMAKE_CURRENT_BINARY_DIR}/cmake/Modules)

if(NOT EXISTS "${modules_dir}/setup_done")
    # Download github folder via https://download-directory.github.io/?url=https://github.com/Kitware/CMake/tree/v3.31.6/Modules/ExternalProject
    file(ARCHIVE_EXTRACT
        INPUT ${CMAKE_CURRENT_SOURCE_DIR}/cmake/CMake-${version}-Modules-ExternalProject.zip
        DESTINATION ${modules_dir}/ExternalProject
    )
    file(DOWNLOAD https://github.com/Kitware/CMake/raw/refs/tags/${version}/Modules/ExternalProject.cmake
        ${modules_dir}/ExternalProject.cmake
        EXPECTED_HASH SHA256=303d2222b3b39df5e94997ec64a07f6877bbf5297978bf3134347389200da695
    )
    execute_process(
        COMMAND patch -p1 -i ${CMAKE_CURRENT_SOURCE_DIR}/packages/cmake-0001-ExternalProject-changes.patch
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/cmake
        COMMAND_ERROR_IS_FATAL ANY
    )
    file(TOUCH ${modules_dir}/setup_done)
endif()

include(${modules_dir}/ExternalProject.cmake)
