#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QQmlContext>
#include "message.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    Message msg;
    engine.rootContext()->setContextProperty("msg",&msg);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    return app.exec();
}
