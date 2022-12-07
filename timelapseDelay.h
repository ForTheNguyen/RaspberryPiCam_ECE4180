#ifndef TIMELAPSEDELAY_H
#define TIMELAPSEDELAY_H

#include <QObject>

class timelapseDelay : public QObject
{
    Q_OBJECT

private:
    int delay_val = 1000;

public:
    Q_INVOKABLE int getDelay() const { return delay_val; }
    Q_INVOKABLE int getDelayAdjusted() const { return delay_val/1000; }
    Q_INVOKABLE void addDelay() { delay_val += 1000; emit delayChanged(delay_val);}
    Q_INVOKABLE void subDelay() { delay_val -= 1000; if(delay_val<1000){delay_val=1000;} emit delayChanged(delay_val);}

signals:
    void delayChanged(int delay_value);

};

#endif // TIMELAPSEDELAY_H


