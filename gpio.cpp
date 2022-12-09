#include "gpio.h"

gpio::gpio(int pb_pin, void (*isrInput)(int gpio_num, int level, uint32_t tick), QObject *parent) : QObject(parent)
{
    pb = pb_pin;
    gpioInitialise();

    gpioSetMode(pb, PI_INPUT);
    gpioSetPullUpDown(pb, PI_PUD_UP);
    gpioGlitchFilter(pb, 300000);
    gpioSetISRFunc(pb, RISING_EDGE, 0, isrInput);
}

void gpio::isrCallback()
{
    emit inputChanged(gpioRead(pb));
}

