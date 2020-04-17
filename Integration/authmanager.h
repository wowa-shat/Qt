#ifndef AUTHMANAGER_H
#define AUTHMANAGER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QString>

class AuthManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool autIsProcessing READ autIsProcessing WRITE autSetProcessing NOTIFY autProcessingChanged);
    Q_PROPERTY(bool regIsProcessing READ regIsProcessing WRITE regSetProcessing NOTIFY regProcessingChanged);
public:

    explicit AuthManager(QObject *parent = nullptr);

    Q_INVOKABLE void registerer(const QString &login,
                   const QString &password);

    Q_INVOKABLE void authenticate(const QString &login,
                      const QString &password);
    bool autIsProcessing();
    void autSetProcessing(bool value);
    bool regIsProcessing();
    void regSetProcessing(bool value);

private:
    QNetworkAccessManager _net;
    bool m_autIsProcessing;
    bool m_regIsProcessing;

signals:
    void registererRequestCompleted(QString message);
    void authenticateRequestCompleted(QString error, QString token);

    void autProcessingChanged(bool value);
    void regProcessingChanged(bool value);

};

#endif // AUTHMANAGER_H
