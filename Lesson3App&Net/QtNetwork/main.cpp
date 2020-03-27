#include <QCoreApplication>

#include <authmanager.h>

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    AuthManager auth;
    auth.registerer("vova2000",
                    "12345");

    auth.authenticate("vova2000",
                      "12345");

    return a.exec();
}
