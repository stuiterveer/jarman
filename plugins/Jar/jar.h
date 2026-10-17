#ifndef JAR_H
#define JAR_H

#include <QObject>

class Jar: public QObject {
    Q_OBJECT

public:
    Jar();
    ~Jar() = default;

    Q_INVOKABLE void run(int scaling);
};

#endif
