#include "jar.h"
#include <QProcess>
#include <QDir>

Jar::Jar() {

}

void Jar::run(int scaling) {
    QDir::setCurrent("/home/phablet/.config/jarman.stuiterveer/");
    QProcess process;
    QString file = "/opt/click.ubuntu.com/jarman.stuiterveer/current/runtime/bin/java";
    QStringList arguments = {"-jar", "/opt/click.ubuntu.com/jarman.stuiterveer/current/freej2me.jar", "file:///opt/click.ubuntu.com/jarman.stuiterveer/current/midlet.jar", "320", "240", QString::number(scaling)};
    process.execute(file, arguments);
}
