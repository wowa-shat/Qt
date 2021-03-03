#include <sort.h>
#include <QCoreApplication>
#include <QObject>
#include <QDir>

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    Sort sort;
    sort.SortNumbers();

    return a.exec();
}
