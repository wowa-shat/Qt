#ifndef AUTHMANAGER_H
#define AUTHMANAGER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QString>

class AuthManager : public QObject
{
    Q_OBJECT
public:
    QString authenticateError;
    QString registererError;

    explicit AuthManager(QObject *parent = nullptr);

    void registerer(const QString &login,
                   const QString &password);

    void authenticate(const QString &login,
                      const QString &password);

    QString getToken();

private slots:
    void onRegistererFinished();
    void onAuthenticateFinished();

signals:
    void registererRequestCompleted(QString);
    void authenticateRequestCompleted(QString);

private:
    QNetworkAccessManager _net;
    QString token;

};

#endif // AUTHMANAGER_H
