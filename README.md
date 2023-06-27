# rpi-pico-sample-project
라즈베리파이 피코 사용을 위한 샘플 프로젝트

## 라이브러리 추가 시
lib 디렉토리 내의 lib_test 복사해 원하는 라이브러리 이름으로 바꾸고,

디렉토리 내의 *.hpp, *.cpp 파일의 이름을 설정했던 라이브러리 이름으로 변경해 사용

## 스크립트 사용

pico_build.sh 사용 시 (프로젝트 폴더 이름).uf2 로 바이너리 생성

pico_upload.sh 사용 시 helloworld.uf2 업로드 (하드코딩이라 바꿔야 함)

pico_clean.sh 사용 시 build 폴더 삭제
