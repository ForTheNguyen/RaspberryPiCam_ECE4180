#ifndef GPIO_H
#define GPIO_H

#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <sys/types.h>
#include <unistd.h>
#include <QObject>
#include <pigpio.h>

class gpio : public QObject
{
        Q_OBJECT
public:
    explicit gpio(int pb_pin, void (*isrInput)(int gpio_num, int level, uint32_t tick) = nullptr, QObject *parent = nullptr);
    void isrCallback();

private:
    int pb;

signals:
    void inputChanged(int value);

};

#endif // GPIO_H
