#include "jar.h"
#include <QProcess>
#include <QDir>
#include <QStandardPaths>

Jar::Jar() {
    ensureConfigDir();
}

void Jar::ensureConfigDir() {
    if (!QDir(QStandardPaths::writableLocation(QStandardPaths::AppConfigLocation)).exists()) {
        QDir().mkdir(QStandardPaths::writableLocation(QStandardPaths::AppConfigLocation));
    }
}

void Jar::run(int scaling) {
    QString installDir = QDir::currentPath();
    QDir::setCurrent(QStandardPaths::writableLocation(QStandardPaths::AppConfigLocation));
    QProcess process;
    QString java = installDir + "/runtime/bin/java";
    QString midletFile = "file://" + installDir + "/midlet.jar";
    QStringList arguments = {"-jar", installDir + "/freej2me.jar", midletFile, "320", "240", QString::number(scaling)};
    //process.execute(java, arguments);
}
