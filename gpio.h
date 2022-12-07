#ifndef GPIO_H
#define GPIO_H

#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <sys/types.h>
#include <unistd.h>
#include <QObject>
#include <pigpio.h>

#define GPIO_INPUT 0
#define GPIO_OUTPUT 1

class gpio : public QObject
{
        Q_OBJECT
public:
    explicit gpio(int pin, int type, void (*isrInput)(int gpio_num, int level, uint32_t tick) = nullptr, QObject *parent = nullptr);
    void isrCallback();

private:
    int m_pin;

signals:
    void inputChanged(int value);

};

#endif // GPIO_H
