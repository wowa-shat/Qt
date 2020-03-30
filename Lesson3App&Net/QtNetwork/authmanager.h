#ifndef AUTHMANAGER_H
#define AUTHMANAGER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QString>

class AuthManager : public QObject
{
    Q_OBJECT
public:

    explicit AuthManager(QObject *parent = nullptr);

    void registerer(const QString &login,
                   const QString &password);

    void authenticate(const QString &login,
                      const QString &password);

private:
    QNetworkAccessManager _net;

signals:
    void registererRequestCompleted(QString);
    void authenticateRequestCompleted(QString, QString);

};

#endif // AUTHMANAGER_H
