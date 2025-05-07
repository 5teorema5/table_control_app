cmake_minimum_required(VERSION 3.16)

project(table_control VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(apptable_control
    main.cpp
)

qt_add_qml_module(apptable_control
    URI table_control
    VERSION 1.0
    QML_FILES
        Main.qml
        RESOURCES src/resources.qrc
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(apptable_control PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.apptable_control
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(apptable_control
    PRIVATE Qt6::Quick
    Qt6::3DCore
    Qt6::3DRender
    Qt6::3DLogic
    Qt6::3DExtras
    Qt6::3DAnimation
)

include(GNUInstallDirs)
install(TARGETS apptable_control
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

find_package(Qt6 REQUIRED COMPONENTS
    Quick3D
    3DCore
    3DRender
    3DInput
    3DLogic
    3DExtras
    3DAnimation
)

file(COPY assets/ DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/assets)
