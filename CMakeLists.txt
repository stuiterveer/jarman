cmake_minimum_required(VERSION 3.0.0)
project(cutyfin C CXX)

# Automatically create moc files
set(CMAKE_AUTOMOC ON)

find_package(Qt5Core REQUIRED)
find_package(Qt5Qml REQUIRED)
find_package(Qt5Quick REQUIRED)
find_package(Qt5QuickControls2 REQUIRED)

execute_process(
    COMMAND dpkg-architecture -qDEB_HOST_MULTIARCH
    OUTPUT_VARIABLE ARCH_TRIPLET
    OUTPUT_STRIP_TRAILING_WHITESPACE
)
set(QT_IMPORTS_DIR "lib/${ARCH_TRIPLET}")

set(PROJECT_NAME "jarman")
set(FULL_PROJECT_NAME "jarman.stuiterveer")
set(DATA_DIR /)
set(DESKTOP_FILE_NAME ${PROJECT_NAME}.desktop)

# This command figures out the minimum SDK framework for use in the manifest
# file via the environment variable provided by Clickable or sets a default value otherwise.
if(DEFINED ENV{SDK_FRAMEWORK})
    set(CLICK_FRAMEWORK "$ENV{SDK_FRAMEWORK}")
else()
    set(CLICK_FRAMEWORK "ubuntu-sdk-20.04")
endif()

# This figures out the target architecture for use in the manifest file.
if(DEFINED ENV{ARCH})
    set(CLICK_ARCH "$ENV{ARCH}")
else()
    execute_process(
        COMMAND dpkg-architecture -qDEB_HOST_ARCH
        OUTPUT_VARIABLE CLICK_ARCH
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )
endif()

qt5_add_resources(QT_RESOURCES qml/qml.qrc)
qt5_add_resources(QT_RESOURCES utils/utils.qrc)
add_executable(${PROJECT_NAME} main.cpp ${QT_RESOURCES})
set_target_properties(${PROJECT_NAME} PROPERTIES LINK_FLAGS_RELEASE -s)
target_link_libraries(${PROJECT_NAME} Qt5::Gui Qt5::Qml Qt5::Quick Qt5::QuickControls2)
install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX})