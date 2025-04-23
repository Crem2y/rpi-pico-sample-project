# rpi-pico-sample-project

라즈베리파이 피코 (2 & W) 보드 사용을 위한 간단한 샘플 프로젝트

코드의 일부는 [raspberrypi/pico-examples](https://github.com/raspberrypi/pico-examples)에서 가져왔습니다.

스크립트는 우분투에서만 테스트 해봤습니다.

## 환경 세팅하기

pico-sdk 설치법 ([https://lindevs.com/set-up-raspberry-pi-pico-sdk-on-ubuntu](https://lindevs.com/set-up-raspberry-pi-pico-sdk-on-ubuntu))

gcc-arm-none-eabi는 설치가 잘 안돼서, 좀 다르게 설치했습니다. ([https://unix.stackexchange.com/questions/377345/installing-arm-none-eabi-gcc](https://unix.stackexchange.com/questions/377345/installing-arm-none-eabi-gcc))
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

라이브러리를 추가하기 위한 구조를 넣어둔 프로젝트입니다.

이 프로젝트 외에는 라이브러리 없이 폴더만 남겨뒀으므로 간단한 프로젝트에 사용한다면 그걸 베이스로 사용하면 좋습니다.

### blink\_w

pico w 보드의 빌트인 led가 rp2040이 아니라 무선 모듈에 달려있어서 별도로 만들어둔 프로젝트입니다.

### blink\_rp2350

rp2350용 프로젝트입니다. 추후 옵션에 따라 둘 다 빌드할 수 있게 하는 것도 좋아보입니다.

### pio\_test

PIO 기능은 .pio의 어셈블 과정이 필요해 CMakeLists.txt를 몇 줄 변경해야 해서 추가했습니다.

## 라이브러리 추가

lib 디렉토리 내의 lib\_test를 복사해 원하는 라이브러리 이름으로 바꾸고,

디렉토리 내의 \*.hpp, \*.cpp 파일의 이름을 설정했던 라이브러리 이름으로 변경해 사용하면 됩니다.

그리고 lib 디렉토리에서 CMakeLists.txt를 수정해 라이브러리를 별도로 추가해야 합니다.

(폴더 내에서 전부 추가하는 방법이 있을 거 같은데 아직은 잘 모르겠습니다.)

## 스크립트 사용

빌드의 경우 환경변수 설정이 포함되어있어 root 권한이 필요합니다. (수정예정)

### pico\_build.sh

(프로젝트 폴더 이름).uf2 로 플래시용 바이너리를 생성합니다.

### pico\_upload.sh

(프로젝트 폴더 이름).uf2 를 RPI-RP2에 업로드합니다.
정확히는 `/media/(user)/RPI-RP2`에 이동시킵니다.

따라서, 디렉토리 경로나 이름이 달라지면 실패합니다.

### pico\_clean.sh

프로젝트 폴더 내의 build 폴더를 삭제합니다.

## LICENSE

기본적으로는 MIT 라이선스를 따릅니다만, 그냥 편하게 사용하시면 됩니다.
