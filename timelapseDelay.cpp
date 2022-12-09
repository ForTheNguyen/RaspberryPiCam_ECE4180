#include "timelapseDelay.h"

timelapseDelay::timelapseDelay(int clk_pin, int dt_pin, void (*isrInput)(int gpio_num, int level, uint32_t tick), QObject *parent) : QObject(parent)
{
    clk = clk_pin;
    dt = dt_pin;
    gpioInitialise();
    gpioSetMode(clk, PI_INPUT);
    gpioSetMode(dt, PI_INPUT);
    gpioGlitchFilter(clk, 300000);
    gpioSetISRFunc(clk, RISING_EDGE, 0, isrInput);

}

void timelapseDelay::isrCallback(int clk_pin, int dt_pin)
{
    clk = clk_pin;
    dt = dt_pin;
    int clkState = gpioRead(clk);
    int dtState = gpioRead(dt);

    if (clkState == 1)
    {
        if (dtState != clkState){
          delay_value -= 1000;
        } else if (dtState == clkState) {
          delay_value += 1000;
        }
        if(delay_value<1000){delay_value=1000;}
    }

    emit delayChanged(delay_value);
}
