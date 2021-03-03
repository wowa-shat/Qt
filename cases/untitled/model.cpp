#include "model.h"

model::model(QObject *parent)
{
    m_structs.append(MyStruct{"Vova", "2132"});
}

int model::rowCount(const QModelIndex &parent) const
{
    return m_structs.size();
}

QHash<int, QByteArray> model::roleNames() const
{
    QHash<int, QByteArray> roleNames;
    roleNames[nameRole] = "name";
    roleNames[dateRole] = "date";
    return roleNames;
}

QVariant model::data(const QModelIndex &index, int role) const
{
    if (index.row() < 0 || index.row() >= m_structs.size()) return QVariant();

    switch(role){
    case nameRole:
        return m_structs[index.row()].myName;
    case dateRole:
        return m_structs[index.row()].myDate;
    }
}
