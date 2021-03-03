#include "produser-consumer.h"
#include <QTimer>
#include <QDebug>

Producer::Producer(QObject *parent) : QObject(parent)
{
    timer.setInterval(1000);
    connect(&timer, &QTimer::timeout, this,  &Producer::Mes);
    timer.start();
}

void Producer::Mes()
{
    QString message = "new";
    emit newMessage(message);
}

Consumer::Consumer(QObject *parent) : QObject(parent)
{

}

void Consumer::toConsole(QString message)
{
    qDebug() << message;
}
