#include "authmanager.h"
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QUrl>
#include <QJsonObject>
#include <QJsonDocument>
#include <QDebug>

AuthManager::AuthManager(QObject *parent) : QObject(parent)
{
    autSetProcessing(false);
    regSetProcessing(false);
}

void AuthManager::registerer(const QString &login, const QString &password)
{
    regSetProcessing(true);
    QUrl url("http://127.0.0.1:63301/register");

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
        emit registererRequestCompleted(reply->errorString());
        regSetProcessing(false);
        reply -> deleteLater();
    });
}

void AuthManager::authenticate(const QString &login, const QString &password)
{
    autSetProcessing(true);
    QUrl url ("http://127.0.0.1:63301/auth");

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
        emit authenticateRequestCompleted(reply -> errorString(), token);
        autSetProcessing(false);
        reply -> deleteLater();
    });
}

bool AuthManager::autIsProcessing()
{
    return m_autIsProcessing;
}

void AuthManager::autSetProcessing(bool value)
{
    if(m_autIsProcessing == value)
            return;
    m_autIsProcessing = value;
    emit autProcessingChanged(value);
}

bool AuthManager::regIsProcessing()
{
    return m_regIsProcessing;
}

void AuthManager::regSetProcessing(bool value)
{
    if(m_regIsProcessing == value)
            return;
    m_regIsProcessing = value;
    emit regProcessingChanged(value);
}
