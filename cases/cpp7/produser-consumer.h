#ifndef TIMER_H
#define TIMER_H

#include <QObject>
#include <QString>
#include <QTimer>


/*Первый класс: имеет сигнал о новом сообщение. Каждые несколько секунд (по таймеру)
класс должен испускать сообщение с произвольным текстовым сообщением.*/
class Producer : public QObject
{
    Q_OBJECT
public:
    Producer(QObject *parent = 0);

private:
    QTimer timer;

signals:
    void newMessage(QString);

public slots:
    void Mes();
};

/*Второй класс имеет слот с текстовым параметром.
  При вызове этого слова строка из параметра просто выводится в консоль.*/
class Consumer : public QObject
{
    Q_OBJECT
public:
    Consumer(QObject *parent = 0);

public slots:
    void toConsole(QString message);

};

#endif // TIMER_H
