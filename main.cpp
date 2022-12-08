#include "gpio.h"
#include "timelapseDelay.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

static void isrInput1(int, int, uint32_t);
static void isrInput2(int, int, uint32_t);

//construct object to contain pushbutton
static gpio input1(16, isrInput1);
static timelapseDelay input2(20,21,isrInput2);


static void isrInput1(int gpio, int level, uint32_t tick)
{
    input1.isrCallback();
}

static void isrInput2(int gpio, int level, uint32_t tick)
{
    input2.isrCallback(20, 21);
}

static void err_handler (int sig)
{
    gpioTerminate();
    signal(SIGINT,SIG_DFL);
    kill(getppid(), SIGINT);
    kill(getpid(), SIGINT);
    exit(0);
}

static void exit_handler(void)
{
    gpioTerminate();
}

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    signal (SIGQUIT, err_handler);// CTL C and STOP button
    signal (SIGINT, err_handler); // GPIO exit & cleanup
    signal (SIGTERM, err_handler);
    signal (SIGABRT, err_handler);
    atexit(exit_handler); // exit handler cleanup

    //set up QML connection

    QQmlContext* ctx = engine.rootContext();
    ctx->setContextProperty("input1", &input1);
    ctx->setContextProperty("timelapseDelay", &input2);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
