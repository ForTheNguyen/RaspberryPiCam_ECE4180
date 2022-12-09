#ifndef TIMELAPSEDELAY_H
#define TIMELAPSEDELAY_H

#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <sys/types.h>
#include <unistd.h>
#include <QObject>
#include <pigpio.h>

class timelapseDelay : public QObject
{
    Q_OBJECT

public:
    explicit timelapseDelay(int clk_pin, int dt_pin, void (*isrInput)(int gpio_num, int level, uint32_t tick) = nullptr, QObject *parent = nullptr);
    void isrCallback(int clk_pin, int dt_pin);
    Q_INVOKABLE int getDelay() const { return delay_value; }
    Q_INVOKABLE void setDelay() { delay_value = 1000; emit delayChanged(delay_value);}
    Q_INVOKABLE int getDelayAdjusted() const { return delay_value/1000; }
    Q_INVOKABLE void addDelay() { delay_value += 1000; emit delayChanged(delay_value);}
    Q_INVOKABLE void subDelay() { delay_value -= 1000; if(delay_value<1000){delay_value=1000;} emit delayChanged(delay_value);}

private:
    int delay_value = 1000;
    int clk;
    int dt;

signals:
    void delayChanged(int delay_value);

};

#endif // TIMELAPSEDELAY_H


