#include "gpio.h"
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <sys/types.h>
#include <unistd.h>
#include <QObject>
#include <pigpio.h>

gpio::gpio(int pin, int type, void (*isrInput)(int gpio_num, int level, uint32_t tick), QObject *parent) : QObject(parent)
{
    m_pin = pin;

    gpioInitialise();

    qDebug("gpioInitialised");

    switch(type)
    {
        case GPIO_INPUT:
        {
            gpioSetMode(m_pin, PI_INPUT);
            gpioSetPullUpDown(m_pin, PI_PUD_UP);
            gpioSetISRFunc(m_pin, RISING_EDGE, 0, isrInput);

        } break;
    }
}

void gpio::isrCallback()
{
    emit inputChanged(gpioRead(m_pin));
}

