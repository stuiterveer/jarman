#include <QGuiApplication>
#include <QQuickView>
#include <QJsonDocument>
#include <QJsonObject>

int main(int argc, char *argv[])
{
    QGuiApplication *app = new QGuiApplication(argc, (char**)argv);
    app->setApplicationName("jarman.stuiterveer");

    QQuickView *view = new QQuickView();
    view->setSource(QUrl("qrc:/Main.qml"));
    view->setResizeMode(QQuickView::SizeRootObjectToView);
    view->show();

    return app->exec();
}
