#ifndef MODEL_H
#define MODEL_H
#include "QObject"
#include "QAbstractListModel"

struct MyStruct
{
    QString myName;
    QString myDate;
};

class model : QAbstractListModel
{
    Q_OBJECT

    enum myRoles{
        nameRole = Qt::DisplayRole,
        dateRole
    };

public:
    model(QObject *parent = 0);

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    QHash<int, QByteArray> roleNames() const override;

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

private:
    QList<MyStruct> m_structs;
};

#endif // MODEL_H
