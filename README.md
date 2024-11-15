# rpi-pico-sample-project

라즈베리파이 피코 (2 & W) 보드 사용을 위한 간단한 샘플 프로젝트

코드의 일부는 [raspberrypi/pico-examples](https://github.com/raspberrypi/pico-examples)에서 가져옴

스크립트는 우분투에서만 테스트 해봄

## 환경 세팅하기

pico-sdk 설치법 ([https://lindevs.com/set-up-raspberry-pi-pico-sdk-on-ubuntu](https://lindevs.com/set-up-raspberry-pi-pico-sdk-on-ubuntu))

gcc-arm-none-eabi는 설치가 잘 안돼서, 좀 다르게 설치해야 함 ([https://unix.stackexchange.com/questions/377345/installing-arm-none-eabi-gcc](https://unix.stackexchange.com/questions/377345/installing-arm-none-eabi-gcc))
<br>
```
sudo apt update
sudo apt install -y build-essential git cmake gcc-arm-none-eabi
sudo git clone [[https://github.com/raspberrypi/pico-sdk.git\](https://github.com/raspberrypi/pico-sdk.git)](https://github.com/raspberrypi/pico-sdk.git](https://github.com/raspberrypi/pico-sdk.git)) /opt/pico-sdk
sudo git -C /opt/pico-sdk submodule update --init
echo 'export PICO_SDK_PATH=/opt/pico-sdk' | sudo tee -a /etc/profile.d/pico-sdk.sh
source /etc/profile.d/pico-sdk.sh
```

## 샘플 프로젝트들

### helloworld

코드 자체는 별거 없지만 라이브러리를 추가하기 위한 구조를 넣어둔 프로젝트

이 프로젝트 외에는 라이브러리를 다 없애고 폴더만 남겨뒀으므로 헤더 한두개만 사용할거면 그걸 베이스로 사용하면 좋음

### blink\_w

pico w 보드는 빌트인 led가 rp2040이 아니라 무선 모듈에 달려있어서 만들어둔 프로젝트

### blink\_rp2350

rp2350용 프로젝트. 나중에는 그냥 옵션에 따라 둘 다 빌드할 수 있게 해도 괜찮을 듯

### pio\_test

PIO 기능은 .pio를 변환하는 것 때문에 CMakeLists.txt를 몇 줄 변경해야 해서 추가해둠

## 라이브러리 추가

lib 디렉토리 내의 lib\_test 복사해 원하는 라이브러리 이름으로 바꾸고,

디렉토리 내의 \*.hpp, \*.cpp 파일의 이름을 설정했던 라이브러리 이름으로 변경해 사용

그리고 lib 디렉토리에서 CMakeLists.txt 수정해 라이브러리 추가해야 함

(전부 추가하는 방법이 있을 거 같은데 아직 모르겠음)

## 스크립트 사용

### pico\_build.sh

(프로젝트 폴더 이름).uf2 로 바이너리 생성

### pico\_upload.sh

(프로젝트 폴더 이름).uf2 를 RPI-RP2에 업로드
정확히는 `/media/(user)/RPI-RP2`에 이동시킴

따라서, 어떤 이유로 디렉토리가 달라지면 실패함. 되도록이면 그냥 직접 이동시킬것

### pico\_clean.sh

프로젝트 폴더 내의 build 폴더 삭제
