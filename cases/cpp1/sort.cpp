#include "sort.h"
#include <QObject>
#include <QDebug>

//Необходимо реализовать класс с функциональностью, описанной ниже:
//Классу через параметры функции передается две строки - пути к двум файлам.
//В первом файле лежат числа. В каждой строке по числу.
//Необходимо взять числа из файла, отсортировать по возрастанию и записать во второй файл.
//Класс должен испускать сигнал после финиша операции.

Sort::Sort(QObject *parent) : QObject(parent)
{

}

void Sort::SortNumbers()
{
    QFile file_numbers("C:\\Users\\WOWA\\Documents\\cpp1\\numbers.txt");
    QFile file_sortedNumbers("C:\\Users\\WOWA\\Documents\\cpp1\\sorted_numbers.txt");
    QString numbers;
    QString sortedNumbers;

    if ((file_numbers.exists())&(file_numbers.open(QIODevice::ReadOnly)))
    {
        QString line;
        line = file_numbers.readLine();
        while(line[0].isNumber()){
            int i = 0;
            QString number;
            while (line[i].isNumber()) {
                number += line[i];
                i++;
            }
            numbers += number + " ";
            line = file_numbers.readLine();
        }
        file_numbers.close();
    }

    if ((file_sortedNumbers.exists())&(file_sortedNumbers.open(QIODevice::WriteOnly)))
    {
        const QString qString = numbers;
        QTextStream out(&file_sortedNumbers); out << qString;
        file_numbers.close();
    }
    qDebug() << numbers;
}
