cmake_minimum_required(VERSION 3.13)

set(PICO_SDK_PATH ../../pico-sdk)
include(pico_sdk_import.cmake)

get_filename_component(PROJ_NAME ${CMAKE_CURRENT_SOURCE_DIR} NAME)

message(STATUS "building project \"${PROJ_NAME}\"...")

# project([project_name] C CXX ASM)
# output : [project_name].uf2
project(${PROJ_NAME}
  LANGUAGES
    C
    CXX
    ASM
  VERSION
    1.0.0
)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

pico_sdk_init()

include_directories(
    ./include
)

# add_executable(${PROJECT_NAME} [src1.c] [src2.c] [src3.c] ...)
add_executable(${PROJECT_NAME} src/main.cpp)

add_subdirectory(lib)

pico_add_extra_outputs(${PROJECT_NAME})

target_link_libraries(${PROJECT_NAME} pico_stdlib)

pico_enable_stdio_usb(${PROJECT_NAME} 1)
pico_enable_stdio_uart(${PROJECT_NAME} 0)

message(STATUS "building project \"${PROJ_NAME}\" completed!")