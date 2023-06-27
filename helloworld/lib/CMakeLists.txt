message(STATUS "building libs...")

add_subdirectory(lib_test)
add_subdirectory(lib_test_test)

# 헤더파일을 추가하는 곳을 지정. #include "Adder/adder.h"라고 안적을 수 있다.
target_include_directories(${PROJECT_NAME}
  PRIVATE
    lib_test
    lib_test_test
)

# 링크할 라이브러리를 찾는곳. 디렉토리를 빌드하기 위해 경로를 지정한다. 이때 경로는 build된 파일이 있는 경로. 즉, out/build 기준이다.
target_link_directories(${PROJECT_NAME}
  PRIVATE
    lib_test
    lib_test_test
)

# exe파일에 링크할 라이브러리
target_link_libraries(${PROJECT_NAME}
  lib_test
  lib_test_test
)

message(STATUS "building libs completed!")