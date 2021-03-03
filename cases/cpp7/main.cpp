#include "produser-consumer.h"

#include <QCoreApplication>
#include <QObject>

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    Producer prod;
    Consumer cons;

    QObject::connect(&prod, &Producer::newMessage, &cons, &Consumer::toConsole);

    return a.exec();
}
