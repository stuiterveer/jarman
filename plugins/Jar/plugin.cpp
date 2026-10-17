#include <QtQml>
#include <QtQml/QQmlContext>

#include "plugin.h"
#include "jar.h"

void JarPlugin::registerTypes(const char *uri) {
    qmlRegisterSingletonType<Jar>(uri, 0, 1, "Jar", [](QQmlEngine*, QJSEngine*) -> QObject* { return new Jar; });
}
