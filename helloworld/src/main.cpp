#include <stdio.h>
#include <pico/stdlib.h>
#include "main.hpp"
#include "lib_test.hpp"

int main()
{
    stdio_init_all();

    while (true) {
        printf("Hello world\n");
        sleep_ms(1000);
        printf(":D\n");
        sleep_ms(1000);
    }
}
