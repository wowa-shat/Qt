#ifndef SORT_H
#define SORT_H

#include <QObject>
#include <QString>
#include <QFile>

//Необходимо реализовать класс с функциональностью, описанной ниже:
//Классу через параметры функции передается две строки - пути к двум файлам.
//В первом файле лежат числа. В каждой строке по числу.
//Необходимо взять числа из файла, отсортировать по возрастанию и записать во второй файл.
//Класс должен испускать сигнал после финиша операции.

class Sort : public QObject
{
    Q_OBJECT
public:
    Sort(QObject *parent = 0);
    void SortNumbers();

private:
    QString urlNumbers;
    QString urlSortedNumber;

};

#endif // SORT_H
