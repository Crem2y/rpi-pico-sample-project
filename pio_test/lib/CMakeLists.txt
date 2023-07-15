message(STATUS "building libs...")


# 헤더파일을 추가하는 곳을 지정. #include "Adder/adder.h"라고 안적을 수 있다.
target_include_directories(${PROJECT_NAME}
  PRIVATE

)

# 링크할 라이브러리를 찾는곳. 디렉토리를 빌드하기 위해 경로를 지정한다. 이때 경로는 build된 파일이 있는 경로. 즉, out/build 기준이다.
target_link_directories(${PROJECT_NAME}
  PRIVATE

)

# exe파일에 링크할 라이브러리
target_link_libraries(${PROJECT_NAME}

)

message(STATUS "building libs completed!")