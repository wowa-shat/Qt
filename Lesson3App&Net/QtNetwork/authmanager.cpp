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
    QUrl url("http://127.0.0.1:59645/register");

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
        if (reply -> error() != QNetworkReply::NoError) {
            this -> registererError = reply -> errorString();
        }

        this -> onRegistererFinished();
        reply -> deleteLater();
    });
}

void AuthManager::onRegistererFinished()
{
    qDebug() << "Register error: " << this -> registererError;
    emit registererRequestCompleted(this -> registererError);
}

void AuthManager::authenticate(const QString &login, const QString &password)
{
    QUrl url ("http://127.0.0.1:59645/auth");

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
        if (reply -> error() != QNetworkReply::NoError) {
            this -> authenticateError = reply -> errorString();
        }
        else {
            QJsonObject obj = QJsonDocument::fromJson(reply -> readAll()).object();
            QString token = obj.value("token").toString();
            this -> token = token;
        }

        this->onAuthenticateFinished();
        reply -> deleteLater();
    });
}

void AuthManager::onAuthenticateFinished()
{
    qDebug() << "Auth error: " << this -> authenticateError;
    qDebug() << "Token: " << this -> getToken();
    emit registererRequestCompleted(this -> authenticateError);
}

QString AuthManager::getToken() {
    return this -> token;
}
