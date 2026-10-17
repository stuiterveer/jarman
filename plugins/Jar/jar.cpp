#include "jar.h"
#include <QProcess>
#include <QDir>
#include <QStandardPaths>

Jar::Jar() {
    configDir = QStandardPaths::writableLocation(QStandardPaths::AppConfigLocation);
    ensureConfigDir();
}

void Jar::ensureConfigDir() {
    if (!QDir(configDir).exists()) {
        QDir().mkdir(configDir);
    }
}

void Jar::run(int scaling) {
    QString installDir = QDir::currentPath();
    QDir::setCurrent(configDir);
    QProcess process;
    QString java = installDir + "/runtime/bin/java";
    QString midletFile = "file://" + installDir + "/midlet.jar";
    QStringList arguments = {"-jar", installDir + "/freej2me.jar", midletFile, "240", "320", QString::number(scaling)};
    process.execute(java, arguments);
}
