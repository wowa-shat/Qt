#include "authmanager.h"
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QUrl>
#include <QJsonObject>
#include <QJsonDocument>
#include <QDebug>

AuthManager::AuthManager(QObject *parent) : QObject(parent)
{

}

void AuthManager::registerer(const QString &login, const QString &password)
{
    QUrl url("http://127.0.0.1:55999/register");

    QNetworkRequest requst(url);
    requst.setHeader(QNetworkRequest::ContentTypeHeader,
                     "application/json");
    QJsonObject body;
    body["login"] = login;
    body["password"] = password;
    QByteArray bodyData = QJsonDocument(body).toJson();

    QNetworkReply *reply = _net.post(requst, bodyData);

    connect(reply, &QNetworkReply::finished,
            [this, reply](){
        qDebug() << "Register error: " << reply -> errorString();
        emit registererRequestCompleted(reply->errorString());
        reply -> deleteLater();
    });
}

void AuthManager::authenticate(const QString &login, const QString &password)
{
    QUrl url ("http://127.0.0.1:55999/auth");

    QNetworkRequest request(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader,
                      "application/json");

    QJsonObject body;
    body ["login"] = login;
    body ["password"] = password;
    QByteArray bodyData = QJsonDocument(body).toJson();

    QNetworkReply *reply= _net.post(request, bodyData);

    connect(reply, &QNetworkReply::finished,
            [this, reply](){
            QJsonObject obj = QJsonDocument::fromJson(reply -> readAll()).object();
            QString token = obj.value("token").toString();
        qDebug() << "Auth error: " << reply -> errorString();
        qDebug() << "Token: " << token;
        emit authenticateRequestCompleted(reply -> errorString(), token);
        reply -> deleteLater();
    });
}
